package com.craft.base;


import com.craft.util.StringUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/***
 * 检测基类，提供安全检查的基础方法
 */

public class BaseUserCheck {
	
	protected final Logger checkLogger = LogManager.getLogger(this.getClass());
	
	   /***
     * 检测字符串是否是数字
     */
    public boolean autoCheckStringIsNumber(String str){
    		try{
    			Long.parseLong(str);
    		}catch(Exception e){
    			return true;
    		}
    		return false;
    }
    
    
	public boolean isPhoneNum(String login){
		return StringUtil.isPhoneNum(login);
	}
	
	
	
	

}
