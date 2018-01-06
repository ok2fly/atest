package com.craft.pojo;

import java.util.Date;

public class UserCompetitionInfo {
    private Integer id;

    private Integer useId;

    private String useNam;

    private Integer useSex;

    private Integer age;

    private String useMob;

    private String useIdc;

    private String thirdAcc;

    private String useUnit;

    private String useProfile;

    private Integer proId;

    private Integer cityId;

    private String useAdd;

    private Date createTime;

    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUseId() {
        return useId;
    }

    public void setUseId(Integer useId) {
        this.useId = useId;
    }

    public String getUseNam() {
        return useNam;
    }

    public void setUseNam(String useNam) {
        this.useNam = useNam == null ? null : useNam.trim();
    }

    public Integer getUseSex() {
        return useSex;
    }

    public void setUseSex(Integer useSex) {
        this.useSex = useSex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getUseMob() {
        return useMob;
    }

    public void setUseMob(String useMob) {
        this.useMob = useMob == null ? null : useMob.trim();
    }

    public String getUseIdc() {
        return useIdc;
    }

    public void setUseIdc(String useIdc) {
        this.useIdc = useIdc == null ? null : useIdc.trim();
    }

    public String getThirdAcc() {
        return thirdAcc;
    }

    public void setThirdAcc(String thirdAcc) {
        this.thirdAcc = thirdAcc == null ? null : thirdAcc.trim();
    }

    public String getUseUnit() {
        return useUnit;
    }

    public void setUseUnit(String useUnit) {
        this.useUnit = useUnit == null ? null : useUnit.trim();
    }

    public String getUseProfile() {
        return useProfile;
    }

    public void setUseProfile(String useProfile) {
        this.useProfile = useProfile == null ? null : useProfile.trim();
    }

    public Integer getProId() {
        return proId;
    }

    public void setProId(Integer proId) {
        this.proId = proId;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public String getUseAdd() {
        return useAdd;
    }

    public void setUseAdd(String useAdd) {
        this.useAdd = useAdd == null ? null : useAdd.trim();
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