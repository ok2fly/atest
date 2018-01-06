package com.craft.dao;

import com.craft.pojo.BasPic;

public interface BasPicMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BasPic record);

    int insertSelective(BasPic record);

    BasPic selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BasPic record);

    int updateByPrimaryKey(BasPic record);


}