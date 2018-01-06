/**
 * @Title: SessionListener.java
 * @Package com.xjtraffic.session
 * @Description: TODO(用一句话描述该文件做什么)
 * @author dingkunjie
 * @date 2016年1月16日 下午2:51:24
 * @version V1.0
 */
package com.craft.session;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.HashMap;
import java.util.Map;

/**
 * @author dingkunjie
 * @version V1.0
 * @Title: SessionListener.java
 * @Package com.xjtraffic.session
 * @Description: TODO(用一句话描述该文件做什么)
 * @date 2016年1月16日 下午2:51:24
 */
public class SessionListener implements HttpSessionListener {
    private MySessionContext myc = MySessionContext.getInstance();

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        myc.AddSession(httpSessionEvent.getSession());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        HttpSession session = httpSessionEvent.getSession();
        myc.DelSession(session);
    }
}
