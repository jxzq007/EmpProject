package org.zhangqing.test;

import org.zhangqing.util.MD5Code;

public class TestMD5Demo {

	public static void main(String[] args) {
		String password = "1q2w";
		String md5 = new MD5Code().getMD5ofStr(password);
		System.out.println(md5);
		System.out.println(md5.length());
	}

}
