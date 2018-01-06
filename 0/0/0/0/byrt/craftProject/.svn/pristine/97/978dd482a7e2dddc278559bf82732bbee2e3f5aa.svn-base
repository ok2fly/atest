package com.craft.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Opus {
    private Integer id;

    private Integer userId;

    private String opusName;

    private Integer opusHot;

    private Integer opusType;

    private Integer groupId;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date creativeTime;

    private Integer state;

    private String material;

    private String productionProcess;

    private String introduction;

    /**
     * 图片列表，逗号分隔
     */
    private String imgIds;

    private Date createTime;

    private Date updateTime;
    
    private Classification classification;
    
    private List<BasPic> basPicLst;
    
    private User user;
    
    

    public Classification getClassification() {
		return classification;
	}

	public void setClassification(Classification classification) {
		this.classification = classification;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getOpusName() {
        return opusName;
    }

    public void setOpusName(String opusName) {
        this.opusName = opusName == null ? null : opusName.trim();
    }

    public Integer getOpusHot() {
        return opusHot;
    }

    public void setOpusHot(Integer opusHot) {
        this.opusHot = opusHot;
    }

    public Integer getOpusType() {
        return opusType;
    }

    public void setOpusType(Integer opusType) {
        this.opusType = opusType;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Date getCreativeTime() {
        return creativeTime;
    }

    public void setCreativeTime(Date creativeTime) {
        this.creativeTime = creativeTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material == null ? null : material.trim();
    }

    public String getProductionProcess() {
        return productionProcess;
    }

    public void setProductionProcess(String productionProcess) {
        this.productionProcess = productionProcess == null ? null : productionProcess.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }


    public String getImgIds() {
        return imgIds;
    }

    public void setImgIds(String imgIds) {
        this.imgIds = imgIds;
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

	/**
	 * @return the basPicLst
	 */
	public List<BasPic> getBasPicLst() {
		return basPicLst;
	}

	/**
	 * @param basPicLst the basPicLst to set
	 */
	public void setBasPicLst(List<BasPic> basPicLst) {
		this.basPicLst = basPicLst;
	}
}