import subprocess


def install_packages(packages: list[str]):
    subprocess.run(["sudo", "dnf", "install", *packages], check=False)
