#!/usr/bin/env python3
"""Generate the Fluorine geometric icon theme.

Every icon is drawn on a 24x24 grid with square caps and mitred joins. Primary
geometry uses a 1.5px #E2E8F0 stroke; the single active detail uses a 2px
#B4F03A stroke or fill. The -symbolic variants replace both colors with
currentColor so GTK, Waybar, and other toolkit surfaces can recolor them.

Run from the repository root:

    python3 tools/generate-icons.py
"""

from pathlib import Path
import shutil

ROOT = Path(__file__).resolve().parent.parent
THEME = ROOT / "icons" / "Fluorine"
COLORS = {"primary": "#E2E8F0", "accent": "#B4F03A"}
GRID = 24


def el(tag, tone, stroke_width=None, **attrs):
    return {"tag": tag, "tone": tone, "width": stroke_width, "attrs": attrs}


def rect(tone, x, y, width, height, stroke=None):
    return el("rect", tone, stroke, x=x, y=y, width=width, height=height)


def line(tone, x1, y1, x2, y2, stroke=None):
    return el("line", tone, stroke, x1=x1, y1=y1, x2=x2, y2=y2)


def path(tone, d, stroke=None):
    return el("path", tone, stroke, d=d)


def polyline(tone, points, stroke=None):
    return el("polyline", tone, stroke, points=points)


def polygon(tone, points, stroke=None):
    return el("polygon", tone, stroke, points=points)


def circle(tone, cx, cy, r, stroke=None):
    return el("circle", tone, stroke, cx=cx, cy=cy, r=r)


