pragma Singleton

import Quickshell

Singleton {
    // DesktopEntries scans .desktop files asynchronously, so applications.values
    // keeps growing after startup. heuristicLookup() is a plain function call, which
    // QML's binding system can't observe - so a binding like
    // `icon.source: DesktopEntrySource.lookup("firefox")` would run once and get
    // stuck with whatever it returned, even if firefox turns up moments later.
    //
    // scannedCount is a real property, so anything reading it becomes dependent on
    // it. lookup() reads it (the value itself is unused) purely so every binding
    // that calls lookup() inherits that dependency and re-runs when the scan grows.
    //
    // Example:
    //   t=0s  scan has found 3 apps.  lookup("firefox") -> undefined (not found yet)
    //   t=1s  scan finds 50 apps.     scannedCount changes 3 -> 50
    //         every binding that called lookup() re-runs automatically
    //         lookup("firefox") -> DesktopEntry{ name: "Firefox", icon: "firefox" }
    readonly property int scannedCount: DesktopEntries.applications.values.length

    function lookup(appId) {
        const _dependency = scannedCount; // unused value; only its read matters
        return DesktopEntries.heuristicLookup(appId);
    }
}
