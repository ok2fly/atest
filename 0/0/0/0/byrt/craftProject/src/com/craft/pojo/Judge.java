package com.craft.pojo;

import java.util.Date;

public class Judge {
    private Integer id;

    private Integer matchId;

    private String name;

    private String judgeIntr;

    private String judgeTitle;

    private Date createTime;

    private Date updateTime;
    
    private int picId;
    
    private BasPic basPic;
    
    
    
    

    public int getPicId() {
		return picId;
	}

	public void setPicId(int picId) {
		this.picId = picId;
	}

	public BasPic getBasPic() {
		return basPic;
	}

	public void setBasPic(BasPic basPic) {
		this.basPic = basPic;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMatchId() {
        return matchId;
    }

    public void setMatchId(Integer matchId) {
        this.matchId = matchId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getJudgeIntr() {
        return judgeIntr;
    }

    public void setJudgeIntr(String judgeIntr) {
        this.judgeIntr = judgeIntr == null ? null : judgeIntr.trim();
    }

    public String getJudgeTitle() {
        return judgeTitle;
    }

    public void setJudgeTitle(String judgeTitle) {
        this.judgeTitle = judgeTitle == null ? null : judgeTitle.trim();
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