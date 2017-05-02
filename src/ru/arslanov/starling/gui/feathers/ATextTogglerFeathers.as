package ru.arslanov.starling.gui.feathers
{
	/**
	 * ...
	 * @author Artem Arslanov
	 */
	public class ATextTogglerFeathers extends ATogglerFeathers
	{

		public function ATextTogglerFeathers(buttonName:String, textLabel:String)
		{
			super(true);
			name = buttonName;
			label = textLabel;
		}
	}
}