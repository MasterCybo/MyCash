/**
 * Created by Artem on 27.03.2016.
 */
package ru.core.file.commands {
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.core.file.events.IODataEvent;
	import ru.core.file.serialize.DataSerializer;
	import ru.core.file.services.DataFileService;
	import ru.solitaire.spider.settings.models.IMoSettings;
	
	
	public class LoadDataCommand extends Command {

		public function LoadDataCommand(context:IContext, event:IODataEvent)
		{
			super(context, event);
		}

		override public function execute():void
		{
			super.execute();
			
			var moSettings:IMoSettings = getOf(IMoSettings);
			var serializer:DataSerializer = new DataSerializer(moSettings);

			var settingsLoader:DataFileService = getInstance(DataFileService);
			settingsLoader.load(serializer);

			serializer.destroy();
		}
	}
}
