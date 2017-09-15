package com.lbcto.utils;


/**
 * 
 * @描述   产生一个随机码
 * @作者 lubiao
 * @时间 2017年8月8日-下午3:33:09
 *
 */
public class CreatCode {


	public static String getCode() {
		String code = "";
		String[] s = new String[] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G",
				"H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b",
				"c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w",
				"x", "y", "z" };
		for (int i = 0; i < 6; i++) {

			code += s[(int) (Math.random() * 62)];
		}
		return code;
	}

	public static void main(String[] args) {
		for(int i =0;i<10;i++){
			System.out.println(getCode());
		}
		
	}
}
