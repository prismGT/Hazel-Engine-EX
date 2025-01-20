package options;

import objects.Character;

class RenderingSettingsSubState extends BaseOptionsMenu
{
	var antialiasingOption:Int;
	var boyfriend:Character = null;
	public function new()
	{
		title = Language.getPhrase('rendering_menu', 'Rendering Settings');
		rpcTitle = 'Game Renderer Settings Menu (WIP FEATURE)'; //for Discord Rich Presence

		// currently rendering mode doesnt do anything.
		var option:Option = new Option('Rendering Mode', //Name
			'If checked, the game will be able to render charts,\nmaking it easier to showcase Bambi spamtracks.', //Description
			'ffmpegMode', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		super();
	}
}