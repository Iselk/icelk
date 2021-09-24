# About

These are all my dotfiles, which can be used to complete a setup with Nvidia graphics and an AMD processor (amd-ucode, can be easily swapped with intel-ucode).

> Right, almost forgot, I use **Arch Linux**. Sorry, `i use arch btw` 😎

Removing the Nvidia packages, tweaking the Xorg config and changing the [ucode](https://wiki.archlinux.org/index.php/Microcode) should be enough to make it vendor agnostic.

> **Important**: Use Btrfs while installing Arch, not Ext4!

## Branches

To use this setup on multiple systems, I've got multiple branches.

A branch named `macos` is available in this repo for other macOS users. It uses `homebrew` for managing packages.

One named `laptop` is for a more light-weight install for a laptop using Intel graphics, with Intel microcode. It looks virtually the same.

# Major components

I use
- Btrfs
- i3 gaps
- picom (ibhagwan's fork)
- polybar
- dunst
- rofi
- Kitty
- NeoVim
- Firefox
- Brave
- paru
- spotifyd

# Installation

I have provided install scripts in the root of this directory. By default they will symlink to this directory.

- `install.sh` (run as user)
- `install-root.sh` (run as a superuser)
- `install-plymouth-themes.sh` (run as user, the script requests superuser privileges)
- `install-rust-analyzer.sh` (run as user, if you plan to edit Rust source code)
- `install-packages.sh` (run as user, the script requests superuser privileges)

**Note:** Also see [`other-installs`](other-installs.md) for the things I use which are not in the repos. I also recommend Firefox extensions here.

See [my drive layout](drive-layout.md) for info about backups.

> If you want to install one version permanently (making it harder to upgrade, as deleted files are left), change the line `alias l="ln -s"` to `alias l="cp"`.

Other instructions will be shown when running the scripts.

To install all the packages with Paru, follow the installation instructions from [their GitHub](https://github.com/Morganamilo/paru)
and run this in a Fish shell (or add a `$` before the parentheses in Bash).

> **Important:** To view the PKGBUILDs, you need to have [NvimPager](https://github.com/lucc/nvimpager) installed,
> as described in my [other installs](other-installs.md) document.
> It is set as the `$PAGER`, and not having it installed results in no output from Paru about PKGBUILDs.

```shell
$ paru -Suy (cat packages/installed.txt)
```

# Contribution

Well, these are my personal dot-files. If you notice any issues, please open an issue, but I don't think I'll accept PRs if they're not well justified.

Anyway, you can use this under the MIT license.
