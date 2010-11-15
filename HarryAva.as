package {
	import flash.system.*;
	import flash.display.*;
	import flash.filters.*;
	import flash.net.* ;
	import flash.events.*;
	import flash.utils.*;
	import flash.geom.*;
	import data.*;
	//import data.text;
	import api.MD5;
	import adobe.PNGEncoder;
	import com.adobe.serialization.json.JSON;

	public class HarryAva extends Sprite{
		
private var myBevel:BevelFilter;
private var user_photo:Loader;
private var save_text:text;
private var loader:URLLoader;
private var request:URLRequest;
public var wrapper: Object;
public var serv:String;
private var save_button:Sprite;
private var myShadow:DropShadowFilter;
public var background:Loader;

		public function HarryAva() {
			
			 
			 this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			}
		
		public function onAddedToStage(e: Event): void {
    			wrapper = Object(this.parent.parent);
    			 
    			serv = "http://high.dih.ru/HarryAva/";
    		var context:LoaderContext = new LoaderContext();
				context.checkPolicyFile = true;
			
			myShadow = new DropShadowFilter();
				myShadow.blurX = 5;
				myShadow.blurY = 5;
				myShadow.quality = 10;
				myShadow.inner = true;
				
			var myShadow2 = new DropShadowFilter();
				//myShadow2.blurX = 5;
				//myShadow2.blurY = 5;
				myShadow2.quality = 5;
				
			var back_sprite:Sprite = new Sprite();
			back_sprite.graphics.beginFill(0x000000,1);
			back_sprite.graphics.lineStyle(0);
			back_sprite.graphics.drawRect(0, 0, 640, 550);
				addChild(back_sprite);
				
			background = new Loader();
				background.load(new URLRequest("http://high.dih.ru/HarryAva/backgr2.jpg"), context);		
				addChild(background);
				
			var logo:Loader = new Loader();
				logo.load(new URLRequest(serv + "harrypotter_logo.png"), context);
				logo.x = 260;
				logo.y = 5;
				logo.scaleX = 0.5;
				logo.scaleY = 0.4;
				logo.filters = [myShadow2];
				addChild(logo);
				 
				 
				 
				 
			// ----------------------------------------------------------- /////////////
			var version:text = new text(585, 50, "version .01.3b", "1");
				addChild(version);
			// -----------------------------------------------------------////////////////
			
				
			var avatar_shape:Sprite = new Sprite();
			avatar_shape.graphics.beginFill(0xFFFFFF,0.8);
			avatar_shape.graphics.lineStyle(0.8);
			avatar_shape.graphics.drawRoundRect(20, 15, 220, 525, 14);
			avatar_shape.filters = [myShadow];
				addChild(avatar_shape);
				
			var add_shape:Sprite = new Sprite();
			add_shape.graphics.beginFill(0xffffFF,0.5);
			add_shape.graphics.lineStyle(0.8);
			add_shape.graphics.drawRoundRect(280, 70, 320, 280, 25);
			add_shape.filters = [myShadow];
				addChild(add_shape);
			
			
			save_button = new Sprite();
			save_button.graphics.beginFill(0xffffFF,0.8);
			save_button.graphics.lineStyle(0.8);
			save_button.graphics.drawRoundRect(370, 380, 150, 40, 25);
			save_button.filters = [myShadow];
			save_button.addEventListener(MouseEvent.MOUSE_OVER, mouseOverSave);
			save_button.addEventListener(MouseEvent.MOUSE_OUT, mouseOutSave);
			
					addChild(save_button);
			
			save_text = new text(445, 390, "Готово! загрузить!", "ads_well");
			save_text.addEventListener(MouseEvent.CLICK, saveClickEvent);
			save_text.addEventListener(MouseEvent.MOUSE_OVER, mouseOverSave);
			//save_button.addEventListener(MouseEvent.MOUSE_OUT, mouseOutSave);
				addChild(save_text);
			
			var buttons_array:Array = new Array();
				var bn:int = 30;
			
			
			buttons_array[1] = new button(300, 80, serv, "Hogwarts-web_s.jpg", "Hogwarts-web.jpg");
			buttons_array[2] = new button(300, 130, serv, "5472045_s.png", "5472045.png");
			buttons_array[3] = new button(300, 180, serv, "images_s.jpeg", "images.jpeg");
			buttons_array[4] = new button(300, 230, serv, "web2_s.gif", "web2.gif");
			buttons_array[5] = new button(300, 280, serv, "Griffindor_s.jpg", "Griffindor.jpg");
			
			buttons_array[6] = new button(350, 80, serv, "1-web_s.jpg", "1-web.jpg");
			buttons_array[7] = new button(350, 130, serv, "Ravenclaw-web_s.jpg", "Ravenclaw-web.jpg");
			buttons_array[8] = new button(350, 180,	serv, "Slytherin-web_s.jpg", "Slytherin-web.jpg");
			buttons_array[9] = new button(350, 230, serv, "hogwarts_s.jpg", "hogwarts.JPG");
			buttons_array[10] = new button(350, 280, serv, "mini-poster_s.jpg", "mini-poster.jpg");
			
			buttons_array[11] = new button(400, 80, serv, "beauxbatons_s.png", "beauxbatons.png");
			buttons_array[12] = new button(400, 130, serv, "durmstrang_s.jpg", "durmstrang.jpg");
			buttons_array[13] = new button(400, 180, serv, "11320189_gal_s.jpg", "11320189_gal.jpg");
			buttons_array[14] = new button(400, 230, serv, "hogwarts-thumb_s.jpg", "hogwarts-thumb.jpg");
			buttons_array[15] = new button(400, 280, serv, "hp_dh_banner_s.jpg", "hp_dh_banner.jpg");
			
			buttons_array[16] = new button(450, 80, serv, "hogwarts07b_s.jpg", "hogwarts07b.jpg");
			buttons_array[17] = new button(450, 130, serv, "images2_s.jpeg", "images2.jpeg");
			buttons_array[18] = new button(450, 180, serv, "hogwarts05a_s.jpg", "hogwarts05a.jpg");
			buttons_array[19] = new button(450, 230, serv, "11285793_gal_s.jpg", "11285793_gal.jpg");
			buttons_array[20] = new button(450, 280, serv, "11285791_gal_s.jpg", "11285791_gal.jpg");
			
			buttons_array[21] = new button(500, 80, serv, "11285774_gal_s.jpg", "11285774_gal.jpg");
			buttons_array[22] = new button(500, 130, serv, "11285776_gal_s.jpg", "11285776_gal.jpg");	
			buttons_array[23] = new button(500, 180, serv, "11285779_gal_s.jpg", "11285779_gal.jpg");
			buttons_array[24] = new button(500, 230, serv, "11285784_gal_s.jpg", "11285784_gal.jpg");
			buttons_array[25] = new button(500, 280, serv, "11285785_gal_s.jpg", "11285785_gal.jpg");
			
			buttons_array[26] = new button(550, 80, serv, "character-dobby_s.jpg", "character-dobby.jpg");
			buttons_array[27] = new button(550, 130, serv, "Movie-Poster_s.jpg", "Movie-Poster.jpg");
			buttons_array[28] = new button(550, 180, serv, "part-i-poster_s.jpg", "part-i-poster.jpg");
			buttons_array[29] = new button(550, 230, serv, "11285786_gal_s.jpg", "11285786_gal.jpg");
			buttons_array[30] = new button(550, 280, serv, "11285789_gal_s.jpg", "11285789_gal.jpg");	
		
			for (var ii:int = 1; ii <= bn; ii++) {
				addChild(buttons_array[ii]);
			}
				
				 
				 
		// запрос аватарки		 
		var api_id:String = "1962122";
		var viewer_id = stage.loaderInfo.parameters.viewer_id;
		var api_secret:String = 'd9jgtIEQYw';
		var test_mode:Number = 1;
	
		var methodFromAPI = "getProfiles";
		
		var _sig:String = viewer_id + 'api_id='+api_id+'fields=photo_bigmethod='+methodFromAPI+'test_mode='+test_mode+'uids='+ viewer_id +'v=2.0'+ api_secret;
		var sig:String = MD5.encrypt(_sig); // используем метод hash класса md5 и получаем сигнатуру
		
		var request = new URLRequest("http://api.vkontakte.ru/api.php");
  		request.method = URLRequestMethod.POST;
  		
  		var v:URLVariables = new URLVariables();
  		v.api_id = api_id;
		v.v = "2.0"; // Версия АПИ
		v.method = methodFromAPI;
		v.uids = viewer_id;
		v.test_mode = test_mode;
		v.sig = sig;
		v.fields = "photo_big";
	
   		request.data = v;
          
		var loader222:URLLoader = new URLLoader();
		loader222.dataFormat = URLLoaderDataFormat.TEXT;
		loader222.addEventListener(Event.COMPLETE, loadVkComplete);
		loader222.load(request);
		}
		
		public function loadVkComplete(e:Event):void {
	
			var answer= new XML(e.target.data);
			answer.ignoreWhite = true;
			
			var context:LoaderContext = new LoaderContext();
				context.checkPolicyFile = true;
				
			user_photo = new Loader();
			user_photo.load(new URLRequest(answer.user[0].photo_big.text()), context);
			user_photo.x = 30;
			user_photo.y = 25;
			//user_photo.addEventListener(MouseEvent.CLICK, doit);
			addChildAt(user_photo, 5);
			
			}
			
		public function saveClickEvent(e:MouseEvent):void {
			
			var api_id:String = "1962122";
		var viewer_id = stage.loaderInfo.parameters.viewer_id;
		var api_secret:String = 'd9jgtIEQYw';
		var test_mode:Number = 0;
	
		var methodFromAPI = "photos.getProfileUploadServer";
		
		var _sig:String = viewer_id + 'api_id='+api_id+'method='+methodFromAPI+'test_mode='+test_mode+'v=2.0'+ api_secret;
		var sig:String = MD5.encrypt(_sig); // используем метод hash класса md5 и получаем сигнатуру
		
		var request = new URLRequest("http://api.vkontakte.ru/api.php");
  		request.method = URLRequestMethod.POST;
  		
  		var v:URLVariables = new URLVariables();
  		v.api_id = api_id;
		v.v = "2.0"; // Версия АПИ
		v.method = methodFromAPI;
		//v.uids = viewer_id;
		v.test_mode = test_mode;
		v.sig = sig;
		//v.fields = "photo_big";
	
   		request.data = v;
          
		var loader222:URLLoader = new URLLoader();
		loader222.dataFormat = URLLoaderDataFormat.TEXT;
		loader222.addEventListener(Event.COMPLETE, loadUploadServerComplete);
		loader222.load(request);
		
		//save_text.setText("loaded");
		
		}
		
		public function loadUploadServerComplete(e:Event):void {
				Security.allowDomain("*");
			
			var answer= new XML(e.target.data);
			save_text.setText("server load");
			
			var raw:BitmapData = new BitmapData(stage.width, stage.height);
			//save_text.setText("error 1");
				//raw.draw(background);
				raw.draw(stage);
			save_text.setText("error 2");	
			
			var newPhoto:BitmapData = new BitmapData(200, 500);
				newPhoto.copyPixels(raw, new Rectangle(30, 25, 200, 500), new Point(0, 0));
			
      		var brr:ByteArray = PNGEncoder.encode(newPhoto);
      		
      		var boundary:String = "blablabla-spycom";
			var header1:* = "\r\n--" + boundary + "\r\n" + "Content-Disposition: form-data; name=\"photo\"; filename=\"photo.png\"\r\n" + "Content-Type: image/png\r\n\r\n" + "";
			var header2:* = "--" + boundary + "\r\n" + "Content-Disposition: form-data; name=\"Upload\"\r\n\r\n" + "Submit Query\r\n" + "--" + boundary + "--";
			var headerBytes1:* = new ByteArray();
				headerBytes1.writeMultiByte(header1, "ascii");
			var headerBytes2:* = new ByteArray();
				headerBytes2.writeMultiByte(header2, "ascii");
			
			
			
			var sendBytes:ByteArray = new ByteArray();
			sendBytes.writeBytes(headerBytes1, 0, headerBytes1.length);
			sendBytes.writeBytes(brr, 0, brr.length);
			sendBytes.writeBytes(headerBytes2, 0, headerBytes2.length);
			
			
			
      		var api_id:String = "1962122";
		var viewer_id = stage.loaderInfo.parameters.viewer_id;
		var api_secret:String = 'd9jgtIEQYw';
		var test_mode:Number = 1;
			
		request = new URLRequest(answer.upload_url.text());
  		request.method = URLRequestMethod.POST;
  		request.contentType = "multipart/form-data; boundary=" + "blablabla-spycom";
   		request.data = sendBytes;
   		
   		//save_text.setText("wtf!!!!");
         
		loader = new URLLoader();
		//loader222.dataFormat = URLLoaderDataFormat.BINARY;
		loader.addEventListener(Event.COMPLETE, loadPhotoComplete);
		//loader222.load(request);
		//doit(null);
		save_text.setText("Ура, теперь СОХРАНИТЬ!");
		save_text.removeEventListener(MouseEvent.CLICK, saveClickEvent);
		save_text.addEventListener(MouseEvent.CLICK, doit);
		
			
		}
		
		public function doit(e:MouseEvent):void{
			loader.load(request);
		}
		 
		 
		
		private function loadPhotoComplete(e:Event):void {
			//save_text.setText("PhotoCmpl");
			
			var json_data:Object=JSON.decode(e.target.data);
			
			//save_text.setText(e.target.data);
			
			var api_id:String = "1962122";
			var viewer_id = stage.loaderInfo.parameters.viewer_id;
			var api_secret:String = 'd9jgtIEQYw';
			var test_mode:Number = 1;
	
			var methodFromAPI = "photos.saveProfilePhoto";
		
			var _sig:String = viewer_id + 'api_id='+api_id+'hash='+json_data.hash+'method='+methodFromAPI+'photo='+json_data.photo+'server='+json_data.server+'test_mode='+test_mode+'v=2.0'+ api_secret;
			var sig:String = MD5.encrypt(_sig); // используем метод hash класса md5 и получаем сигнатуру
		
			var request = new URLRequest("http://api.vkontakte.ru/api.php");
  			request.method = URLRequestMethod.POST;
  		
  			var v:URLVariables = new URLVariables();
  			v.api_id = api_id;
			v.v = "2.0"; // Версия АПИ
			v.method = methodFromAPI;
			//v.uids = viewer_id;
			v.test_mode = test_mode;
			v.sig = sig;
  			v.server = json_data.server;
			v.photo = json_data.photo;
			v.hash = json_data.hash;
	
   			request.data = v;
          
			var loader222:URLLoader = new URLLoader();
			//loader222.dataFormat = URLLoaderDataFormat.TEXT;
			loader222.addEventListener(Event.COMPLETE, loadHashComplete);
			loader222.load(request);
		}
		
		private function  loadHashComplete(e:Event):void {
			save_text.setText("Сохранено!");
			save_text.addEventListener(MouseEvent.CLICK, saveClickEvent);
			save_text.removeEventListener(MouseEvent.CLICK, doit);
			var answer= new XML(e.target.data);
			//save_text.setText(answer);
			wrapper.external.showProfilePhotoBox(answer.photo_hash.text());
			
		}
		private function mouseOverSave(e:MouseEvent):void {
			var myGlow:GlowFilter = new GlowFilter();
				myGlow.color = 0xFF0066;
				
			save_button.graphics.beginFill(0x6699FF,0.8);
			save_button.graphics.lineStyle(0.8);
			save_button.graphics.drawRoundRect(370, 380, 150, 40, 25);
			save_button.filters = [myShadow, myGlow];
		}
		private function mouseOutSave(e:MouseEvent):void {
			var myGlow:GlowFilter = new GlowFilter();
				myGlow.color = 0x9999FF;
			save_button.graphics.beginFill(0xffffFF,0.8);
			save_button.graphics.lineStyle(0.8);
			save_button.graphics.drawRoundRect(370, 380, 150, 40, 25);	
			save_button.filters = [myShadow];
			
			 
		}
	}
}