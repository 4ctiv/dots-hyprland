require("hyprland-var")

----------------
--- Gestures ---
----------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures
--     https://wiki.hypr.land/Configuring/Basics/Variables/#gestures
hl.config({
    binds = {
        workspace_back_and_forth = true,
        disable_keybind_grabbing = true, -- Disable e.g. VM input grabbing
    },
    gestures = {
        -- Universal
        workspace_swipe_use_r = false,
        workspace_swipe_forever = false,
        workspace_swipe_create_new = true,
        workspace_swipe_min_speed_to_force = 100,
        -- Touch screen (tablet)
        workspace_swipe_touch = true,
        workspace_swipe_invert = false,
        workspace_swipe_cancel_ratio = 0.33,
        -- Trackpad (laptop)
        workspace_swipe_invert = true,
        workspace_swipe_distance = 100,
        workspace_swipe_direction_lock = true,
        workspace_swipe_direction_lock_threshold = 10,
    },
})
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})
hl.gesture({
    fingers = 3,
    direction = "up",
    action = function() hl.dsp.exec_cmd(fullmenu, { stay_focused = true }) end,
})
hl.gesture({
    fingers = 3,
    direction = "down",
    action = "special",
})

---------------------------------------
---      Device Configuration       ---
---------------------------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices
--     https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
  input = {
      -- Keyboard
      kb_layout  = "de,us",           -- `localectl list-keymaps`
      kb_variant = "nodeadkeys,euro", -- `localectl list-x11-keymap-variants $LAYOUT`
      kb_options = "grp:caps_toggle,fkeys:basic_13-24",
      numlock_by_default = true,
      resolve_binds_by_sym = 1,       -- kb_layout -1 -> affect keybinds
      -- Mouse
      sensitivity = -0.7,
      follow_mouse = true,
      force_no_accel = true,          -- Disable mouse acceleration
      -- Touchpad (Laptop)
      touchpad = {
          disable_while_typing = true,    -- may want to disable for gaming
          middle_button_emulation = true, -- may want to disable for gaming
          natural_scroll = true,
          scroll_factor = 1.0,
          tap_to_click = true,
          drag_3fg = 0,
          drag_lock = 0,                  -- break drag X on finger lift if 0
      },
      -- Touchscreen
      touchdevice = {
          enabled = true,
          output = "eDP-1", -- "auto"     -- name of display to bind to
      },
      -- Active Pen (Wacom)
      tablet = {
          output = "eDP-1",
          relative_input = false,         -- relative to ?
          absolute_region_position = true,-- top left of tablet is (0,0)
      },
      tablettool = {
          eraser_button_mode = 0,         -- if 1 send explicit button event
          pressure_range_min = 0.0,
          pressure_range_max = 1.0,
      }
  },
})
-- Per Device Configuration
-- NOTE: Options also include all `hl.config.input` options
-- TIP: Get devices via `hyprctl devices`

-- Thinkpad Peripherals
hl.device({
    name = "elan-trackpoint",
    enabled = KNOB_ENABLED,
})
hl.device({
    name = "elan-touchpad",
    sensitivity = 1.0,
    enabled = PAD_ENABLED or not KNOB_ENABLED,
})
hl.device({
    name = "wacom-pen-and-multitouch-sensor-finger",
    enabled = TOUCH_ENABLED,
})

-- PC Peripherals
hl.device({
    name = "evga-evga-x20-usb-receiver",
    sensitivity = -0.7,
    accel_profile = "custom 0 0 0", -- disable acceleration
    scroll_points = " 0 0 0 0 0 0", -- disable acceleration
    kb_options = "fkeys:basic_13-24",
})
hl.device({
    name = "keychron-keychron-q11",
    kb_layout = "us",
    kb_variant = "euro",
    kb_options = "fkeys:basic_13-24"
})

----------------
--- Keybinds ---
----------------
-- Function keys
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("kitty " .. scriptsDir .. "/show-keybinds")) --TODO: Update to work with lua
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd(files))
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + F4", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd(mail))
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd(messanger))
hl.bind(mainMod .. " + F7", hl.dsp.exec_cmd(zoom .. " 0.2"))
hl.bind(mainMod .. " + SHIFT + F7", hl.dsp.exec_cmd(zoom .. " -0.2"))
hl.bind(mainMod .. " + F8", hl.dsp.exec_cmd("gromit-mpx --undo"))
hl.bind(mainMod .. " + SHIFT + F8", hl.dsp.exec_cmd("gromit-mpx --redo"))
hl.bind(mainMod .. " + F9", hl.dsp.exec_cmd(audio))
hl.bind(mainMod .. " + F10", hl.dsp.exec_cmd(photo))
hl.bind(mainMod .. " + F11", hl.dsp.exec_cmd(video))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd(keyboard))
-- Numpad
    -- mainMod, KP_Insert #NumPad0
    -- mainMod, KP_End    #NumPadE
    -- mainMod, KP_Down   #NumPad1
    -- mainMod, KP_Next   #NumPad2
    -- mainMod, KP_Begin  #NumPad3
    -- mainMod, KP_Left   #NumPad4
    -- mainMod, KP_Right  #NumPad6
    -- mainMod, KP_UP     #NumPad7
    -- mainMod, KP_Home   #NumPad8
    -- mainMod, KP_Prior  #NumPad9
