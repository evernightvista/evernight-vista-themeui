var plasma = getApiVersion(1);
var layout = {
    "desktops": [
        {
            "config": {
                "/General": {
                    "arrangement": "1",
                    "sortDesc": "0",
                    "sortMode": "-1"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        }
    ],

    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
var panel = new Panel
var panelScreen = panel.screen

panel.location = "bottom";

// For an Icons-Only Task Manager on the bottom, *3 is too much, *2 is too little
// Round down to next highest even number since the Panel size widget only displays
// even numbers
panel.height = 2 * Math.floor(gridUnit * 2.5 / 2)
panel.floating = false;

// Restrict horizontal panel to a maximum size of a 21:9 monitor
const maximumAspectRatio = 21/9;

const geo = screenGeometry(panelScreen);
const maximumWidth = Math.ceil(geo.height * maximumAspectRatio);

if (geo.width > maximumWidth) {
    panel.alignment = "center";
    panel.minimumLength = maximumWidth;
    panel.maximumLength = maximumWidth;
}

var kickoff = panel.addWidget("org.kde.plasma.kickoff")
kickoff.writeConfig("favorites", ["preferred://browser", "systemsettings.desktop", "org.kde.dolphin.desktop", "org.kde.konsole.desktop", "vlc.desktop"])


//panel.addWidget("org.kde.plasma.showActivityManager")
let taskBar = panel.addWidget("org.kde.plasma.icontasks")
taskBar.writeConfig("launchers",["preferred://browser","preferred://filemanager","applications:vlc.desktop"])

panel.addWidget("org.kde.plasma.marginsseparator")
panel.addWidget("org.kde.plasma.pager")

panel.addWidget("org.kde.plasma.systemtray")
let digitalClock = panel.addWidget("org.kde.plasma.digitalclock")
digitalClock.writeConfig("enabledCalendarPlugins", "holidaysevents")
digitalClock.writeConfig("showSeconds", 2)
panel.addWidget("org.kde.plasma.showdesktop")

