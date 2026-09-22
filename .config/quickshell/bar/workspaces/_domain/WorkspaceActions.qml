pragma Singleton

import Quickshell
import Quickshell.Hyprland

Singleton {
    // This system's Hyprland build uses a custom Lua dispatch DSL instead of
    // stock Hyprland's plain "workspace <id>" dispatch string - confirmed by
    // testing directly against the IPC socket. hl.dsp.focus({workspace=N})
    // is the form that's actually accepted here.
    function switchTo(id) {
        Hyprland.dispatch("hl.dsp.focus({workspace=" + id + "})");
    }
}
