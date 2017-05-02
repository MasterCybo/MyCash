/**
 * Created by Artem-Home on 16.03.2017.
 */
package ru.financier.commands
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.FeathersControl;
	import feathers.core.ITextRenderer;
	import feathers.skins.FunctionStyleProvider;
	
	import flash.events.Event;
	
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.financier.assets.EmbededFonts;
	import ru.financier.assets.FinancierTheme;
	
	import starling.text.TextFormat;
	
	public class InitFeathersCommand extends Command
	{
		public function InitFeathersCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		override public function execute():void
		{
			super.execute();
			
			new FinancierTheme();
			new EmbededFonts();
			
			FeathersControl.defaultTextRendererFactory = function():ITextRenderer
			{
				var textRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				textRenderer.styleProvider = null;
				textRenderer.embedFonts = true;
				return textRenderer;
			};
			
			Label.globalStyleProvider = new FunctionStyleProvider(function(label:Label):void {
				label.fontStyles = new TextFormat(EmbededFonts.ROBOTO_REGULAR, 12, 0xFFFFFF);
			});
			
			Button.globalStyleProvider = new FunctionStyleProvider(function(button:Button):void {
				button.fontStyles = new TextFormat(EmbededFonts.ROBOTO_REGULAR, 12, 0xFFFFFF);
			});
			
//			List.globalStyleProvider = new FunctionStyleProvider(function())
		}
	}
}
