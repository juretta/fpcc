package com.coravy.business {
	import com.coravy.events.*;
	
	public class AuthorizationManager
	{
		/*-.........................................Properties..........................................*/
		

		/*-.........................................Constructor..........................................*/
		
		public function AuthorizationManager() {
		    
		}
		
		/*-...................................Accessor Methods.......................................*/

		
        /*-.........................................Methods..........................................*/
		public function login(username:String, password:String):Boolean {
			//check hardcoded username and password
			trace("Login");
			if (username == 'test' && password == 'test') {
				return true;
			}
			return false;
		}
		
		public function logout():void {
		    trace('Logout called');
		}

	}
}