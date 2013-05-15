# pacnanny

This is yet another wrapper script for `pacman`, the package manager
of Arch Linux and its various derivatives. Unlike other wrappers, this
script does not aim to make up for any perceived shortcomings in the
functionality of `pacman`. Instead, it aims to make up for
shortcomings in the users of `pacman`. The goal of `pacnanny` is to
make it even harder to mess up a system update with `pacman` by making
sure that you do not miss anything important.

## Functionality

`pacnanny` currently only wraps the system-update function of `pacman`
(`-Syu`). At present, `pacnanny` does precisely three things:

* Check for new Arch Linux news items since the last update and
  display them one at a time in the browser of your choosing. There is
  no confirmation or option to skip this. Your eyeballs are required
  to look at the news.
* Reprint all warnings again together after the update is completed.
* List new `.pacnew` and `.pacsave` files.

Basically, just run `pacnanny` instead of `pacman -Syu`. Use plain old
`pacman` for everything else (installing/removing packages, etc.).

## Justification

As careful as I try to be when I run `pacman -Syu`, I still
occasionally miss things, particularly during large updates that
produce a lot of text. Important warnings sometimes slip between the
cracks, causing me to miss an important new `.pacnew` file, for
example. As for the news, I do subscribe to the RSS feed but sometimes
I update the system before opening my newsreader. This forces me to
see the news first.

## Contributing

Are there other places that we can help the user avoid shooting
himself in the foot? I'm open to ideas. Contributions are welcome as
long as they stick to the basic idea of only trying to correct/prevent
user-error/carelessness. Also, I'm not great at shell scripting, so
please point out any mistakes or places for improvement.

## Author

Brandon Invergo - <brandon@invergo.net>
