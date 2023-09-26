local create_command = require("core.utils").create_command

create_command("J", "Git <args>")

create_command("Ja", "Git add <args>")
create_command("Jaa", "Git add . <args>")
create_command("Jab", "Git add % <args>")
create_command("Jrm", "Git rm <args>")
create_command("Jm", "Git commit <args>")
create_command("Jma", "Git commit --all <args>")

create_command("Jps", "Git push <args>")
create_command("Jpl", "Git pull <args>")
create_command("Jf", "Git fetch <args>")

create_command("Jrs", "Git restore <args>")
create_command("Jrss", "Git restore --staged <args>")

create_command("Jpsu", "Git push -u origin main <args>")

create_command("Jr", "Git remote <args>")
create_command("Jrv", "Git remote --verbose <args>")
create_command("Jrao", "Git remote add origin <args>")
create_command("Jrso", "Git remote set-url origin <args>")

create_command("Js", "Git status <args>")
create_command("Jl", "Git log <args>")
create_command("Jd", "Git diff <args>")
create_command("Jds", "Git diff --staged <args>")
create_command("Jd1", "Git diff diff HEAD~1 <args>")
create_command("Jd2", "Git diff diff HEAD~2 <args>")
create_command("Jd3", "Git diff diff HEAD~3 <args>")

create_command("Jb", "Git branch <args>")
create_command("Jc", "Git checkout <args>")
