package react.native.image_crop_picker;

import js.Promise;
import haxe.io.Bytes;

@:jsRequire('react-native-image-crop-picker', 'default')
extern class ImagePicker {
	public static function openPicker(input:PickerInput):Promise<Dynamic>;
	public static function openCamera(input:CameraInput):Promise<Dynamic>;
	public static function clean():Promise<Void>;
}

typedef PickerInput = {
	?width:Int,
	?height:Int,
	?cropping:Bool,
	?multiple:Bool,
	?includeBase64:Bool,
	#if ios
	?maxFiles:Int,
	?compressVideo:Bool,
	?smartAlbums:Array<AlbumTypes>,
	#end
}

typedef CameraInput = {
	?width:Int,
	?height:Int,
	?cropping:Bool,
}

typedef ImagePickerResponse = {
	path:String,
	width:Int,
	height:Int,
	mime:String,
	size:Int,
	data:Bytes,
}

@:enum
abstract AlbumTypes(String) {
	var UserLibrary = 'UserLibrary';
	var PhotoStream = 'PhotoStream';
	var Panoramas = 'Panoramas';
	var Videos = 'Videos';
	var Bursts = 'Bursts';
}