package com.craft.dao;

import java.util.List;
import java.util.Map;

import com.craft.pojo.User;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int checkUserExist(String username);

    User selectLogin(@Param("username") String username, @Param("password") String password);

    int checkPhoneByUserId(String useMob, Integer id);

    int checkPhone(String useMob);

    int checkEmail(String email);

    int updateStateByEmail(@Param("email")String email, @Param("state") String state);
    
    /**
     * 用户信息查询，以登录名为条件(PC)
     * @param map
     * @return
     */
    List<Map<String, Object>> getUserByLoginNamePC(Map<String, Object> map);
    
    /**
     * 用户信息查询，展示1级菜单
     * @param map
     * @return
     */
    List<Map<String, Object>> getUserRoleByModule1Levl(Map<String, Object> map);
    
    /**
     * 用户信息查询，展示二级或三级菜单
     * @param map
     * @return
     */
    List<Map<String, Object>> getUserRoleByModule2Levl(Map<String, Object> map);

    List<User> selectAllUser();
}