/**
 * Created by Artem-Home on 20.03.2017.
 */
package ru.financier.assets
{
	import flash.text.Font;
	
	public class EmbededFonts
	{
		[Embed(source = "/./../assets/fonts/roboto/Roboto-Light.ttf", fontName="RobotoLight", embedAsCFF = "false", mimeType="application/x-font")]
		private static const RobotoLight:Class;
		
		[Embed(source = "/./../assets/fonts/roboto/Roboto-Regular.ttf", fontName="RobotoRegular", embedAsCFF = "false", mimeType="application/x-font")]
		private static const RobotoRegular:Class;
		
		[Embed(source = "/./../assets/fonts/roboto/Roboto-Thin.ttf", fontName="RobotoThin", embedAsCFF = "false", mimeType="application/x-font")]
		private static const RobotoThin:Class;
		
		[Embed(source = "/./../assets/fonts/roboto/RobotoCondensed-Light.ttf", fontName="RobotoCondensedLight", embedAsCFF = "false", mimeType="application/x-font")]
		private static const RobotoCondensedLight:Class;
		
		[Embed(source = "/./../assets/fonts/roboto/RobotoCondensed-Regular.ttf", fontName="RobotoCondensedRegular", embedAsCFF = "false", mimeType="application/x-font")]
		private static const RobotoCondensedRegular:Class;
		
		public static const ROBOTO_LIGHT:String = "RobotoLight";
		public static const ROBOTO_REGULAR:String = "RobotoRegular";
		public static const ROBOTO_THIN:String = "RobotoThin";
		public static const ROBOTO_CONDENSED_LIGHT:String = "RobotoCondensedLight";
		public static const ROBOTO_CONDENSED_REGULAR:String = "RobotoCondensedRegular";
		
		public function EmbededFonts()
		{
//			var font:Font = new RobotoLight() as Font;
			Font.registerFont(RobotoLight);
			Font.registerFont(RobotoRegular);
			Font.registerFont(RobotoThin);
			Font.registerFont(RobotoCondensedLight);
			Font.registerFont(RobotoCondensedRegular);
		}
	}
}
