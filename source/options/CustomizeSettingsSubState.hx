package options;

import objects.Character;

class CustomizeSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = Language.getPhrase('customize_menu', 'Customization Settings');
		rpcTitle = 'Customization Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('WORK IN PROGRESS', //Name
			'These options probably wont\ncrash your game, but\nIm putting this here anyway', //Description
			'openDoor', //Save data variable name
			STRING,
			['!']); //Variable type
		addOption(option);

		var option:Option = new Option('Watermark Style', //Name
			'What would you prefer to have as the engine watermark?', //Description
			'watermarkStyle', //Save data variable name
			STRING,
			['Hazel Engine', 'DnB', 'JSE', "OS 'Engine'", 'Strident Crisis', 'Hide']);
		addOption(option);

		var option:Option = new Option('Watermark Style', //Name
			'For making it harder for people to steal your videos.\nYou can change this in:\nassets/data/ytWatermark.txt', //Description
			'ytWatermark', //Save data variable name
			BOOL);
		addOption(option);

		super();
	}
}