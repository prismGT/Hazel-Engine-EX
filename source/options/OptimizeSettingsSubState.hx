package options;

import objects.Character;

class OptimizeSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = Language.getPhrase('optimize_menu', 'Optimization Settings');
		rpcTitle = 'Optimization Settings'; //for Discord Rich Presence

		var option:Option = new Option('Enable Garbage Collection', //Name
			'If checked, the game will be able to garbage collect,\nimproving performance I think.', //Description
			'enableGC', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		var option:Option = new Option('No Botplay Lag', //Name
			'If checked, the game wont have botplay lag anymore.', //Description
			'noBotLag', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		var option:Option = new Option('Hide Notes', //Name
			'If checked, the game will hide the notes.\nEnabling this will force botplay to be enabled too.', //Description
			'hideNotes', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		super();
	}
}