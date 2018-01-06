package com.craft.dao;


import java.util.List;



import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.craft.pojo.Opus;

public interface OpusMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Opus record);

    int insertSelective(Opus record);

    Opus selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Opus record);

    int updateByPrimaryKey(Opus record);
    
    
    
    List<Opus> selOpus(Integer id);
    
	List<Map<String, Object>> selOpusByNewHotAge(Map<String, Object> inpOpusMap);
	
	List<Map<String, Object>> selOpusByOpusId(Map<String, Object> inpOpusMap);
	
	List<Map<String, Object>> selBasReg();
	
	List<Map<String, Object>> selBasRegCity(Map<String, Object> inpOpusMap);
	
	List<Map<String, Object>> selBasRegArea(Map<String, Object> inpOpusMap);
	
	List<Map<String, Object>> selAgeByCityArea(Map<String, Object> inpOpusMap);
	
	
	void vote(Map<String, Object> inpOpusMap);
	
	List<Map<String, Object>> selVoteByIpAndOpusId(Map<String, Object> inpOpusMap);
	
	void updOpusHot(Map<String, Object> inpOpusMap);
	
	List<Map<String, Object>> selOpusHotByOpusId(Map<String, Object> mapVote);
	
	List<Map<String, Object>> selVoteByOpusId(Map<String, Object> map);
	
	List<Map<String, Object>> selUserByUserId(Map<String, Object> map);
	
	List<Map<String, Object>> selOpusByUserId(Map<String, Object> map);
	
	void addUser(Map<String, Object> map);
	
	List<Map<String, Object>> selUserByMob(Map<String, Object> map);
	
	List<Map<String, Object>> selOpusByLike(Map<String, Object> map);
	
	
	
	
	void addStu(Map<String, Object> map);
	List<Map<String, Object>> selStuById(Map<String, Object> map);
	void updStu(Map<String, Object> map);

	
	List<Map<String, Object>> selAllOpus(Map<String, Object> map);
	Map<String, Object> selAllOpusCount(Map<String, Object> map);
	List<Map<String, Object>> updOpusStateTwo(Map<String, Object> map);
	List<Map<String, Object>> updOpusStateThree(Map<String, Object> map);
	
	
	void insertUse(Map<String, Object> map);
	List<Map<String, Object>> selectUserById(Map<String, Object> map);
	void updateUser(Map<String, Object> map);
	void delUser(Map<String, Object> map);
	List<Map<String, Object>> selAllUserByNameAndMob(Map<String, Object> map);
	
	
	Map<String, Object> selOpusByNewHotAgeCount(Map<String, Object> map);


	int upOpusHot(@Param("id") Integer id, @Param("count") Integer count);
}