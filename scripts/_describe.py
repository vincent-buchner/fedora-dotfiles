import re
import subprocess

# Valid seperate between the name and the description
NAME_SEPARATOR = re.compile(r"\s+[-‐‑‒–—―]\s+")


def describe_package(pkg: str) -> tuple[str, str]:
    # Get the man pages
    man_result = subprocess.run(
        ["man", pkg],
        capture_output=True,
        text=True,
        check=False,
    )
    # Strip the man page to raw string, normalizing
    # special characters
    plain = subprocess.run(
        ["col", "-b"],
        input=man_result.stdout,
        capture_output=True,
        text=True,
        check=False,
    ).stdout

    # Iterate through all the lines
    name_lines = []
    in_name = False
    for line in plain.splitlines():
        # Flags when we have entered the "NAME"
        # section with the description in next line
        if line.strip() == "NAME":
            in_name = True
            continue
        if in_name:
            # Break out on empty line
            if line and not line[0].isspace():
                break
            if line.strip():
                name_lines.append(line.strip())

    # Parse out the description
    name_text = " ".join(name_lines)
    parts = NAME_SEPARATOR.split(name_text, maxsplit=1)
    desc = parts[1] if len(parts) > 1 else ""
    return pkg, desc