ICONS = {
    # System control: a 2x2 control matrix with the active cell in lime.
    "flr-ctl": (
        "actions",
        [
            rect("primary", 3.5, 3.5, 7, 7, 1.5),
            rect("primary", 13.5, 3.5, 7, 7, 1.5),
            rect("primary", 3.5, 13.5, 7, 7, 1.5),
            rect("accent", 13.5, 13.5, 7, 7, 2),
        ],
    ),
    # Workstation mode: one display split into a resting and an active pane.
    "flr-mode": (
        "actions",
        [
            rect("primary", 3.5, 4.5, 17, 12, 1.5),
            line("primary", 12, 16.5, 12, 20.5, 1.5),
            line("primary", 8, 20.5, 16, 20.5, 1.5),
            line("accent", 12, 4.5, 12, 16.5, 2),
        ],
    ),
    # Snapshot manager: a timeline with a selected snapshot marker.
    "flr-snapshot": (
        "actions",
        [
            line("primary", 6.5, 3.5, 6.5, 20.5, 1.5),
            line("primary", 6.5, 6.5, 10.5, 6.5, 1.5),
            line("primary", 6.5, 12, 10.5, 12, 1.5),
            line("primary", 6.5, 17.5, 10.5, 17.5, 1.5),
            rect("accent", 12, 9, 6, 6, 2),
        ],
    ),
    # Shader toggle: a prism crossed by one lime beam.
    "flr-shader": (
        "actions",
        [
            path("primary", "M12 3.5 L20.5 20.5 L3.5 20.5 Z", 1.5),
            line("accent", 4.5, 13.5, 19.5, 13.5, 2),
        ],
    ),
    # Wallpaper switcher: a framed horizon with a lime sun.
    "flr-wall": (
        "actions",
        [
            rect("primary", 3.5, 4.5, 17, 15, 1.5),
            polyline("primary", "6.5,16.5 10,12.5 13,15 15.5,10.5 19.5,16.5", 1.5),
            rect("fill-accent", 16.5, 6.5, 2.5, 2.5),
        ],
    ),
    # Terminal: a prompt chevron and a resting cursor line.
    "kitty": (
        "apps",
        [
            rect("primary", 3.5, 4.5, 17, 15, 1.5),
            polyline("accent", "7.5,9.5 10.5,12.5 7.5,15.5", 2),
            line("primary", 13, 15.5, 17, 15.5, 1.5),
        ],
    ),
    # File manager: a folder with a lime tab.
    "thunar": (
        "apps",
        [
            path("primary", "M3.5 8.5 H9.5 L11.5 10.5 H20.5 V19.5 H3.5 Z", 1.5),
            path("accent", "M3.5 8.5 H9.5 L11.5 10.5", 2),
        ],
    ),
    # Browser: a meridian globe with a lime equator.
    "browser": (
        "apps",
        [
            circle("primary", 12, 12, 8.5, 1.5),
            path("primary", "M12 3.5 C8.5 7.5 8.5 16.5 12 20.5", 1.5),
            path("primary", "M12 3.5 C15.5 7.5 15.5 16.5 12 20.5", 1.5),
            line("accent", 3.5, 12, 20.5, 12, 2),
        ],
    ),
    # Settings: three sliders with the selected control in lime.
    "flr-settings": (
        "apps",
        [
            line("primary", 3.5, 7, 20.5, 7, 1.5),
            line("primary", 3.5, 12, 20.5, 12, 1.5),
            line("primary", 3.5, 17, 20.5, 17, 1.5),
            rect("primary", 14, 5.5, 3, 3, 1.5),
            rect("accent", 7, 10.5, 3, 3, 2),
            rect("primary", 15, 15.5, 3, 3, 1.5),
        ],
    ),
    # System doctor: a shield with a lime medical cross.
    "flr-doctor": (
        "apps",
        [
            path("primary", "M4.5 3.5 H19.5 V14.5 L12 20.5 L4.5 14.5 Z", 1.5),
            line("accent", 12, 7, 12, 15, 2),
            line("accent", 8, 11, 16, 11, 2),
        ],
    ),
    # Power profile: the standard power ring with a lime stem.
    "flr-power": (
        "status",
        [
            path("primary", "M7.8 6.3 A7 7 0 1 0 16.2 6.3", 1.5),
            line("accent", 12, 3.5, 12, 10.5, 2),
        ],
    ),
    # Network: three ascending signal bars with the strongest in lime.
    "flr-network": (
        "status",
        [
            line("primary", 3.5, 20.5, 20.5, 20.5, 1.5),
            line("primary", 5.5, 20.5, 5.5, 16.5, 1.5),
            line("primary", 11.5, 20.5, 11.5, 11.5, 1.5),
            line("accent", 17.5, 20.5, 17.5, 6.5, 2),
        ],
    ),
    # Bluetooth: the rune with a lime center node.
    "flr-bluetooth": (
        "status",
        [
            line("primary", 12, 3.5, 12, 20.5, 1.5),
            polyline("primary", "12,3.5 18,8.5 6,16.5", 1.5),
            polyline("primary", "12,20.5 18,15.5 6,7.5", 1.5),
            rect("fill-accent", 10.5, 10.5, 3, 3),
        ],
    ),
    # Audio: a speaker with one lime output arc.
    "flr-audio": (
        "status",
        [
            polygon("primary", "4.5,9.5 8.5,9.5 13.5,5.5 13.5,18.5 8.5,14.5 4.5,14.5", 1.5),
            path("accent", "M16 9 A4.5 4.5 0 0 1 16 15", 2),
        ],
    ),
    # Battery: an outlined cell with a lime charge level.
    "flr-battery": (
        "status",
        [
            rect("primary", 3.5, 7.5, 15, 9, 1.5),
            rect("primary", 19, 10.5, 2, 3, 1.5),
            rect("fill-accent", 6, 10, 7, 4),
        ],
    ),
    # Display layout: one monitor with a lime scan line.
    "flr-display": (
        "actions",
        [
            rect("primary", 3.5, 4.5, 17, 12, 1.5),
            line("primary", 12, 16.5, 12, 20.5, 1.5),
            line("primary", 8, 20.5, 16, 20.5, 1.5),
            line("accent", 6.5, 10.5, 17.5, 10.5, 2),
        ],
    ),
    # Keybindings: a keyboard with a lime space bar.
    "flr-keys": (
        "actions",
        [
            rect("primary", 2.5, 6.5, 19, 11, 1.5),
            line("primary", 6, 9.5, 6, 11.5, 1.5),
            line("primary", 9.5, 9.5, 9.5, 11.5, 1.5),
            line("primary", 13, 9.5, 13, 11.5, 1.5),
            line("primary", 16.5, 9.5, 16.5, 11.5, 1.5),
            line("accent", 8, 14.5, 16, 14.5, 2),
        ],
    ),
    # Lock: a padlock with a lime keyhole.
    "flr-lock": (
        "actions",
        [
            path("primary", "M8.5 10.5 V8.5 A3.5 3.5 0 0 1 15.5 8.5 V10.5", 1.5),
            rect("primary", 5.5, 10.5, 13, 9.5, 1.5),
            circle("fill-accent", 12, 14.5, 1.5),
            line("accent", 12, 16, 12, 17.5, 2),
        ],
    ),
    # Suspend: a pause symbol with a lime base rule.
    "flr-suspend": (
        "actions",
        [
            rect("primary", 7.5, 5.5, 3, 13, 1.5),
            rect("primary", 13.5, 5.5, 3, 13, 1.5),
            line("accent", 7.5, 20.5, 16.5, 20.5, 2),
        ],
    ),
    # Reboot: a circular arrow with a lime head.
    "flr-reboot": (
        "actions",
        [
            path("primary", "M18.5 7.5 A7.5 7.5 0 1 1 12 4.5", 1.5),
            polyline("accent", "15.5,6.5 18.5,7.5 17.5,10.5", 2),
        ],
    ),
    # Shut down: a door with a lime exit arrow.
    "flr-poweroff": (
        "actions",
        [
            rect("primary", 5.5, 3.5, 13, 17, 1.5),
            line("accent", 10, 12, 19, 12, 2),
            polyline("accent", "16,9 19,12 16,15", 2),
        ],
    ),
    # System monitor: axes with a lime trend line.
    "flr-monitor": (
        "actions",
        [
            line("primary", 4.5, 3.5, 4.5, 20.5, 1.5),
            line("primary", 4.5, 20.5, 20.5, 20.5, 1.5),
            polyline("accent", "7,16 10,12 13,14 17,7", 2),
        ],
    ),
    # Clock: a dial with a resting hour hand and a lime minute hand.
    "flr-clock": (
        "status",
        [
            circle("primary", 12, 12, 8.5, 1.5),
            line("primary", 12, 12, 12, 7, 1.5),
            line("accent", 12, 12, 16.5, 12, 2),
            circle("fill-accent", 12, 12, 1),
        ],
    ),
    # Update: a download arrow above a tray.
    "flr-update": (
        "actions",
        [
            path("primary", "M4.5 15.5 V20.5 H19.5 V15.5", 1.5),
            line("accent", 12, 3.5, 12, 14.5, 2),
            polyline("accent", "8.5,11 12,14.5 15.5,11", 2),
        ],
    ),
}


