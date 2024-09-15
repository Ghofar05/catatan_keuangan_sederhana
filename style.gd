extends Control

@onready var option_button: OptionButton = $"."

func _process(delta: float) -> void:
	
	#mengecek status option button yang dipilih
	if option_button.selected == 0:
		Global.styleSelected = "classic"
	elif option_button.selected == 1:
		Global.styleSelected = "light"
	elif option_button.selected == 2:
		Global.styleSelected = "dark"
		
		
func usestyle():
	if Global.styleSelected == "classic":
		setstyles(Color.WHEAT,Color.CADET_BLUE,Color.WHITE_SMOKE,Color.BLACK,Color.FIREBRICK,Color.WHITE_SMOKE)
	elif Global.styleSelected == "light":
		setstyles(Color.WHITE_SMOKE,"c9c9c9",Color.WHITE_SMOKE,Color.WEB_GRAY,Color.FIREBRICK,Color.WHITE_SMOKE)
	elif Global.styleSelected == "dark":
		setstyles(Color.BLACK,Color.BLACK,Color.TEAL,Color.TEAL,Color.DARK_RED,Color.TEAL)
		
# mengatur style warna
func setstyles(colorbgmain,colorbgmainsec,buttoncolortext,labelcolortext,labelwarningcolortext,optioncolor):
	
	$"../../ui/ColorRect".color = colorbgmainsec
	$"../../ui/ColorRect3".color = colorbgmainsec
	$"../../ui/ColorRect2".color = colorbgmain
	$"../../ui/Label".add_theme_color_override("font_color",labelcolortext)
	$"../../ui/Label2".add_theme_color_override("font_color",labelcolortext)
	%"total uang".add_theme_color_override("font_color",labelcolortext)
	$"../../ui/version".add_theme_color_override("font_color",labelcolortext)
	
	$"../../ui2/Button".add_theme_color_override("font_color",buttoncolortext)
	$"../../ui2/Label".add_theme_color_override("font_color",labelcolortext)
	%ItemList.add_theme_color_override("font_color",buttoncolortext)
	
	$"../../ui3/ColorRect".color = colorbgmainsec
	$"../../ui3/Label3".add_theme_color_override("font_color",labelcolortext)
	$"../../ui3/Label4".add_theme_color_override("font_color",labelcolortext)
	$"../../ui3/Label5".add_theme_color_override("font_color",labelcolortext)
	$"../../ui3/LineEdit".add_theme_color_override("font_color",buttoncolortext)
	$"../../ui3/OptionButton".add_theme_color_override("font_color",buttoncolortext)
	$"../../ui3/TextEdit".add_theme_color_override("font_color",buttoncolortext)
	$"../../ui3/save".add_theme_color_override("font_color",buttoncolortext)
	$"../../ui3/cancel".add_theme_color_override("font_color",buttoncolortext)
	$"../../ui3/info".add_theme_color_override("font_color",labelwarningcolortext)
	$"../../ui3/info2".add_theme_color_override("font_color",labelwarningcolortext)
	
	
	$"../../ColorRect".color = colorbgmainsec
	$"../../ColorRect/ColorRect".color = optioncolor
	$"../../ColorRect/ColorRect2".color = optioncolor
	$"../../ColorRect/ColorRect3".color = optioncolor
	
	
	$"../../option/ColorRect".color = colorbgmainsec
	$"../../option/Button".add_theme_color_override("font_color",buttoncolortext)
	$"../../option/Button2".add_theme_color_override("font_color",buttoncolortext)
	$"../../option/Button3".add_theme_color_override("font_color",buttoncolortext)
	$"../../option/Button4".add_theme_color_override("font_color",buttoncolortext)
	
	$"../../riwayatfull/ColorRect".color = colorbgmain
	$"../../riwayatfull/riwbutton".add_theme_color_override("font_color",buttoncolortext)
	$"../../riwayatfull/ItemList".add_theme_color_override("font_color",buttoncolortext)
	
	$"../ColorRect".color = colorbgmain
	$"../settbutton".add_theme_color_override("font_color",buttoncolortext)
	$".".add_theme_color_override("font_color",buttoncolortext)
	$"../OptionButton2".add_theme_color_override("font_color",buttoncolortext)
	$"../Label".add_theme_color_override("font_color",labelcolortext)
	$"../Label2".add_theme_color_override("font_color",labelcolortext)
	$"../Label3".add_theme_color_override("font_color",labelcolortext)
	$"../Label4".add_theme_color_override("font_color",labelwarningcolortext)
	$"../savesetting".add_theme_color_override("font_color",buttoncolortext)
	$"../hapusdata".add_theme_color_override("font_color",buttoncolortext)
	
	$"../../catatan/ColorRect".color = colorbgmain
	$"../../catatan/catbutton".add_theme_color_override("font_color",buttoncolortext)
	$"../../catatan/TextEdit".add_theme_color_override("font_color",buttoncolortext)
	
	
	$"../../ktrangan/ColorRect".color = colorbgmainsec
	$"../../ktrangan/Label".add_theme_color_override("font_color",labelcolortext)
	$"../../ktrangan/TextEdit".add_theme_color_override("font_color",buttoncolortext)
	$"../../ktrangan/closebut".add_theme_color_override("font_color",buttoncolortext)
