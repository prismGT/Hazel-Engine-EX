package options;

import objects.Character;

class CustomizeSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = Language.getPhrase('customize_menu', 'Customization Settings');
		rpcTitle = 'Customization Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Watermark Style', //Name
			'What would you prefer to have as the engine watermark?', //Description
			'watermarkStyle', //Save data variable name
			STRING,
			['Hazel Engine', 'DnB', 'JSE', "OS 'Engine'", 'Strident Crisis', 'Hide']);
		addOption(option);

		super();
	}
}