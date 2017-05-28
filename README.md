# awesome-wm-widgets
widgets for awesome


##### ipwidget: A widget showing the status of tun0:
This widget is showing if tun0 is connected to something. I created this to always see if i am connected to the vpn.

Download ip.sh
Store it in a directory of your choice. 
If you are using another interface than tun0 change NIC in ip.sh to match your interface.
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
                fp = assert(io.popen("/path/to/ip.sh | tail -n 1" , "r"))
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
