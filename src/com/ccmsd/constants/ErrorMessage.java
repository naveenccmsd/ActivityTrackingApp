package com.ccmsd.constants;

import java.util.Locale;
import java.util.ResourceBundle;

public class ErrorMessage {

	public static  String getMessage(String key){
		Locale loc=Locale.getDefault();
		ResourceBundle rb=ResourceBundle.getBundle("ErrorMessage",loc);
		return rb.getString(key);
	}
}
