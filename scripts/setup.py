#!/usr/bin/env python3
import argparse

from _describe import describe_package
from _install import install_packages, set_docker_registry
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
    parser = argparse.ArgumentParser()
    parser.add_argument("-v", "--verbose", action="store_true")
    args = parser.parse_args()

    if args.verbose:
        print(HEADER)
        print("Hello! Welcome to the Fedora Dotfiles setup.")
        print("Here are the packages that will be installed:\n")
        print_package_list()

    answer = (
        input(
            "\nThis will install enviroment packages. Would you like to continue? [y/N] "
        )
        .strip()
        .lower()
    )
    if answer == "y":
        set_docker_registry()
        install_packages(PACKAGES)
    else:
        print("Ight no worries, nothing installed.")


if __name__ == "__main__":
    main()
