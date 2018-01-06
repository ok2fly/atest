/* ========================================== */
/*   Copyright(c) 2017 Neusoft Corporation.   */
/*            All rights reserved.            */
/*            Neusoft CONFIDENTIAL            */
/* ========================================== */
package com.craft.pojo;

/**
 * 接口常用参数
 * <p>
 * This contains the following attributes:<br/>
 * <li><code>SMS_KEY</code></li>
 * <p>
 * 
 * 
 * @author Neusoft
 * @version 1.0
 * @since 1.0
 */
public class InterfaceConstants {

	/**
	 * 短信接口APPKEY
	 */
	public static final String SMS_KEY = "060524b3564a4e64a969dfd2a725dc9e";
	
	/**
	 * 用户注册短信接口template Id
	 */
	public static final String REGIST_SMS_TEMPLATE_ID = "80a9afeff4714e0e93552554c0ba213b";
	/**
	 * 银行卡绑定短信接口template Id
	 */
	public static final String BANKCARD_SMS_TEMPLATE_ID = "9adf7110fdd74cfa8951d32120c4840f";
	/**
	 * 找回密码短信接口template Id
	 */
	public static final String FINDPASSWORD_SMS_TEMPLATE_ID = "af28a824adc747a0b23567c11629dd18";
	
	/**
	 * 阿凡达第三方接口短信接口请求地址 
	 */
//	public static final String AVATARDATA_SMS = "http://v1.avatardata.cn/Sms/Send?key=";
	/**
	 * 美联软通第三方接口短信接口请求地址 
	 */
	public static final String AVATARDATA_SMS = "http://m.5c.com.cn/api/send/index.php?username=";
	/**
	 * 用户名 
	 */
	public static final String SMS_USERNAME = "wctz&password_md5=";
	/**
	 * 密码 
	 */
	public static final String SMS_PASSWORD = "c73b7f8de30855f78a7f507e4a5e0c7e&apikey=";
	/**
	 * APIKEY
	 */
	public static final String SMS_APIKEY = "b82acc0116164f2815cf39974b817244&mobile=";
	/**
	 * Encode
	 */
	public static final String SMS_ENCODE = "&encode=UTF-8&content=";
	/**
	 * content
	 */
	public static final String SMS_CONTENTFST = "%e3%80%90%e4%b8%ad%e5%9b%bd%e6%89%8b%e8%89%ba%e7%bd%91%e3%80%91%e4%b8%ad%e5%9b%bd%e6%89%8b%e8%89%ba%e7%bd%91%e6%b3%a8%e5%86%8c%e7%99%bb%e9%99%86%e9%aa%8c%e8%af%81%e7%a0%81%ef%bc%9a";
	/**
	 * content
	 */
	public static final String SMS_CONTENTLST = "%2c+%e6%9c%ac%e9%aa%8c%e8%af%81%e7%a0%8110%e5%88%86%e9%92%9f%e5%86%85%e6%9c%89%e6%95%88%e3%80%82%e4%b8%ba%e4%bf%9d%e6%8a%a4%e6%82%a8%e7%9a%84%e8%b4%a6%e5%8f%b7%e5%ae%89%e5%85%a8%ef%bc%8c%e8%af%b7%e5%8b%bf%e5%b0%86%e9%aa%8c%e8%af%81%e7%a0%81%e5%91%8a%e7%9f%a5%e4%bb%bb%e4%bd%95%e4%ba%ba%ef%bc%8c%e5%a6%82%e9%9d%9e%e6%9c%ac%e4%ba%ba%e6%93%8d%e4%bd%9c%ef%bc%8c%e8%af%b7%e5%bf%bd%e7%95%a5";

}
