package com.flexoop.utility {
 
	[Bindable]
	public class MenuItem {
 
		/***********************************
		 * properties
		 **********************************/
 
		private var _enabled:Boolean = true;
		private var _groupName:String = "";
		private var _icon:Class;
		private var _label:String = "";
		private var _menuHandler:Function;
		private var _toggled:Boolean = true;
		private var _type:String = "";
 
		/***********************************
		 * getters
		 **********************************/
 
		public function get enabled():Boolean {
			return this._enabled;
		}
 
		public function get groupName():String {
			return this._groupName;
		}
 
		public function get icon():Class {
			return this._icon;
		}
 
		public function get label():String {
			return this._label;
		}
 
		public function get menuHandler():Function {
			return this._menuHandler;
		}
 
		public function get toggled():Boolean {
			return this._toggled;
		}
 
		public function get type():String {
			return this._type;
		}
 
		/***********************************
		 * setters
		 **********************************/
 
		public function set enabled( value:Boolean ):void {
			this._enabled = value;
		}
 
		public function set groupName( value:String ):void {
			this._groupName = value;
		}
 
		public function set icon( value:Class ):void {
			this._icon = value;
		}
 
		public function set label( value:String ):void {
			this._label = value;
		}
 
		public function set menuHandler( value:Function ):void {
			this._menuHandler = value;
		}
 
		public function set toggled( value:Boolean ):void {
			this._toggled = value;
		}
 
		[Inspectable(enumeration=separator,check,radio,normal)]
		public function set type( value:String ):void {
			this._type = value;
		}
 
		public function MenuItem( label:String="", menuHandler:Function=null, enabled:Boolean=true, type:String="normal", toggled:Boolean=true, groupName:String="", icon:Class=null ) {
			this.enabled = enabled;
			this.groupName = groupName;
			this.icon = icon;
			this.label = label;
			this.menuHandler = menuHandler;
			this.toggled = toggled;
			this.type = type;
		}
 
	}
}