local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")
wifi_widget = wibox.widget.textbox()
watch(
    "iw dev wlp3s0 link", 3,
    function(widget, stdout, stderr, exitreason, exitcode)
    local wifi = string.match(stdout, "SSID:.*\n")
    local index_1, index_2 = string.find(stdout, "SSID: [a-z]*")
    local wifi_signal = string.match(stdout, "signal:.*\n")
    local index_3, index_4 = string.find(stdout, "signal: [^\n]*")
    if(wifi == '' or wifi==nil ) then
        widget.text= "| No wifi |"
    else
        wifi= string.sub(stdout, index_1+6, index_2)
        wifi_signal= string.sub(stdout, index_3+8, index_4-1)
        widget.text="| " .. wifi .. " " .. wifi_signal .. " |"
    end
end,
wifi_widget
)
