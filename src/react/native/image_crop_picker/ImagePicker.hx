package react.native.image_crop_picker;

import js.Promise;

@:jsRequire('react-native-image-crop-picker', 'default')
extern class ImagePicker {
	public static function openPicker(input:Request):Promise<Response>;
	public static function openCamera(input:Request):Promise<Response>;
	public static function openCropper(input:CropperRequest):Promise<Response>;
	public static function clean():Promise<Void>;
}

typedef CropperRequest = {
	> Request,
	path:String,
}

typedef Request = {
	?cropping:Bool,
	?width:Int,
	?height:Int,
	?multiple:Bool,
	?includeBase64:Bool,
	?includeExif:Bool,
	?cropperToolbarTitle:String,
	?cropperCircleOverlay:Bool,
	?compressImageMaxWidth:Int,
	?compressImageMaxHeight:Int,
	?compressImageQuality:Float,
	?mediaType:String,
	#if ios
	?writeTempFile:Bool,
	?minFiles:Int,
	?maxFiles:Int,
	?waitAnimationEnd:Bool,
	?smartAlbums:Array<AlbumTypes>,
	?useFrontCamera:Bool,
	?compressVideoPreset:String,
	?loadingLabelText:String,
	?showsSelectedCount:Bool,
	#else
	?cropperActiveWidgetColor:String,
	?cropperStatusBarColor:String,
	?cropperToolBarColor:String,
	?freeStyleCropEnabled:String,
	?disableCropperColorSetters:Bool,
	?showCropGuidelines:Bool,
	?hideBottomControls:Bool,
	?enableRotationGeseture:Bool,
	#end
}

typedef Response = {
	path:String,
	#if ios
	localIdentifier:String,
	sourceURL:String,
	filename:String,
	#end
	width:Int,
	height:Int,
	mime:String,
	size:Int,
	data:String,
	exif:Dynamic,
	cropRect:{width:Int, height:Int, x:Int, y:Int},
	creationDate:String,
	modificationDate:String,
}

@:enum
abstract AlbumTypes(String) {
	var UserLibrary = 'UserLibrary';
	var PhotoStream = 'PhotoStream';
	var Panoramas = 'Panoramas';
	var Videos = 'Videos';
	var Bursts = 'Bursts';
}