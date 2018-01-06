package com.craft.dao;

import java.util.List;

import com.craft.pojo.Award;

public interface AwardMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Award record);

    int insertSelective(Award record);

    Award selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Award record);

    int updateByPrimaryKey(Award record);
    
    
    List<Award> selAwardByMatchId(Integer match_id);
}