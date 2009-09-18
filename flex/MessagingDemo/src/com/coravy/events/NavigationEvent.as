package com.coravy.events
{
	import flash.events.Event;

	public class NavigationEvent extends Event
	{
		/*-.........................................Constants..........................................*/
		
		public static const DEMO_VIEW:String 	                = "demoView";
		public static const LOGIN:String 			            = "loginNavigationEvent";
		public static const LOGOUT:String 			            = "logoutNavigationEvent";
		
		/*-.........................................Constructor..........................................*/	
		public function NavigationEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}