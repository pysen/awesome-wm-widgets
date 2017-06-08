local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")
bitrate_widget = wibox.widget.textbox()
watch(
    "iw dev wlp3s0 station dump", 2,
    function(widget, stdout, stderr, exitreason, exitcode)
    local index_1, index_2 = string.find(stdout, "tx bitrate:%s%d+%p+%d+%s%a+%p%a")
    local index_3, index_4 = string.find(stdout, "rx bitrate:%s%d+%p+%d+%s%a+%p%a")
    if(index_1 == '' or index_2==nil ) then
        widget.text= "| Not found |"
    else
        wifi_bitrate_up= string.sub(stdout, index_1+12, index_2)
        wifi_bitrate_down= string.sub(stdout, index_3+12, index_4)
        widget.text="| up: " .. wifi_bitrate_up .. " down: " .. wifi_bitrate_down .." |" 
    end
end,
bitrate_widget
)
