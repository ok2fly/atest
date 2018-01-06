package com.craft.base;

import com.craft.common.Const;
import com.craft.pojo.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpSession;

public abstract class BaseController {
    protected Logger logger = LogManager.getLogger(this.getClass());


    protected User getCurrentUser(HttpSession session) {
        if (session == null) {
            return null;
        }
        return (User) session.getAttribute(Const.CURRENT_USER);
    }
}
