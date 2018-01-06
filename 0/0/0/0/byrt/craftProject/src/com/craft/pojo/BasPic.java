package com.craft.pojo;

import java.util.Date;

public class BasPic {
    private Integer id;

    private String picNam;

    private String picThum;

    private String picUrl;

    private String remark;

    private Date createTime;

    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPicNam() {
        return picNam;
    }

    public void setPicNam(String picNam) {
        this.picNam = picNam == null ? null : picNam.trim();
    }


    public String getPicThum() {
        return picThum;
    }

    public void setPicThum(String picThum) {
        this.picThum = picThum;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl == null ? null : picUrl.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}