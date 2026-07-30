#!/usr/bin/env python3
from _describe import describe_package
from _install import install_packages
from constants.packages import PACKAGES

HEADER = """
▗▄▄▄▖▗▄▄▄▖▗▄▄▄  ▗▄▖ ▗▄▄▖  ▗▄▖     ▗▄▄▄  ▗▄▖▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖   ▗▄▄▄▖ ▗▄▄▖
▐▌   ▐▌   ▐▌  █▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌    ▐▌  █▐▌ ▐▌ █  ▐▌     █  ▐▌   ▐▌   ▐▌
▐▛▀▀▘▐▛▀▀▘▐▌  █▐▌ ▐▌▐▛▀▚▖▐▛▀▜▌    ▐▌  █▐▌ ▐▌ █  ▐▛▀▀▘  █  ▐▌   ▐▛▀▀▘ ▝▀▚▖
▐▌   ▐▙▄▄▖▐▙▄▄▀▝▚▄▞▘▐▌ ▐▌▐▌ ▐▌    ▐▙▄▄▀▝▚▄▞▘ █  ▐▌   ▗▄█▄▖▐▙▄▄▖▐▙▄▄▖▗▄▄▞▘



"""


def print_package_list() -> None:
    for pkg in PACKAGES:
        _, desc = describe_package(pkg)
        print(f"{pkg} - {desc}" if desc else pkg)


def main() -> None:
    print(HEADER)
    print("Hello! Welcome to the Fedora Dotfiles setup.")
    print("Here are the packages that will be installed:\n")
    print_package_list()

    answer = input("\nWould you like to continue? [y/N] ").strip().lower()
    if answer == "y":
        install_packages(PACKAGES)
    else:
        print("Ight no worries, nothing installed.")


if __name__ == "__main__":
    main()
