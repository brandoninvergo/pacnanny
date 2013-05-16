# pacnanny

This is yet another wrapper script for `pacman`, the package manager
of Arch Linux and its various derivatives. Unlike other wrappers, this
script does not aim to make up for any perceived shortcomings in the
functionality of `pacman`. Instead, it aims to make up for
shortcomings in the users of `pacman`. The goal of `pacnanny` is to
make it even harder to mess up with `pacman` by making sure that you
do not miss anything important.

## Functionality

At present, `pacnanny` does the following:

* Before doing a system update, check for new Arch Linux news items
  since the last update and display them one at a time in the browser
  of your choosing (w3m by default). There is no confirmation. Your
  eyeballs are required to look at the news.
* Reprint all scriptlet messages together after an update is
  completed.
* Reprint all warnings again together after an update is completed.
* List new `.pacnew` and `.pacsave` files after an update is
  completed.
* Print a warning and ask for confirmation when using the `--force`
  option.
* Prompt for a reboot when the kernel has been upgraded.

All of these functions can be disabled in the configuration file,
`/etc/pacnanny.conf`, letting you customize the level of strictness.

## Usage

`pacnanny` is a thin wrapper that only looks at the arguments you pass
before passing them on and at the output that `pacman` produces. You
can simply use the `pacnanny` command in place of `pacman` and use all
the familiar arguments. So, to do a system update, you would do
`pacnanny -Syu`.

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
