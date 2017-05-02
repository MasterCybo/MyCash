/**
 * Created by Artem on 02.04.2016.
 */
package ru.core.file.services {
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import ru.core.file.events.FileServiceEvent;
	
	import ru.core.file.serialize.IJSONSerializer;
	
	
	public class DataFileService extends EventDispatcher implements IFileService {

		public static const FILE:String = "financier_db.json";

		private var _file:File = File.applicationStorageDirectory.resolvePath(FILE);
		private var _fileStream:FileStream = new FileStream();

		public function DataFileService()
		{
			super();
		}

		public function load(serializer:IJSONSerializer):void
		{
			trace("Load settings : " + _file.url);
			trace("\tfile exists : " + _file.exists);
			if (_file.exists) {
				_fileStream.open(_file, FileMode.READ);
				var textData:String = _fileStream.readUTFBytes(_file.size);
				_fileStream.close();

				trace("Settings data :\n\t" + textData);

				if (textData != "") {
					trace("\tdata successful");
					serializer.deserialize(textData);
					dispatchEvent(new FileServiceEvent(FileServiceEvent.COMPLETE));
				} else {
					trace("\tdata error");
					dispatchEvent(new FileServiceEvent(FileServiceEvent.ERROR));
				}
			}
		}

		public function save(data:String):void
		{
			trace("Save to : " + _file.url);
			trace("Data :\n\t" + data);
			_fileStream.open(_file, FileMode.WRITE);
			_fileStream.writeUTFBytes(data);
			_fileStream.close();
			dispatchEvent(new FileServiceEvent(FileServiceEvent.COMPLETE));
		}
	}
}