-- [SUPER] = [?]
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(term))
hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + tab", hl.dsp.group.next())
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pavucontrol"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("blueman-manager"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(transcriber))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(scriptsDir .. "/changeLayout" ))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(files))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + G", hl.dsp.workspace.toggle_special("draw"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd(notify_hist))
hl.bind(mainMod .. " + S", hl.dsp.group.toggle())
hl.bind(mainMod .. " + I", function()
                             local win = hl.get_active_window()
                             local ws  = hl.get_active_workspace()
                             hl.dispatch(hl.dsp.exec_cmd(
                               string.format(
                                 'notify-send -e -t 2500 -c "hyprland" "Window" "%s [%s]\n  PID:  %s\n WS: %s [%s]"',
                                 string.sub(win.title,1,12), win.class, win.pid, ws.name, ws.id
                           ))) end )
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd(keylogger))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(scriptsDir .. "/ollama"))
hl.bind(mainMod .. " + M", function()
                             local mon = hl.get_active_monitor()
                             local ws  = hl.get_active_workspace()
                             hl.dispatch(hl.dsp.exec_cmd(
                               string.format(
                                 'notify-send -e -t 2500 -c "hyprland" "Monitor" "%s [%s]\n  WS:  %s [%s]\n  RES: %sx%s@%s"',
                                 mon.name, mon.id, ws.name, ws.id, mon.width, mon.height, mon.refreshRate
                           ))) end )
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(files))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian || (kitty sh -c 'yay -S obsidian' && obsidian)"))
hl.bind(mainMod .. " + P", hl.dsp.window.pin())
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(kill_active))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(wofi_beats))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(scriptsDir.. "/toggle_touch touch"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clip_hist))
hl.bind(mainMod .. " + W", hl.dsp.workspace.toggle_special("special"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(fullmenu, {stay_focused = true}))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(fullmenu, {stay_focused = true}))

-- [SUPER] + [SHIFT] + [?]
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd(term .. " --class bashtop -T bashtop -e bashtop"))
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("killall easyeffects && easyeffects"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.center())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(files))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + W", function()
    local win = hl.get_active_window()
    if not win then return end
    hl.dispatch(hl.dsp.window.fullscreen({action = "unset", window = win}))
    hl.dispatch(hl.dsp.window.float({ action = "on", window = win}))
    hl.dispatch(hl.dsp.window.center({window = win}))
    hl.dispatch(hl.dsp.window.resize({ x = 1280, y = 720, window = win}))
    hl.dispatch(hl.dsp.window.move({ workspace = "special:special", nofocus = false, window = win }))
  end)
hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.exec_cmd(term .. " --class clock -T clock -e tty-clock -c -C 7 -r -s -f \"%A, %B, %d\""))

-- [SUPER] + [CTRL] + [?]
hl.bind(mainMod .. " + CTRL + Space", hl.dsp.exec_cmd(scriptsDir .. "/changeLayout"))
hl.bind(mainMod .. " + CTRL + A", hl.dsp.exec_cmd(term .. " --class cava -T cava -e cava"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd(term .. " --class bonsai -T bonsai -e bash -c 'while true; do cbonsai -S -l; sleep 1s; done'"))
hl.bind(mainMod .. " + CTRL + C", hl.dsp.exec_cmd(term .. " --class clock -T clock -e tty-clock -c -C 7 -r -s -f \"%A, %B, %d\""))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("pin"))
hl.bind(mainMod .. " + CTRL + Q", hl.dsp.exec_cmd("killall wlogout; wlogout -l ~/.config/hypr/wlogout/layout -c ~/.config/hypr/wlogout/style.css"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("exec hyprctl dispatch movewindoworgroup r"))
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + CTRL + W", function()
    -- test via `hyprctl repl ' ... '`
    local win = hl.get_active_window()
    if not win then return end
    -- https://wiki.hypr.land/configuring/core/dispatchers/#:~:text=inside%20a%20function
    hl.dispatch(hl.dsp.window.fullscreen({action = "unset", window = win}))
    hl.dispatch(hl.dsp.window.float({ action = "on", window = win}))
    hl.dispatch(hl.dsp.window.resize({ x = 1280, y = 720, window = win}))
    hl.dispatch(hl.dsp.window.center({window = win}))
    hl.dispatch(hl.dsp.window.move({ workspace = "special:special", nofocus = true, window = win }))
  end)
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd(scriptsDir .. "/toggle_touch knob"))

