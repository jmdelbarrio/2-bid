package com.flexoop.utility {
 
	public class MenuItemWithChildren extends MenuItem {
 
		/***********************************
		 * properties
		 **********************************/
 
		private var _children:Array = [];
 
		/***********************************
		 * getters
		 **********************************/
 
		public function get children():Array {
			return this._children;
		}
 
		/***********************************
		 * setters
		 **********************************/
 
		public function set children( value:Array ):void {
			this._children = value;
		}
 
		public function MenuItemWithChildren( label:String="", menuHandler:Function=null, enabled:Boolean=true, type:String="normal", toggled:Boolean=true, groupName:String="", icon:Class=null ) {
			super( label, menuHandler, enabled, type, toggled, groupName, icon );
		}
 
	}
}