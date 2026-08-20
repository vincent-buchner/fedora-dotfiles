
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

### How to Install Packages

To install the dependencies, you must first have `python` installed. This should come with your Fedora install, but in case it doesn't, you can do:

```bash
sudo dnf install python3
```

Then you can install the packages using the setup script:

```bash
./scripts/setup.py
```

### How to Add New Packages

It's pretty easy, just add the name of the package to the `PACKAGES` constant in `/scripts/constants/packages.py`

> NOTE: for the Docker install, you still need to add the daemon to run on start. You can run the following command from [their docs](https://docs.docker.com/engine/install/fedora/#install-docker-engine) to do so:

```bash
sudo systemctl enable --now docker
```

### How to Update README

Just like how you install the packages, just a different script. Ensure `python` is installed:

```bash
sudo dnf install python3
```

Then you can run this script that will update the readme:

```bash
./scripts/build_readme.py
```

New sections can be added in the `static` directory inside of scripts.

### Why did you write the scripts in Python and not BASH?

It was easier for what I wanted to do.
### Documentation
These are the packages installed as part of the environment.
The descriptions for each package come from the man page descriptions.
| Package | Description |
| --- | --- |
| cargo | The Rust package manager |
| cava |  |
| containerd.io |  |
| dbus-devel |  |
| docker-buildx-plugin |  |
| docker-ce |  |
| docker-ce-cli |  |
| docker-compose-plugin |  |
| fd | find entries in the filesystem |
| fish | the friendly interactive shell |
| fzf | a command-line fuzzy finder |
| gcc-c++ |  |
| gh | GitHub CLI |
| gitleaks |  |
| golang |  |
| htop | interactive process viewer |
| kitty |  |
| libxcb-devel |  |
| ncurses-devel |  |
| neovim |  |
| nodejs |  |
| openssl-devel |  |
| portaudio-devel |  |
| pulseaudio-libs-devel |  |
| python3 | an interpreted, interactive, object-oriented programming language |
| ripgrep |  |
| rust |  |
| stow | manage farms of symbolic links |
| tldr | tldr 3.4.4 Python command line client for tldr usage: tldr command [options] |
| tmux | terminal multiplexer |
| uv |  |
| zoxide | a smarter cd command |
