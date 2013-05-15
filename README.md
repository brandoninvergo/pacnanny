# pacnanny

This is yet another wrapper script for `pacman`, the package manager
of Arch Linux and its various derivatives. Unlike other wrappers, this
script does not aim to make up for any shortcomings in the
functionality of `pacman`. Instead, it aims to make up for
shortcomings in the users of `pacman`. `pacnanny` only wraps the
system update function of `pacman` (`-Syu`).

## Functionality

At present, `pacnanny` does precisely three things:

* Check for new Arch Linux news items since the last update and
  display them one at a time in the browser of your choosing. There is
  no confirmation or option to skip this. Your eyeballs are required
  to look at the news.
* Reprint all warnings again all together after the update is
  completed.
* List new `.pacnew` and `.pacsave` files.

## Justification

As careful as I try to be when I run `pacman -Syu`, I still
occasionally miss things, particularly during large updates that
produce a lot of text. Important warnings sometimes slip between the
cracks, causing you to miss an important new `.pacnew` file, for
example. As for the news, I do subscribe to the RSS feed but sometimes
I update the system before opening my newsreader. This forces me to
see the news first.

## Contributing

I'm not great at shell scripting, so contributions are welcome as long
as they stick to the basic idea of only trying to correct/prevent
user-error/carelessness.

## Author

Brandon Invergo <brandon@invergo.net>
