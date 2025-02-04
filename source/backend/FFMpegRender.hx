package backend;

import lime.math.Rectangle;
import haxe.io.Bytes;
import lime.app.Application;
import lime.graphics.Image;
import flixel.FlxG;
import lime.ui.Window;
import sys.FileSystem;

class FFMpegRender {
    var ffmpegMode = ClientPrefs.data.ffmpegMode;
    var targetFPS = ClientPrefs.data.targetFPS;
    var unlockFPS = ClientPrefs.data.unlockFPS;
    public static var process:Process;
	var ffmpegExists:Bool = false;

    public function initRender():Void
        {
            if (!FileSystem.exists(#if linux 'ffmpeg' #else 'ffmpeg.exe' #end))
            {
                trace("\"FFmpeg\" not found! (Is it in the same folder as HazelEngineEX?)");
                return;
            }
    
            if(!FileSystem.exists('rendered/')) {
                trace ('rendered folder not found! Creating the rendered folder...');
                FileSystem.createDirectory('rendered/');
            }
            else
            if(!FileSystem.isDirectory('rendered/')) {
                FileSystem.deleteFile('rendered/');
                FileSystem.createDirectory('rendered/');
            } 
    
            ffmpegExists = true;
    
            process = new Process('ffmpeg', ['-v', 'quiet', '-y', '-f', 'rawvideo', '-pix_fmt', 'rgba', '-s', lime.app.Application.current.window.width + 'x' + lime.app.Application.current.window.height, '-r', Std.string(targetFPS), '-i', '-', '-c:v', ClientPrefs.data.vidEncoder, '-b', Std.string(ClientPrefs.data.renderBitrate * 1000000),  'rendered/' + Paths.formatToSongPath(PlayState.SONG.song) + '.mp4']);
            FlxG.autoPause = false;
        }
    
        public function pipeFrame():Void
        {
            if (!ffmpegExists || process == null)
            return;
    
            var img = lime.app.Application.current.window.readPixels(new lime.math.Rectangle(FlxG.scaleMode.offset.x, FlxG.scaleMode.offset.y, FlxG.scaleMode.gameSize.x, FlxG.scaleMode.gameSize.y));
            var bytes = img.getPixels(new lime.math.Rectangle(0, 0, img.width, img.height));
            process.stdin.writeBytes(bytes, 0, bytes.length);
        }
    
        public static function stopRender():Void
        {
            if (!ClientPrefs.data.ffmpegMode)
                return;
    
            if (process != null){
                if (process.stdin != null)
                    process.stdin.close();
    
                process.close();
                process.kill();
            }
    
            FlxG.autoPause = ClientPrefs.data.autoPause;
        }
}