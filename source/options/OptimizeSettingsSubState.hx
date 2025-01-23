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

		super();
	}
}