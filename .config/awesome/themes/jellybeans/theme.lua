------------------------------
-- jellybeans awesome theme --
------------------------------

theme = {}

theme.font = "Terminus 10"
theme.icons_dir = os.getenv("HOME") .. "/.config/awesome/icons"
theme.wallpaper = "/home/drot/Pictures/dead.jpg"

theme.bg_normal = "#151515"
theme.bg_focus = "#151515"
theme.bg_urgent = "#b85335"
theme.bg_minimize = "#151515"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#e8e8d3"
theme.fg_focus = "#fad07a"
theme.fg_urgent = "#e8e8d3"
theme.fg_minimize = "#888888"

theme.border_width = 1
theme.border_normal = "#404040"
theme.border_focus = "#888888"
theme.border_marked = "#151515"

-- awesome icon
theme.awesome_icon = theme.icons_dir .. "/awesome.png"

-- Display the taglist squares
theme.taglist_squares_sel = theme.icons_dir .. "/taglist/squaref.png"
theme.taglist_squares_unsel = theme.icons_dir .. "/taglist/squareu.png"

-- Variables set for theming the menu:
theme.menu_height = 21
theme.menu_width = 105

theme.menu_submenu_icon = theme.icons_dir .. "/submenu.png"
theme.menu_term = theme.icons_dir .. "/menu/term.png"
theme.menu_browser = theme.icons_dir .. "/menu/browser.png"
theme.menu_emacs = theme.icons_dir .. "/menu/emacs.png"
theme.menu_gimp = theme.icons_dir .. "/menu/gimp.png"
theme.menu_manual = theme.icons_dir .. "/menu/manual.png"
theme.menu_edit = theme.icons_dir .. "/menu/edit.png"
theme.menu_restart = theme.icons_dir .. "/menu/restart.png"
theme.menu_quit = theme.icons_dir .. "/menu/quit.png"

-- Tasklist
theme.tasklist_floating = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical = "" 

-- You can use your own layout icons like this:
theme.layout_fairh = theme.icons_dir .. "/layouts/fairh.png"
theme.layout_fairv = theme.icons_dir .. "/layouts/fairv.png"
theme.layout_floating = theme.icons_dir .. "/layouts/floating.png"
theme.layout_magnifier = theme.icons_dir .. "/layouts/magnifier.png"
theme.layout_max = theme.icons_dir .. "/layouts/max.png"
theme.layout_fullscreen = theme.icons_dir .. "/layouts/fullscreen.png"
theme.layout_tilebottom = theme.icons_dir .. "/layouts/tilebottom.png"
theme.layout_tileleft = theme.icons_dir .. "/layouts/tileleft.png"
theme.layout_tile = theme.icons_dir .. "/layouts/tile.png"
theme.layout_tiletop = theme.icons_dir .. "/layouts/tiletop.png"
theme.layout_spiral = theme.icons_dir .. "/layouts/spiral.png"
theme.layout_dwindle = theme.icons_dir .. "/layouts/dwindle.png"

-- Widget separator
theme.widget_sep = theme.icons_dir .. "/separator.png"

-- Widget icons
theme.widget_cpu = theme.icons_dir .. "/widgets/cpu.png"
theme.widget_mem = theme.icons_dir .. "/widgets/mem.png"
theme.widget_temp = theme.icons_dir .. "/widgets/temp.png"
theme.widget_disk = theme.icons_dir .. "/widgets/disk.png"
theme.widget_date = theme.icons_dir .. "/widgets/date.png"
theme.widget_vol = theme.icons_dir .. "/widgets/vol.png"

return theme