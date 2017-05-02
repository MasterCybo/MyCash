package ru.arslanov.starling.gui.feathers
{
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class ATextButtonFeathers extends AButtonFeathers
	{
		private var _textLabel:String;

		public function ATextButtonFeathers(buttonName:String, textLabel:String)
		{
			_textLabel = textLabel;
			super(true);
			name = buttonName;
			label = _textLabel;
		}
	}
}