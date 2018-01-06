package com.craft.service;

import java.util.List;
import java.util.Map;

import com.craft.common.result.JsonResponse;
import com.craft.pojo.User;
import com.craft.pojo.UserCompetitionInfo;

public interface IUserService {

    JsonResponse<User> login(String username, String password);

    User getUserInfo(Integer userId);

    JsonResponse<UserCompetitionInfo> fillInfo(UserCompetitionInfo info);

    JsonResponse<UserCompetitionInfo> updateInfo(UserCompetitionInfo info);

    JsonResponse<String> register(User user, int type);

    JsonResponse<String> active(String email, String code);
    
    Map<String, Object> userLogin(Map<String, Object> map) throws Exception;
    
    List<Map<String, Object>> getUserAuthorityPC(Map<String, Object> map) throws Exception;

    List<User> selectAllUser();



}
