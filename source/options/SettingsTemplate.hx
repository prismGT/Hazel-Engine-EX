package options;

import objects.Character;

class SettingsTemplate extends BaseOptionsMenu
{
	public function new()
	{
		// i would recommend not removing this state, so you won't have to copy and paste an existing one
		// also dont remove the super(); thing cuz haxe would get mad at you for doing that
		title = Language.getPhrase('template_menu', 'Settings Template');
		rpcTitle = 'Settings Template'; //for Discord Rich Presence

		var option:Option = new Option('foo bar', //Name
			'placeholder', //Description
			'option1', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		super();
	}
}