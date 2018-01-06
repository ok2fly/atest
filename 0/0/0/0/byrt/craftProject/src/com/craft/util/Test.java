package com.craft.util;

import com.alibaba.fastjson.JSONObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Test {

    private static Logger logger = LogManager.getLogger(Test.class);

    public static void main(String[] args) {
        String json = "{\n" +
                "\"service\": \"login\",\n" +
                "\"user_account\": \"cisc0209\",\n" +
                "\"user_password\": \"03606310a0\",\n" +
                "\"sys_code\": \"901\",\n" +
                "\"login_type\": \"1\",\n" +
                "\"appkey\": \"581144262570BB6B2382CD7A691FA8C6\"\n" +
                "}";
        JSONObject result = null;
//        JSONObject result = HttpClientConnectionManager.getHttpPost("http://test.isolarcloud.com/sungws/AppService", json);
//        logger.debug("{}", result.toString() );
//        JSONObject resultData = result.getJSONObject("result_data");


    }


}
