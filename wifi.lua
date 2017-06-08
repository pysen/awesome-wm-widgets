local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")

wifi_widget = wibox.widget.textbox()
watch(
    "nmcli -t -f active,ssid dev wifi ", 3,
    function(widget, stdout, stderr, exitreason, exitcode)
    local index_1, index_2 = string.find(stdout, "yes:[a-z]*")
    if(wifi == '' or wifi==nil ) then
        widget.text= "| No wifi |"
    else
        wifi= string.sub(stdout, index_1+4, index_2)
        
        widget.text="| " .. wifi .. " |"
    end
end,
wifi_widget
)
