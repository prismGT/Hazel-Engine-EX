package options;

import objects.Character;

class SettingsTemplate extends BaseOptionsMenu
{
	public function new()
	{
		title = Language.getPhrase('template_menu', 'Settings Template');
		rpcTitle = 'youre not supposed to be in this substate.'; //for Discord Rich Presence

		var option:Option = new Option('foo bar', //Name
			'placeholder', //Description
			'option1', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		super();
	}
}