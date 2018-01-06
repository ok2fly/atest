package com.craft.dao;

import java.util.List;

import com.craft.pojo.Judge;

public interface JudgeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Judge record);

    int insertSelective(Judge record);

    Judge selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Judge record);

    int updateByPrimaryKey(Judge record);
    
    List<Judge> selJudgeByMatchId(Integer match_id);
}