INDEX_THEME = """[Icon Theme]
Name=Fluorine
Comment=Geometric system icons for FluorineOS
Inherits=Adwaita,hicolor
Example=flr-ctl
Directories=scalable/actions,scalable/apps,scalable/status

[scalable/actions]
Context=Actions
Size=24
MinSize=16
MaxSize=512
Type=Scalable

[scalable/apps]
Context=Applications
Size=24
MinSize=16
MaxSize=512
Type=Scalable

[scalable/status]
Context=Status
Size=24
MinSize=16
MaxSize=512
Type=Scalable
"""


def fmt(value):
    if isinstance(value, float) and value.is_integer():
        return str(int(value))
    return str(value)


def render(elements, symbolic):
    lines = [
        '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" '
        'viewBox="0 0 24 24">',
        '  <g fill="none" stroke-linecap="square" stroke-linejoin="miter">',
    ]

    for element in elements:
        tag = element["tag"]
        tone = element["tone"]
        attrs = " ".join(
            '{}="{}"'.format(key, fmt(value))
            for key, value in element["attrs"].items()
        )

        if tone.startswith("fill-"):
            color = "currentColor" if symbolic else COLORS[tone[5:]]
            lines.append(
                '    <{} {} fill="{}" stroke="none"/>'.format(tag, attrs, color)
            )
        else:
            color = "currentColor" if symbolic else COLORS[tone]
            width = element["width"] if element["width"] is not None else 1.5
            lines.append(
                '    <{} {} stroke="{}" stroke-width="{}"/>'.format(
                    tag, attrs, color, fmt(width)
                )
            )

    lines.extend(["  </g>", "</svg>", ""])
    return "\n".join(lines)


def write_icon(name, directory, elements):
    for suffix, symbolic in (("", False), ("-symbolic", True)):
        target = THEME / "scalable" / directory / (name + suffix + ".svg")
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(render(elements, symbolic), encoding="ascii", newline="\n")


def write_aliases():
    aliases = {
        "apps/org.xfce.thunar.svg": "apps/thunar.svg",
        "apps/org.xfce.thunar-symbolic.svg": "apps/thunar-symbolic.svg",
        "apps/web-browser.svg": "apps/browser.svg",
        "apps/web-browser-symbolic.svg": "apps/browser-symbolic.svg",
    }
    for destination, source in aliases.items():
        shutil.copyfile(THEME / "scalable" / source, THEME / "scalable" / destination)


def main():
    for directory in ("actions", "apps", "status"):
        (THEME / "scalable" / directory).mkdir(parents=True, exist_ok=True)

    for name, (directory, elements) in ICONS.items():
        write_icon(name, directory, elements)

    write_aliases()
    (THEME / "index.theme").write_text(INDEX_THEME, encoding="ascii", newline="\n")
    print("wrote {} icons to {}".format(len(ICONS) * 2, THEME))


if __name__ == "__main__":
    main()
