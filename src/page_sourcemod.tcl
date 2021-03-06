#!/bin/sh
# -*- tcl -*-
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

#First flag states if plugin is risky or not
variable sourcemodPlugins [list \
    mapchooser [list false sm_mapchooser_enable sm_mapchooser_lanonly mapchooser.smx] \
    nominations [list false sm_nominations_enable sm_nominations_lanonly nominations.smx] \
    rockthevote [list false sm_rockthevote_enable sm_rockthevote_lanonly rockthevote.smx] \
    nextmap [list false sm_nextmap_enable sm_nextmap_lanonly nextmap.smx] \
    randomcycle [list false sm_randomcycle_enable sm_randomcycle_lanonly randomcycle.smx] \
    franug_weaponpaints [list true sm_franug_weaponpaints_enable sm_franug_weaponpaints_lanonly franug_weaponpaints_public.smx] \
    franug_knifes [list true sm_franug_knifes_enable sm_franug_knifes_lanonly sm_franugknife.smx] \
]

## Sourcemod config
variable sourcemodConfig [CreateConfig \
    [list \
        name     "sourcemodConfig" \
        prefix   "Sourcemod" \
        fileName "$configFolder/sourcemod.cfg" \
        saveProc "SaveConfigFileSourcemod" \
    ] \
    [list \
        "bool"      [list enable "1" "Controls if sourcemod functionality is enabled. If disabled ALL other plugins below are also disabled."]\
        "bool"      [list lanonly "0" "Only enable sourcemod in lanonly mode"]\
        "bool"      [list banprotection "1" "Disables all known unsafe plugins and sets FollowCSGOServerGuidelines to \"yes\".\nWhen you disable ban protection FollowCSGOServerGuidelines is set to \"no\" to allow plugins full access.\nDO NOT DISABLE THIS OPTION UNLESS YOU HAVE READ THE HELP PAGE FIRST!\nYOUR SERVER MAY BE BANNED!"]\
        "string"    [list admins "" "List all users (separated by space) you want to give admin permissions on your server\nA user is identified by their steam id (e.g STEAM_1:1:12345678) or ip address (e.g. 192.168.1.123).\nSee help page for more information about how to obtain your steam id or find users ip address."]\
        "bool"      [list sm_mapchooser_enable "0" "Controls if this sourcemod plugin is enabled."]\
        "bool"      [list sm_mapchooser_lanonly "1" "Only enable this sourcemod plugin in lanonly mode"]\
        "bool"      [list sm_mapchooser_mapvote_endvote "1" "Specifies if MapChooser should run an end of map vote."]\
        "bool"      [list sm_nominations_enable "0" "Controls if this sourcemod plugin is enabled.\nRequires mapchooser enabled."]\
        "bool"      [list sm_nominations_lanonly "1" "Only enable this sourcemod plugin in lanonly mode"]\
        "bool"      [list sm_rockthevote_enable "0" "Controls if this sourcemod plugin is enabled.\nRequires mapchooser enabled."]\
        "bool"      [list sm_rockthevote_lanonly "1" "Only enable this sourcemod plugin in lanonly mode"]\
        "bool"      [list sm_nextmap_enable "0" "Controls if this sourcemod plugin is enabled."]\
        "bool"      [list sm_nextmap_lanonly "1" "Only enable this sourcemod plugin in lanonly mode"]\
        "bool"      [list sm_randomcycle_enable "0" "Controls if this sourcemod plugin is enabled."]\
        "bool"      [list sm_randomcycle_lanonly "1" "Only enable this sourcemod plugin in lanonly mode"]\
        "bool"      [list sm_franug_weaponpaints_enable "0" "Controls if this sourcemod plugin is enabled.\nType !ws in chat to use."]\
        "bool"      [list sm_franug_weaponpaints_lanonly "1" "Only enable this sourcemod plugin in lanonly mode"]\
        "bool"      [list sm_franug_weaponpaints_onlyadmin "1" "This feature is only for admins. 1 = enabled, 0 = disabled.\n(Use the value 1 and try to keep this plugin secret for the normal users because they can report it)"]\
        "bool"      [list sm_franug_weaponpaints_c4 "1" "Enable or disable that people can apply paints to the C4. 1 = enabled, 0 = disabled"]\
        "int"       [list sm_franug_weaponpaints_saytimer "-1" "Time in seconds for block that show the plugin commands in chat when someone type a command.\n-1 = never show the commands in chat"]\
        "int"       [list sm_franug_weaponpaints_roundtimer "-1" "Time in seconds roundstart for can use the commands for change the paints.\n-1 = always can use the command"]\
        "bool"      [list sm_franug_weaponpaints_rmenu "0" "Re-open the menu when you select a option. 1 = enabled, 0 = disabled."]\
        "bool"      [list sm_franug_weaponpaints_zombiesv "1" "Enable this for prevent crashes in zombie and 1v1 servers for knifes.\n1 = enabled, 0 = disabled. (Use the value 1 if you use my knife plugin)"]\
        "bool"      [list sm_franug_knifes_enable "0" "Controls if this sourcemod plugin is enabled.\nType !knife in chat to use."]\
        "bool"      [list sm_franug_knifes_lanonly "1" "Only enable this sourcemod plugin in lanonly mode"]\
    ] \
]

