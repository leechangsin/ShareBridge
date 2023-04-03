package com.sharebridge.util;

public class HtmlUtil {
	public String strToHtml(String str) {
		return str.replace("\r\n", "<br>");
	}
}
