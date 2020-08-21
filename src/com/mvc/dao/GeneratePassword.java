package com.mvc.dao;

/**
 * This class is used to generate random password of 10(Default) length, Change
 * the passwordLength variable to change the length of password.
 * 
 * @author sahil
 *
 */
public class GeneratePassword {

	/**
	 * 
	 * @return a alphanumeric string with special symbols of specific length.
	 */
	private static String randomString() {
		String pass = "";
		char alphabet[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
				's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '@', '*', '(', '&',
				'^', '%', '$', '#', '!', };
		int passwordLength = 10;
		for (int i = 0; i < passwordLength; i++) {
			pass += alphabet[(int) (Math.random() * alphabet.length)];
		}
		return pass;
	}

	public static String generate() {
		return randomString();
	}
}
