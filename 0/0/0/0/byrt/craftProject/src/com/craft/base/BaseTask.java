package com.craft.base;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public abstract class BaseTask {
    protected Logger logger = LogManager.getLogger(this.getClass());
}
