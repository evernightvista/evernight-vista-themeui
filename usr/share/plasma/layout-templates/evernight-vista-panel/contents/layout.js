var panel = new Panel
var panelScreen = panel.screen
var freeEdges = {"bottom": true, "top": true, "left": true, "right": true}

for (i = 0; i < panelIds.length; ++i) {
    var tmpPanel = panelById(panelIds[i])
    if (tmpPanel.screen == panelScreen) {
        // Ignore the new panel
        if (tmpPanel.id != panel.id) {
            freeEdges[tmpPanel.location] = false;
        }
    }
}

if (freeEdges["bottom"] == true) {
    panel.location = "bottom";
} else if (freeEdges["top"] == true) {
    panel.location = "top";
} else if (freeEdges["left"] == true) {
    panel.location = "left";
} else if (freeEdges["right"] == true) {
    panel.location = "right";
} else {
    // There is no free edge, so leave the default value
    panel.location = "top";
}
// For an Icons-Only Task Manager on the bottom, *3 is too much, *2 is too little
// Round down to next highest even number since the Panel size widget only displays
// even numbers
panel.height = 2 * Math.floor(gridUnit * 2.5 / 2)
panel.floating = true;

// Restrict horizontal panel to a maximum size of a 21:9 monitor
const maximumAspectRatio = 21/9;
if (panel.formFactor === "horizontal") {
    const geo = screenGeometry(panelScreen);
    const maximumWidth = Math.ceil(geo.height * maximumAspectRatio);

    if (geo.width > maximumWidth) {
        panel.alignment = "center";
        panel.minimumLength = maximumWidth;
        panel.maximumLength = maximumWidth;
    }
}

panel.addWidget("org.kde.plasma.panelspacer")
var kickoff = panel.addWidget("org.kde.plasma.kickoff")
panel.addWidget("com.mcc45tr.filesearch")

//panel.addWidget("org.kde.plasma.showActivityManager")
let taskBar = panel.addWidget("org.kde.plasma.icontasks")
taskBar.writeConfig("launchers",["preferred://browser","preferred://filemanager","applications:vlc.desktop"])

panel.addWidget("org.kde.plasma.panelspacer")
panel.addWidget("org.kde.plasma.marginsseparator")
//panel.addWidget("org.kde.plasma.pager")

panel.addWidget("org.kde.plasma.systemtray")
let digitalClock = panel.addWidget("org.kde.plasma.digitalclock")
digitalClock.writeConfig("enabledCalendarPlugins", "holidaysevents")
digitalClock.writeConfig("showSeconds", 2)
panel.addWidget("org.kde.plasma.showdesktop")

