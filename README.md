# awesome-wm-widgets
widgets for awesome


##### ipwidget: A widget showing the status of tun0:
This widget shows if an interface (specified in first param of ip.sh) is connected.

Download ip.sh
Store it in a directory of your choice. 
To show your internal IP-address on this interface uncomment the line:
    

    #[[ ! -z "${INTIP// }" ]] && echo "$NIC: $INTIP"

and add a # before

    [[ ! -z "${INTIP// }" ]] && echo "$NIC: Connected"
    
Make it executable using 
    
    chmod a+x /path/to/ip.sh


Make sure to replace the path to your ip.sh in the following
Add :

    ipwidget = wibox.widget.textbox()
    ipwidget:set_text("| ip addr |")
    ipwidgettimer = timer({ timeout = 5 })
    ipwidgettimer:connect_signal("timeout",
        function()
                fp = assert(io.popen("/path/to/ip.sh <interface> | tail -n 1" , "r"))
                ipwidget:set_text(" |".. fp:read("*l") .. " | ")
                fp:close()
    end
    )
    ipwidgettimer:start()

to your rc.lua behind:
    
    -- {{{ Wibar
    -- Create a textclock widget
    mytextclock = wibox.widget.textclock()

Then add:
    
    ipwidget, 

in section:
    
    -- Add widgets to the wibox
    
Reload the config of awesome wm.

To add a second interface to watch just create a second widget in the same way with a different name. Make sure to also change the device name in line:
           
           fp = assert(io.popen("/path/to/ip.sh <interface> | tail -n 1" , "r"))
