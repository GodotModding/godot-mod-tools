extends Node

# Brief overview of what your mod does...

# ! Comments prefixed with "!" mean they are extra info. Comments without them
# ! should be kept because they give your mod structure and make it easier to
# ! read by other modders


const MOD_DIR = "AuthorName-ModName/" # name of the folder that this file is in
const MYMOD_LOG = "AuthorName-ModName" # full ID of your mod (AuthorName-ModName)


var dir = ""
var ext_dir = ""


func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", MYMOD_LOG)

	# ! We can't use `ModLoader` because the ModLoader instance isn't available
	# ! at this point in the mod's loading process. Instead, the class instance
	# ! is passed to a mod's `_init` func via the variable `modLoader`.
	# ! It will be available in any other places in your mod though, such as in
	# ! your _ready func.
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	ext_dir = dir + "extensions/" # ! any script extensions should go in this folder, and should follow the same folder structure as vanilla

	# Add extensions
	modLoader.install_script_extension(ext_dir + "main.gd") # brief description of this edit...
	#modLoader.install_script_extension(ext_dir + "entities/units/player/player.gd") # ! Note that this file does not exist in this example mod

	# ! Add extensions (longform version of the above)
	#modLoader.install_script_extension("res://mods-unpacked/AuthorName-ModName/extensions/main.gd")
	#modLoader.install_script_extension("res://mods-unpacked/AuthorName-ModName/extensions/entities/units/player/player.gd")

	# Add translations
	# ! Load translations for your mod, if you need them.
	# ! Add translations by adding a CSV called "modname.csv" into the "translations" folder.
	# ! Godot will automatically generate a ".translation" file, eg "modname.en.translation".
	# ! Note that in this example, only the file called "modname.csv" is custom;
	# ! any other files in the "translations" folder were automatically generated by Godot
	modLoader.add_translation_from_resource(dir + "translations/modname.en.translation")


func _ready()->void:
	ModLoaderUtils.log_info("Ready", MYMOD_LOG)

	# ! This uses Godot's native `tr` func, which translates a string. You'll
	# ! find this particular string in the example CSV here: translations/modname.csv
	ModLoaderUtils.log_info(str("Translation Demo: ", tr("MODNAME_READY_TEXT")), MYMOD_LOG)
