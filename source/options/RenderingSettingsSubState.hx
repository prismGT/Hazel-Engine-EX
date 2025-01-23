package options;

import flixel.FlxG;

class RenderingSettingsSubState extends BaseOptionsMenu
{
	var fpsOption:Option;
	var bitOption:Option;
	public function new()
	{
		title = Language.getPhrase('rendering_menu', 'Rendering Settings');
		rpcTitle = 'Game Renderer Settings'; //for Discord Rich Presence

		// RENDERING MODE MIGHT NOT WORK ON LINUX, KEEP THAT IN MIND.
		var option:Option = new Option('Rendering Mode', //Name
			'If checked, the game will be able to render charts,\nmaking it easier to showcase Bambi spamtracks.\nRenders are found in the folder named "rendered"', //Description
			'ffmpegMode', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		var option:Option = new Option('Rendering Framerate', //Name
			'Self-explanatory, the game will render videos at the framerate you set.', //Description
			'targetFPS', //Save data variable name
			INT); //Variable type
		addOption(option);

		final refreshRate:Int = FlxG.stage.application.window.displayMode.refreshRate;
		option.minValue = 1;
		option.maxValue = 1000;
		option.scrollSpeed = 125;
		option.decimals = 0;
		option.defaultValue = Std.int(FlxMath.bound(refreshRate, option.minValue, option.maxValue));
		option.displayFormat = '%v FPS';
		option.onChange = onChangeFramerate;
		fpsOption = option;

		var option:Option = new Option('Unlock FPS', //Name
			'If checked, the game will run at 1000 FPS while rendering.\nThis does not affect rendered video performance.', //Description
			'unlockFPS', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		var option:Option = new Option('Unlock FPS', //Name
			'Rendered video encoder. If you dont know what an encoder is, just google it.', //Description
			'vidEncoder', //Save data variable name
			STRING,
			['libx264', 'libx264rgb', 'libx265', 'libxvid', 'libsvtav1', 'mpeg2video']); //Variable type
		addOption(option);

		var option:Option = new Option('Rendering Bitrate', //Name
			'Bitrate of the rendered videos.\nLowering the bitrate will make the video lower quality,\nwhile increasing the bitrate will make the video higher quality.', //Description
			'renderBitrate', //Save data variable name
			FLOAT); //Variable type
		addOption(option);
		option.minValue = 1.0;
		option.maxValue = 100.0;
		option.scrollSpeed = 5;
		option.changeValue = 0.01;
		option.decimals = 2;
		option.displayFormat = '%v Mbps';

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