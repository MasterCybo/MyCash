/**
 * Created by Artem on 27.03.2016.
 */
package ru.core.file.commands {
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.core.file.events.IODataEvent;
	import ru.core.file.serialize.DataSerializer;
	import ru.core.file.services.DataFileService;
	import ru.core.file.services.IFileService;
	import ru.solitaire.spider.settings.models.IMoSettings;
	
	
	public class SaveDataCommand extends Command {
		public function SaveDataCommand(event:IODataEvent)
		{
			super(event);
		}

		override public function execute():void
		{
			super.execute();

			var moSettings:IMoSettings = getInstance(IMoSettings);
			var serializer:DataSerializer = new DataSerializer(moSettings);

			var settingsLoader:DataFileService = getInstance(IFileService);
			settingsLoader.save(serializer.serialize());
			
			serializer.destroy();
		}
	}
}
