#!/bin/python3

import json
import subprocess
import sys
from dataclasses import dataclass
from enum import Enum
from typing import Dict, Final, List, Union


class EventType(Enum):
    WORKSPACE = "workspace"
    FOCUSED_MON = "focusedmon"
    ACTIVE_WINDOW = "activewindow"
    FULLSCREEN = "fullscreen"
    MONITOR_REMOVED = "monitorremoved"
    MONITOR_ADDED = "monitoradded"
    CREATE_WORKSPACE = "createworkspace"
    DESTROY_WORKSPACE = "destroyworkspace"
    MOVE_WORKSPACE = "moveworkspace"
    ACTIVE_LAYOUT = "activelayout"
    OPEN_WINDOW = "openwindow"
    CLOSE_WINDOW = "closewindow"
    MOVE_WINDOW = "movewindow"
    OPEN_LAYER = "openlayer"
    CLOSE_LAYER = "closelayer"
    SUBMAP = "submap"


class Event:
    def __init__(self, socket_message: str):
        self.type: "EventType"

        split_socket_message = socket_message.split(">>")
        if len(split_socket_message) != 2:
            raise ValueError(
                f"Socket message is of invalid format: it must be 'EVENT>>DATA', not '{socket_message}'"
            )
        raw_event_type: str = split_socket_message[0]

        name_member_pairs: List[tuple[str, str]] = [
            (event_type.value, event_type.name) for event_type in EventType
        ]

        for event_name, enum_member_name in name_member_pairs:
            if raw_event_type == event_name:
                self.type = getattr(EventType, enum_member_name)
                return

        raise ValueError(
            f"Event type name is not documented in Hyprland events list: '{raw_event_type}'"
        )


@dataclass
class Monitor:
    id: int
    name: str
    active_workspace_id: int


@dataclass
class Workspace:
    id: int
    has_fullscreen: bool


class FailedCommandException(Exception):
    ...


class UnexpectedApiChangeException(Exception):
    ...


class HyprctlWrapper:
    def __init__(self):
        ...

    def _run_command(self, *args: str) -> bytes:
        pipe = subprocess.Popen(["hyprctl", *args, "-j"], stdout=subprocess.PIPE)

        output_text = pipe.communicate()[0]
        status_code = pipe.returncode

        # If hyprctl can't connect to the Hyprland session socket,
        # it somehow doesn't return a non-zero error status code so we
        # have to check for it manually
        is_connection_not_working = output_text.startswith(b"Couldn't connect to")

        if status_code != 0:
            raise FailedCommandException(
                f"Command returned a status code of {status_code}"
            )
        elif is_connection_not_working:
            raise FailedCommandException(output_text.decode("utf-8"))

        return output_text

    def _get_command_json(self, *args: str) -> Union[List[Dict], Dict]:
        output_text = self._run_command(*args)
        return json.loads(output_text)

    @property
    def active_monitor(self) -> Monitor:
        raw_monitors = self._get_command_json("monitors")
        if isinstance(raw_monitors, dict):
            raise UnexpectedApiChangeException()

        for raw_monitor in raw_monitors:
            if raw_monitor["focused"]:
                return Monitor(
                    id=raw_monitor["id"],
                    name=raw_monitor["name"],
                    active_workspace_id=raw_monitor["activeWorkspace"]["id"],
                )

        raise Exception("There is no active monitor.")

    @property
    def active_workspace(self) -> Workspace:
        raw_workspaces = self._get_command_json("workspaces")
        if isinstance(raw_workspaces, dict):
            raise UnexpectedApiChangeException()

        for raw_workspace in raw_workspaces:
            if raw_workspace["id"] == self.active_monitor.active_workspace_id:
                return Workspace(
                    id=raw_workspace["id"],
                    has_fullscreen=raw_workspace["hasfullscreen"],
                )

        raise Exception("There is no active workspace.")

    @property
    def vfr_status(self) -> bool:
        raw_option = self._get_command_json("getoption", "misc:no_vfr")
        if isinstance(raw_option, list):
            raise UnexpectedApiChangeException()

        no_vfr: int = raw_option["int"]

        is_vfr_active = no_vfr == 0
        if is_vfr_active:
            return True
        else:
            return False

    @vfr_status.setter
    def vfr_status(self, status: bool):
        if status is True:
            self._run_command("keyword", "misc:no_vfr", "0")
        else:
            self._run_command("keyword", "misc:no_vfr", "1")


def main() -> int:
    GAMING_MONITOR_NAME: Final[str] = "DP-3"

    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} [hypr socket event message]")
        return 1

    try:
        event = Event(sys.argv[1])
    except Exception as error:
        print(f"error: {error}")
        return 1

    events_to_trigger_vfr_toggle = [
        EventType.WORKSPACE,
        EventType.FOCUSED_MON,
        EventType.FULLSCREEN,
    ]

    if event.type not in events_to_trigger_vfr_toggle:
        return 0

    hyprland = HyprctlWrapper()

    if (
        hyprland.active_monitor.name == GAMING_MONITOR_NAME
        and hyprland.active_workspace.has_fullscreen
    ):
        hyprland.vfr_status = True
    else:
        hyprland.vfr_status = False

    return 0


if __name__ == "__main__":
    exit(main())
