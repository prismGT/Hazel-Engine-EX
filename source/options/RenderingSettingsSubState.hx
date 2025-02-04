package options;

import objects.Character;

class RenderingSettingsSubState extends BaseOptionsMenu
{
	var fpsOption:Option;
	public function new()
	{
		// i would recommend not removing this state, so you won't have to copy and paste an existing one
		// also dont remove the super(); thing cuz haxe would get mad at you for doing that
		title = Language.getPhrase('rendering_menu', 'Rendering Settings');
		rpcTitle = 'Rendering Settings'; //for Discord Rich Presence

		var option:Option = new Option('HEAVILY WORK IN PROGRESS', //Name
			'Make changes at your own risk.', //Description
			'openDoor', //Save data variable name
			STRING,
			['!']); //Variable type
		addOption(option);

		var option:Option = new Option('Rendering Mode', //Name
			'If checked, the game can render songs,\nmaking it easier to showcase Bambi spamtracks.\nThis will require FFMpeg.', //Description
			'ffmpegMode', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		var option:Option = new Option('Target Rendering FPS', //Name
			'Framerate of your video. Pretty self-explanatory.', //Description
			'targetFPS', //Save data variable name
			INT); //Variable type
		addOption(option);
		final refreshRate:Int = FlxG.stage.application.window.displayMode.refreshRate;
		option.minValue = 1;
		option.maxValue = 1000;
		option.scrollSpeed = 30;
		option.decimals = 0;
		option.defaultValue = Std.int(FlxMath.bound(refreshRate, option.minValue, option.maxValue));
		option.displayFormat = '%v FPS';
		option.onChange = onChangeFramerate;
		fpsOption = option;

		var option:Option = new Option('Unlock Rendering Framerate', //Name
			'If checked, the rendering framerate goes to 1000.', //Description
			'unlockFPS', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		var option:Option = new Option('Render Bitrate', //Name
			'Bitrate of the rendered video.\nIf you dont know what this does,\njust set this to 8.00', //Description
			'renderBitrate', //Save data variable name
			FLOAT); //Variable type
		addOption(option);
		option.minValue = 1.0;
		option.maxValue = 100.0;
		option.scrollSpeed = 5;
		option.changeValue = 0.01;
		option.decimals = 2;
		option.displayFormat = '%v Mbps';

		var option:Option = new Option('Video Encoder', //Name
			'The encoder that the render will use.\nKeep this as default if you dont know\nwhat a video encoder is.', //Description
			'vidEncoder', //Save data variable name
			STRING,
			['libx264', 'libx264rgb', 'libx265', 'libxvid', 'libsvtav1', 'mpeg2video']);
		addOption(option);

		super();
	}
	function onChangeFramerate()
	{
		fpsOption.scrollSpeed = fpsOption.getValue() / 2;
	}
	
	function resetTimeScale()
	{
		FlxG.timeScale = 1;
	}
}