-- [SUPER] + [ALT] + [?]
hl.bind(mainMod .. " + ALT + A", hl.dsp.exec_cmd("bash -c 'pidof \"handy\" >/dev/null || (handy&) ; sleep 1s; handy --toggle-transcription'"))
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd(brightness .. " --filter"))
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(colorpicker))
hl.bind(mainMod .. " + ALT + F", hl.dsp.exec_cmd(statusbar))
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd(gamemode))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd(speak_toggle .. " && notify-send -t 1000 \"Mic $(pactl get-source-mute @DEFAULT_SOURCE@)\""))
hl.bind(mainMod .. " + ALT + N", hl.dsp.exec_cmd(sound_toggle .. " && notify-send -t 1000 \"Aux $(pactl get-sink-mute @DEFAULT_SINK@)\""))
hl.bind(mainMod .. " + ALT + V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + ALT + T", hl.dsp.exec_cmd(scriptsDir .. "/toggle_touch pad"))

-- [SUPER] + [CTRL] + [ALT] + [?]
hl.bind(mainMod .. " + CTRL + ALT + Up", hl.dsp.exec_cmd(   brightness .. " --inc"), { repeating = true })
hl.bind(mainMod .. " + CTRL + ALT + Down", hl.dsp.exec_cmd( brightness .. " --dec"), { repeating = true })
hl.bind(mainMod .. " + CTRL + ALT + Right", hl.dsp.exec_cmd(volume .. " +5%"), { repeating = true })
hl.bind(mainMod .. " + CTRL + ALT + Left", hl.dsp.exec_cmd( volume .. " -5%"), { repeating = true })

-- GrommitMPX
hl.bind("CTRL + SHIFT + Z", hl.dsp.exec_cmd("gromit-mpx --undo"))
hl.bind("CTRL + SHIFT + R", hl.dsp.exec_cmd("gromit-mpx --redo"))