variable sourcemodLayout [CreateLayout \
    [list \
        configName  "sourcemodConfig" \
        tabName     "Sourcemod" \
        help        "Sourcemod" \
    ] \
    [list \
        h1      [list "Sourcemod settings"] \
        space   [list] \
        h2      [list "General"] \
        line    [list] \
        space   [list] \
        parm    [list enable] \
        parm    [list lanonly] \
        parm    [list admins] \
        space   [list] \
        h2      [list "Plugin: mapchooser"] \
        parm    [list sm_mapchooser_enable] \
        parm    [list sm_mapchooser_lanonly] \
        parm    [list sm_mapchooser_mapvote_endvote] \
        space   [list] \
        h2      [list "Plugin: nominations"] \
        parm    [list sm_nominations_enable] \
        parm    [list sm_nominations_lanonly] \
        space   [list] \
        h2      [list "Plugin: rockthevote"] \
        parm    [list sm_rockthevote_enable] \
        parm    [list sm_rockthevote_lanonly] \
        space   [list] \
        h2      [list "Plugin: nextmap"] \
        parm    [list sm_nextmap_enable] \
        parm    [list sm_nextmap_lanonly] \
        space   [list] \
        h2      [list "Plugin: randomcycle"] \
        parm    [list sm_randomcycle_enable] \
        parm    [list sm_randomcycle_lanonly] \
        space   [list] \
        warning [list "All plugins below this line require the banprotection to be disabled. Read the help page carefully before"] \
        warning [list "disabling banprotection. Running misbehaving sourcemod plugins may cause your server to be banned by Valve."] \
        warning [list "*** I take no responsibility for if your server gets banned ***"] \
        line    [list] \
        space   [list] \
        parm    [list banprotection] \
        warning [list "The first time you enable banprotection you need to update the server by clicking the \"Update Server\" button"] \
        warning [list "above. This will install the plugins below. The plugins will still be disabled until you enable them below. If you"] \
        warning [list "decide to reenable banprotection read the help page for instructions on how to ensure that plugins below are"] \
        warning [list "completely removed from the file system."] \
        space   [list] \
        h2      [list "Plugin: Franug-Weapon_Paints"] \
        parm    [list sm_franug_weaponpaints_enable] \
        parm    [list sm_franug_weaponpaints_lanonly] \
        parm    [list sm_franug_weaponpaints_onlyadmin] \
        parm    [list sm_franug_weaponpaints_c4] \
        parm    [list sm_franug_weaponpaints_saytimer] \
        parm    [list sm_franug_weaponpaints_roundtimer] \
        parm    [list sm_franug_weaponpaints_rmenu] \
        parm    [list sm_franug_weaponpaints_zombiesv] \
        space   [list] \
        h2      [list "Plugin: Franug-Knifes"] \
        parm    [list sm_franug_knifes_enable] \
        parm    [list sm_franug_knifes_lanonly] \
    ] \
]
