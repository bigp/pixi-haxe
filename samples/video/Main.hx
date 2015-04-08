package samples.video;

import js.html.VideoElement;
import js.Browser;
import pixi.core.sprites.Sprite;
import pixi.core.display.Container;
import pixi.core.textures.Texture;
import pixi.plugins.app.Application;

class Main extends Application {

	var _vidTexture:Texture;
	var _vidSprite:Sprite;
	var _vidElement:VideoElement;
	var _direction = 1;

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0xE0E6F8;
		onUpdate = _onUpdate;
		onResize = _onResize;
		resize = true;
		width = Browser.window.innerWidth;
		height = Browser.window.innerHeight;
		super.start();

		_vidElement = Browser.document.createVideoElement();
		_vidElement.src = "assets/video/test.mp4";

		_vidTexture = Texture.fromVideoUrl("assets/video/test.mp4");
		_vidSprite = new Sprite(_vidTexture);
		_stage.addChild(_vidSprite);

		//haxe.Timer.delay(_setup, 3000);
	}

	function _setup() {

	}

	function _onUpdate(elapsedTime:Float) {
		_vidSprite.x += _direction;
		if(_vidSprite.x<=0 || (_vidSprite.x+_vidSprite.width)>=width) {
			_direction *= -1;
		}
	}

	function _onResize() {

	}

	static function main() {
		new Main();
	}
}
