# awesome-wm-widgets
widgets for awesome

##### A widget showing the internal IP-address
This widget is showing the IP address assigned to tun0. I created this to always see if i am connected to the vpn.

Add 
  batterywidget = wibox.widget.textbox()
  batterywidget:set_text(" | Battery | ")
  batterywidgettimer = timer({ timeout = 5 })
  batterywidgettimer:connect_signal("timeout",
    function()
      fh = assert(io.popen("acpi | cut -d, -f 2,3 -", "r"))
      batterywidget:set_text(" |" .. fh:read("*l") .. " | ")
      fh:close()
    end
  )
  batterywidgettimer:start()
