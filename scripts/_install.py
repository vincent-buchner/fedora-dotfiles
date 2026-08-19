import subprocess


def set_docker_registry():
    result = subprocess.run(
        ["dnf", "repolist", "docker-ce-stable"],
        check=False,
        capture_output=True,
        text=True,
    )
    if "docker-ce-stable" in result.stdout:
        return

    subprocess.run(
        [
            "sudo",
            "dnf",
            "config-manager",
            "addrepo",
            "--from-repofile",
            "https://download.docker.com/linux/fedora/docker-ce.repo",
        ],
        check=False,
    )


def install_packages(packages: list[str]):
    subprocess.run(["sudo", "dnf", "install", *packages], check=False)
