# Fedora Linux Dotfiles

This is my collection of tools I use for my daily driving machines.

### Backstory

Believe it or not, the machine I am working on right now is not my first machine. I have a collection of machines, some better than others. Most of them, when I found them, were drowning in Windows.

The first thing I do when I find a machine like this is restore it with a fresh install of some Linux distro, and usually that is Fedora. I have gone with Ubuntu and Arch in the past, but Fedora has just always felt like the sweet spot.

### Why This Repo Exists

Now, my issue with having all those crappy machines is that I have to go ring around the rosey again and again just to install the same software on each and every single one of them.

Today (hopefully) that will stop. With this repo, I'm looking to set up a reproducible environment that I can take across all my machines.

Will it be perfect? No. Will it have everything? Probably not. But it will provide a good base of software that I know I will continue to use for development, which is good enough for me.

### Current Hardware

I am currently using this setup with a Lenovo ThinkPad T14 Ryzen Pro 7 I picked up off of eBay. It's been treating me well so far, and I'm looking forward to the development work on it!

### Gitleaks

I have this setup with gitleaks, so if you would like to set up that forking to your own version, just run the following command in the root of this cloned repo:

```bash
git config core.hooksPath .githooks
```

It does require gitleaks to be installed, so you'll wanna do that.

### Related Repositories

Oh, this does not include my tmux and neovim configs. Those can be found at these repos:

- [vincentmux](https://github.com/vincent-buchner/vincentmux)
- [neo-vimcent-v2](https://github.com/vincent-buchner/neo-vimcent-v2)

### Documentation

> A full man page of the packages installed soon to come.
