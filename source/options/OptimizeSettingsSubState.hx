package options;

import objects.Character;

class OptimizeSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = Language.getPhrase('optimize_menu', 'Optimization Settings');
		rpcTitle = 'Optimization Settings'; //for Discord Rich Presence

		var option:Option = new Option('WORK IN PROGRESS', //Name
			'Make changes at your own risk.', //Description
			'openDoor', //Save data variable name
			STRING,
			['!']); //Variable type
		addOption(option);
		/*
		this is here for when you want to say that the features are a wip
		while showing it in-game
		*/

		var option:Option = new Option('Enable Garbage Collection', //Name
			'If checked, the game will be able to garbage collect,\nimproving performance I think.\nDisable this to load bigger charts without insane lag when playing.', //Description
			'enableGC', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		var option:Option = new Option('Hide Score Popups', //Name
			'If checked, the game will hide score popups.\nApparently this would fix botplay lag in\nPsych Engine but not P-Slice???????? :sob:\nFun fact: this is still called "noBotLag" in the code\n- prism', //Description
			'noBotLag', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		var option:Option = new Option('Show Notes and Strums', //Name
			'If unchecked, the game will hide the notes and strums.\nYou will still be able to hit the notes though.', //Description
			'showNotes', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		super();
	}
}