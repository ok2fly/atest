package com.craft.util.http;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


public class HttpClientConnectionManager {

    private static Logger logger = LogManager.getLogger(HttpClientConnectionManager.class);

    /**
     * 获取SSL验证的HttpClient
     *
     * @param httpClient
     * @return
     */
    public static HttpClient getSSLInstance(HttpClient httpClient) {
        ClientConnectionManager ccm = httpClient.getConnectionManager();
        SchemeRegistry sr = ccm.getSchemeRegistry();
        sr.register(new Scheme("https", MySSLSocketFactory.getInstance(), 443));
        httpClient = new DefaultHttpClient(ccm, httpClient.getParams());
        return httpClient;
    }

    /**
     * 获取 http post/json 请求
     *
     * @param url
     * @return
     */
    public static String getHttpPost(String url, String jsonstr) {

        HttpPost httpPost = new HttpPost(url); // 设置响应头信息
        httpPost.addHeader("Connection", "keep-alive");
        httpPost.addHeader("Content-Type", "application/json;charset=UTF-8");
        StringEntity se = null;
        DefaultHttpClient httpClient = new DefaultHttpClient();
        try {
//            jsonstr = URLEncoder.encode(jsonstr, "UTF-8");
            se = new StringEntity(jsonstr);
            httpPost.setEntity(se);

            HttpResponse response = httpClient.execute(httpPost);


            if (response != null && response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                String resultStr = EntityUtils.toString(response.getEntity(), "utf-8");
                return resultStr;
            }

        } catch (Exception e) {
            e.printStackTrace();
            logger.error("post request err : url = {}, jsonStr = {}, exception = {}", e.toString());
        }finally {
        }

        return null;
    }

    /**
     * 模拟浏览器post提交
     *
     * @param url
     * @return
     */
    public static HttpPost getPostMethod(String url) {
        HttpPost pmethod = new HttpPost(url); // 设置响应头信息
        pmethod.addHeader("Connection", "keep-alive");
        pmethod.addHeader("Accept", "*/*");
        pmethod.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        pmethod.addHeader("Host", "api.mch.weixin.qq.com");
        pmethod.addHeader("X-Requested-With", "XMLHttpRequest");
        pmethod.addHeader("Cache-Control", "max-age=0");
        pmethod.addHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) ");
        return pmethod;
    }

    /**
     * 模拟浏览器GET提交
     *
     * @param url
     * @return
     */
    public static HttpGet getGetMethod(String url) {
        HttpGet pmethod = new HttpGet(url);
        // 设置响应头信息
        pmethod.addHeader("Connection", "keep-alive");
        pmethod.addHeader("Cache-Control", "max-age=0");
        pmethod.addHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) ");
        pmethod.addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/;q=0.8");
        return pmethod;
    }
}