-- Windows keybinds
hl.bind("ALT + F4",                hl.dsp.exec_cmd("kill -9 $(hyprctl activewindow -j | jq '.pid')"))
hl.bind("ALT + tab",               hl.dsp.focus({ workspace = "m+1" }))
hl.bind("ALT + SHIFT + tab",       hl.dsp.focus({ workspace = "m-1" }))
hl.bind("CTRL + ALT + Delete",     hl.dsp.exec_cmd(  term .. " " .. tm))
hl.bind("CTRL + SHIFT + Escape",   hl.dsp.exec_cmd(term .. " " .. tm))
--hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(files)) -- already set above
hl.bind(mainMod .. " + Print",     hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + CTRL + SHIFT + Escape", hl.dsp.exec_cmd("hyprctl reload"))

-- Window management
hl.bind(mainMod .. " + minus",         hl.dsp.focus({ direction = "l"    }))
hl.bind(mainMod .. " + plus",          hl.dsp.focus({ direction = 'r'    }))
hl.bind(mainMod .. " + equal",         hl.dsp.focus({ direction = 'r'    })) -- us keyboard
hl.bind(mainMod .. " + up",            hl.dsp.focus({ direction = "up"   }))
hl.bind(mainMod .. " + down",          hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + left",          hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right",         hl.dsp.focus({ direction = "right"}))
hl.bind(mainMod .. " + ALT + up",      hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + ALT + down",    hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + ALT + left",    hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + ALT + right",   hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + CTRL + left",   hl.dsp.window.move({ direction = "l"            }))
hl.bind(mainMod .. " + CTRL + down",   hl.dsp.window.move({ direction = "d"            }))
hl.bind(mainMod .. " + CTRL + up",     hl.dsp.window.move({ direction = "u"            }))
hl.bind(mainMod .. " + CTRL + right",  function()
                                         local win = hl.get_active_window()
                                         if win and win.group then
                                           hl.dispatch(hl.dsp.window.move({ out_of_group = "r" }))
                                         else
                                           hl.dispatch(hl.dsp.window.move({ direction = "r" }))
                                         end
                                       end)
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.resize({ x =  00, y = -50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.resize({ x =  00, y =  50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.resize({ x = -50, y =  00, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x =  50, y =  00, relative = true }), { repeating = true })

-- Workspace management
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.move({ workspace = "-1", follow = true }))
hl.bind(mainMod .. " + SHIFT + 1",     hl.dsp.window.move({ workspace = 1   , follow = true }))
hl.bind(mainMod .. " + SHIFT + 2",     hl.dsp.window.move({ workspace = 2   , follow = true }))
hl.bind(mainMod .. " + SHIFT + 3",     hl.dsp.window.move({ workspace = 3   , follow = true }))
hl.bind(mainMod .. " + SHIFT + 4",     hl.dsp.window.move({ workspace = 4   , follow = true }))
hl.bind(mainMod .. " + SHIFT + 5",     hl.dsp.window.move({ workspace = 5   , follow = true }))
hl.bind(mainMod .. " + SHIFT + 6",     hl.dsp.window.move({ workspace = 6   , follow = true }))
hl.bind(mainMod .. " + SHIFT + 7",     hl.dsp.window.move({ workspace = 7   , follow = true }))
hl.bind(mainMod .. " + SHIFT + 8",     hl.dsp.window.move({ workspace = 8   , follow = true }))
hl.bind(mainMod .. " + SHIFT + 9",     hl.dsp.window.move({ workspace = 9   , follow = true }))
hl.bind(mainMod .. " + SHIFT + plus",  hl.dsp.window.move({ workspace = "+1", follow = true }))
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.window.move({ workspace = "+1", follow = true }))
hl.bind(mainMod .. " + CTRL + minus",  hl.dsp.window.move({ workspace = "-1", follow = false}))
hl.bind(mainMod .. " + CTRL + 1",      hl.dsp.window.move({ workspace = 1   , follow = false}))
hl.bind(mainMod .. " + CTRL + 2",      hl.dsp.window.move({ workspace = 2   , follow = false}))
hl.bind(mainMod .. " + CTRL + 3",      hl.dsp.window.move({ workspace = 3   , follow = false}))
hl.bind(mainMod .. " + CTRL + 4",      hl.dsp.window.move({ workspace = 4   , follow = false}))
hl.bind(mainMod .. " + CTRL + 5",      hl.dsp.window.move({ workspace = 5   , follow = false}))
hl.bind(mainMod .. " + CTRL + 6",      hl.dsp.window.move({ workspace = 6   , follow = false}))
hl.bind(mainMod .. " + CTRL + 7",      hl.dsp.window.move({ workspace = 7   , follow = false}))
hl.bind(mainMod .. " + CTRL + 8",      hl.dsp.window.move({ workspace = 8   , follow = false}))
hl.bind(mainMod .. " + CTRL + 9",      hl.dsp.window.move({ workspace = 9   , follow = false}))
hl.bind(mainMod .. " + CTRL + plus",   hl.dsp.window.move({ workspace = "+1", follow = false}))
hl.bind(mainMod .. " + CTRL + equal",  hl.dsp.window.move({ workspace = "+1", follow = false}))

-- Media Keys
hl.bind("xf86audiomute", hl.dsp.exec_cmd(sound_toggle))
hl.bind("xf86audioraisevolume", hl.dsp.exec_cmd(volume .. " +5%"))
hl.bind("xf86audiolowervolume", hl.dsp.exec_cmd(volume .. " -5%"))
hl.bind("xf86audioplay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("xf86audiostop", hl.dsp.exec_cmd("playerctl stop"))
hl.bind("xf86audionext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("xf86audioprev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("xf86monbrightnessup", hl.dsp.exec_cmd(brightness .. " --inc"))
hl.bind("xf86monbrightnessdown", hl.dsp.exec_cmd(brightness .. " --dec"))
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.submap("backlight"))
hl.define_submap("backlight", function()
    hl.bind("equal", hl.dsp.exec_cmd(backlight .. " --inc"))
    hl.bind("minus", hl.dsp.exec_cmd(backlight .. " --dec"))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Mouse functions
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind(mainMod .. " + period", hl.dsp.workspace.toggle_special(""))

-- [Hyprgrass Touch Plugin](https://github.com/horriblename/hyprgrass/blob/main/docs/configuration.md)
-- ```bash
-- hyprpm add https://github.com/horriblename/hyprgrass
-- hyprpm enable hyprgrass
-- ```
--
--hl.config({
--    plugin = {
--        hyprgrass = {
--            -- The default sensitivity is probably too low on tablet screens,
--            -- I recommend turning it up to 4.0
--            sensitivity = 1.0,

--            -- in milliseconds
--            long_press_delay = 400,

--            -- resize windows by long-pressing on window borders and gaps.
--            -- If general:resize_on_border is enabled,
--            -- general:extend_border_grab_area is used for floating windows
--            resize_on_border_long_press = true,

--            -- in pixels, the distance from the edge that is considered an edge
--            edge_margin = 10,
--        }
--    }
--})
--hl.plugin.hyprgrass.gesture {
--    pattern = {kind = "swipe", fingers = 3, direction = "up"},
--    action = hl.dsp.exec_cmd("pidof wvkbd-deskintl && pkill wvkbd-deskintl || wvkbd-deskintl -L 300"),
--}
--hl.plugin.hyprgrass.gesture {
--    pattern = {kind = "swipe", fingers = 3, direction = "down"},
--    action = hl.dsp.exec_cmd(fullmenu),
--}
