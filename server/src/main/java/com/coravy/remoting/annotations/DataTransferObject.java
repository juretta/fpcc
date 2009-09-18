package com.coravy.remoting.annotations;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * This annotation marks a class that is used for transfering objects accross
 * system or layer boundaries.
 * 
 * @author Stefan Saasen (stefan@coravy.com)
 */
@Documented
@Target(ElementType.TYPE)
// For now just use this annotation as part of the documentation.
// The annotation will be discarded by the compiler.
@Retention(RetentionPolicy.SOURCE)
public @interface DataTransferObject {

}
