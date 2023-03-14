package com.sharebridge.dto;

import java.io.Serializable;

public class ProductDto implements Serializable {
	private int product_id;
	private int category_id;
	private int member_id;
	private String title;
	private String content;
	private String sdate;
	private String edate;
	private int price;
	private String photo;
	private String wdate;
	int state;	// 대여상태 0 1 ??
	boolean del;
}
