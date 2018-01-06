package com.craft.pojo;

import java.util.Date;

public class MatchOrg {
    private Integer id;

    private String guideUnit;

    private String sponsorUnit;

    private String coOrg;

    private String platformPartners;

    private String mediaCoop;

    private Date createTime;

    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGuideUnit() {
        return guideUnit;
    }

    public void setGuideUnit(String guideUnit) {
        this.guideUnit = guideUnit == null ? null : guideUnit.trim();
    }

    public String getSponsorUnit() {
        return sponsorUnit;
    }

    public void setSponsorUnit(String sponsorUnit) {
        this.sponsorUnit = sponsorUnit == null ? null : sponsorUnit.trim();
    }

    public String getCoOrg() {
        return coOrg;
    }

    public void setCoOrg(String coOrg) {
        this.coOrg = coOrg == null ? null : coOrg.trim();
    }

    public String getPlatformPartners() {
        return platformPartners;
    }

    public void setPlatformPartners(String platformPartners) {
        this.platformPartners = platformPartners == null ? null : platformPartners.trim();
    }

    public String getMediaCoop() {
        return mediaCoop;
    }

    public void setMediaCoop(String mediaCoop) {
        this.mediaCoop = mediaCoop == null ? null : mediaCoop.trim();
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