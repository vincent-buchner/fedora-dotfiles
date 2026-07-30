#!/usr/bin/env python3
from pathlib import Path

from _describe import describe_package
from constants.packages import PACKAGES

SCRIPT_DIR = Path(__file__).parent
REPO_ROOT = SCRIPT_DIR.parent
BEFORE_DESC_PATH = SCRIPT_DIR / "static" / "section_1.md"
README_PATH = REPO_ROOT / "README.md"


def build_table(packages: list[str]) -> str:
    rows = [describe_package(pkg) for pkg in sorted(packages, key=str.lower)]
    lines = ["| Package | Description |", "| --- | --- |"]
    lines += [f"| {pkg} | {desc} |" for pkg, desc in rows]
    return "\n".join(lines)


def build_readme() -> str:
    before_desc = BEFORE_DESC_PATH.read_text().rstrip()
    table = build_table(PACKAGES)
    return f"{before_desc}\n\n### Documentation\n\nhello world\n\n{table}\n"


if __name__ == "__main__":
    README_PATH.write_text(build_readme())
