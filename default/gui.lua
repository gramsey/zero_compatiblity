
function default.get_hotbar_bg(...) return gui.get_hotbar_bg(...) end

default.gui_survival_form = "size[8,8.5]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"list[current_player;craft;1.75,0.5;3,3;]"..
	"list[current_player;craftpreview;5.75,1.5;1,1;]"..
	"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
	"listring[current_player;main]"..
	"listring[current_player;craft]"..
	gui.get_hotbar_bg(0,4.25)

default.gui_bg     = ""
default.gui_bg_img = ""
default.gui_slots  = ""
