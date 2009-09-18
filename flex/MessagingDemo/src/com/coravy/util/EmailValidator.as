package com.coravy.util {
    /**
    * mx.validators.EmailValidator seems to be pretty heavyweight and does not a very good job.
    * 
    * E.g. those emails are maked as invalid even though they are all VALID:
    * 
    * <ul>
    *     <li>lists+stefan@gmail.com</li>
    *     <li>lists+'@'+stefan@gmail.com</li>
    * </ul>
    */
    public class EmailValidator {

        public function EmailValidator() {
            throw new Error("The EmailValidator should be used in a static way.");
        }
        
        public static const VALID_EMAIL:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;

        /** 
        * Checks if {@code email} is a valid email address.
        *  
        *  @param email The email address (String)
        *  @return true if the email address is valid, false otherwise
        */
        public static function isValidEmail(email : String) : Boolean{
            return Boolean(email.match(VALID_EMAIL));
        }
    }
}