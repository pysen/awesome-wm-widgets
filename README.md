# awesome-wm-widgets
widgets for awesome

#### General usage
1. Download the lua-File of the widget you want to use.
2. add 
        
        require("name_of_file")
   to your rc.lua
   Example:
   
        require("vpn")
   Note that there is no .lua in the require-command
   
3. Add the name of the widget in the wibox you want to add it to.
   You will find the right spot behind:
   
         -- Create the wibox
        s.mywibox = awful.wibar({ position = "bottom", screen = s })
        s.mywibox:setup {
        layout = wibox.layout.align.horizontal,

4. Save your rc.lua and reload the config by pressing "Mod + CTRL + R"
5. Done! The widget should appear!

##### vpn_widget: A widget showing the status of tun0:
This widget shows "Connected" if you are connected to a vpn through tun0 interface. You may easily change the interface in case you are using another one.
To install follow the instructions in general usage (see above) and replace "name_of_file" with "vpn".
The name of the widget is "vpn_widget".

##### wifi_widget: A widget showing to which wifi you are currently connected
This widget shows if you are connected to a wifi. If so it shows the name of the wifi you are connected to. 
To install follow the instructions in general usage (see above) and replace "name_of_file" with "wifi".
The name of the widget is "wifi_widget".

wifi.lua uses nmcli. To use iw instead download the wifi_iw.lua
