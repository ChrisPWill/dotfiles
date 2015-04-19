--
-- ~/.config/awesome/rc.lua
--
-- Initial Settings
-------------------------------------------------------------------------------

--#############################################################################
-- Libraries
--#############################################################################
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
require("eminent")
local menubar = require("menubar")

--#############################################################################
-- Error Handling
--#############################################################################
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end


--#############################################################################
-- Variable definitions
--#############################################################################
terminal = "urxvt -name term"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

--#############################################################################
-- Tags, Layouts, & Wallpapers
--#############################################################################
local layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
}
--tags = {}
--for s = 1, screen.count() do
--    tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
--end
tags = {
    names1  = { "i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix", "x" },
    layout1 = { layouts[1], layouts[1], layouts[2], layouts[1], layouts[1],
              layouts[1], layouts[1], layouts[1], layouts[1], layouts[1] },
}


beautiful.init("/home/cpw/.config/awesome/themes/cpw/theme.lua")

for s = 1, screen.count() do
    tags[s] = awful.tag(tags.names1, s, tags.layout1)
    gears.wallpaper.maximized(beautiful.wallpaper1, s, true)
end

--#############################################################################
-- Menus
--#############################################################################
system = {
   { "poweroff", "sudo poweroff" },
   { "reboot", "sudo reboot" },
   { "suspend", "sudo pm-suspend-hybrid" },
   { "display off", "xset dpms force off" }
}

awesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { 
    { "⮪ awesome", awesomemenu },
    { "⮪ system", system },
    { "terminal", terminal }
    }
})


-- Wibox
-------------------------------------------------------------------------------

mytextclock = awful.widget.textclock()

mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )

--#############################################################################
-- Widget Creation
--#############################################################################
mywibox = {}
for s = 1, screen.count() do
    mypromptbox[s] = awful.widget.prompt()
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)


    mywibox[s] = awful.wibox({ position = "top", screen = s })

    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])
    left_layout:add(mylayoutbox[s])

    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock)

    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    -- layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end

-- Mappings
-------------------------------------------------------------------------------

--#############################################################################
-- Mouse
--#############################################################################
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

globalkeys = awful.util.table.join(
--#############################################################################
-- Keybindings: Awesome & Layout Manipulation
--#############################################################################
    awful.key({ modkey, "Shift"   }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

--#############################################################################
-- Keybindings: Directional Focusing, Manual Window Movement, & Resizing
--#############################################################################
    awful.key({ modkey            }, "j", function () awful.client.focus.bydirection("down")
        if client.focus then client.focus:raise() end end),
    awful.key({ modkey            }, "k", function () awful.client.focus.bydirection("up")
        if client.focus then client.focus:raise() end end),
    awful.key({ modkey            }, "h", function () awful.client.focus.bydirection("left")
        if client.focus then client.focus:raise() end end),
    awful.key({ modkey            }, "l", function () awful.client.focus.bydirection("right")
        if client.focus then client.focus:raise() end end), 
--#############################################################################
-- Keybindings: Application Focusing & Spawning
--#############################################################################
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey            }, "r",      function () mypromptbox[mouse.screen]:run() end),
    awful.key({ modkey            }, "f",      function () 
        run_or_raise("firefox",                                  { class = "Firefox" }) end),
    awful.key({ modkey            }, "p",      function () 
        run_or_raise("urxvt -name ncmpcpp -g 102x15 -e ncmpcpp", { class = "ncmpcpp" }) end),
    awful.key({ modkey            }, "r",      function () 
        run_or_raise("ranger",                                   { class = "ranger" }) end),

    -- restore all minimized clients
    awful.key({ modkey, "Shift"   }, "m",
        function()
            local tag = awful.tag.selected()
                for i=1, #tag:clients() do
                    tag:clients()[i].minimized=false
            end
        end)
)

--#############################################################################
-- Keybindings: Client Manipulation
--#############################################################################
clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "d",      function (c) c:kill()                         end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end)
)

--#############################################################################
-- Keybindings: Tags
--#############################################################################
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end
root.keys(globalkeys)

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))


-- Rules
-------------------------------------------------------------------------------

awful.rules.rules = {
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    --{ rule = { class = "Firefox" },
    --  properties = { tag = tags[1][2] } },
}

-- Signals
-------------------------------------------------------------------------------
client.connect_signal("manage", function (c)
    if not awesome.startup then
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    elseif not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

function run_or_raise(cmd, properties, opt2, opt3, opt4, opt5)
   local clients = client.get()
   local focused = awful.client.next(0)
   local findex = 0
   local matched_clients = {}
   local n = 0
   opt2 = opt2 or {instance="SOMETHING"}
   opt3 = opt3 or {instance="SOMETHING"}
   opt4 = opt4 or {instance="SOMETHING"}
   opt5 = opt5 or {instance="SOMETHING"}
   for i, c in pairs(clients) do
      if match(properties, c) or match(opt2, c) or match(opt3, c) or match(opt4, c) or match(opt5, c) then
         n = n + 1
         matched_clients[n] = c
         if c == focused then
            findex = n
         end
      end
   end
   if n > 0 then
      local c = matched_clients[1]
      if 0 < findex and findex < n then
         c = matched_clients[findex+1]
      end
      local ctags = c:tags()
      if #ctags == 0 then
         local curtag = awful.tag.selected()
         awful.client.movetotag(curtag, c)
      else
         awful.tag.viewonly(ctags[1])
      end
      client.focus = c
      c:raise()
      return
   end
   awful.util.spawn(cmd)
end

function match (table1, table2)
   for k, v in pairs(table1) do
      if table2[k] ~= v and not table2[k]:find(v) then
         return false
      end
   end
   return true
end
