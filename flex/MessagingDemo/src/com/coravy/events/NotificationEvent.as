package com.coravy.events {
    
    import flash.events.Event;
    
    public class NotificationEvent extends Event {
        
		/*-.........................................Constants..........................................*/
		
		public static const MESSAGE_RECEIVED:String = "messageReceived";
		public static const SYSTEM_MESSAGE_RECEIVED:String = "systemMessageReceived";
		
		
		/*-.........................................Properties..........................................*/
		public var message:String;

		/*-.........................................Constructor..........................................*/
		
		public function NotificationEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}

    }
}