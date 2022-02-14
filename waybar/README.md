## Waybar

![Red waybar](https://user-images.githubusercontent.com/39676098/153702595-1b836a1c-1d31-44c1-bc3f-cf94d4cb28ac.png)

My personal Waybar config.

Instead of directly editing the `.css` file, I recommend using Sass and
edit the [`style.scss`](./_style.scss) and `_colors.scss` files instead. This allows you for example, to
change the entire color of the bar with just one variable change.

[Install the latest version of Sass](https://github.com/sass/dart-sass/releases)
and run this in the `waybar/` directory so that the CSS file will be automatically updated as you edit the Sass files:

```sass --watch . --no-source-map```

By just editing the `$bg` value in [`_colors.scss`](./_colors.scss), you can get an entirely different color:

![Orange waybar](https://user-images.githubusercontent.com/39676098/153702593-fc17a027-25c4-4ba3-989b-f43a71fc2f74.png)
![Green waybar](https://user-images.githubusercontent.com/39676098/153702590-aa256ff6-7fa3-445e-b1f9-4dc851399659.png)
![Blue waybar](https://user-images.githubusercontent.com/39676098/153702589-854d4c15-348a-49cb-816c-dc9192f21915.png)
![Purple waybar](https://user-images.githubusercontent.com/39676098/153702586-c74292d9-0c78-4396-8038-2b7f77bab677.png)


## Fonts

If the River workspace fonts don't show up, you need to download the specific Japanese font, Han Sans JP.
The command for this on Arch/Arch-based systems should be `sudo pacman -S adobe-source-han-sans-jp-fonts` .

## Dependencies

For the GitHub download stats counter to work, you need to have Python 3 installed and also the Requests library.
Install it with `pip install requests`. You also need mpd installed AND running for the modules at the center.
