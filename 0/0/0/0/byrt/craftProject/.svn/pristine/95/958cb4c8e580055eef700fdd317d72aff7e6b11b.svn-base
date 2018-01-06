package com.craft.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.craft.common.Const;
import com.craft.common.result.JsonResponse;
import com.craft.dao.UserCompetitionInfoMapper;
import com.craft.dao.UserMapper;
import com.craft.pojo.User;
import com.craft.pojo.UserCompetitionInfo;
import com.craft.service.IUserService;
import com.craft.util.MD5Util;
import com.craft.util.StringUtil;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserCompetitionInfoMapper userCompetitionInfoMapper;

    @Override
    public JsonResponse<User> login(String username, String password) {
        int resultCount = userMapper.checkUserExist(username);
        if (resultCount == 0) {
            return JsonResponse.createByErrorMessage("用户不存在");
        }

        String md5Password = MD5Util.MD5EncodeUtf8(password);
        User user = userMapper.selectLogin(username, md5Password);
        if (user == null) {
            return JsonResponse.createByErrorMessage("密码错误");
        }

        return JsonResponse.createBySuccess("登录成功", user);
    }

    @Override
    public User getUserInfo(Integer id) {
        return userMapper.selectByPrimaryKey(id);

    }

    @Override
    public JsonResponse<UserCompetitionInfo> fillInfo(UserCompetitionInfo info) {

        int updateCount = userCompetitionInfoMapper.insertSelective(info);
        if (updateCount > 0) {
            return JsonResponse.createBySuccess("提交个人参数信息成功", info);
        }
        return JsonResponse.createByErrorMessage("提交个人参数信息失败");
    }

    @Override
    public JsonResponse<UserCompetitionInfo> updateInfo(UserCompetitionInfo info) {
        int updateCount = userCompetitionInfoMapper.updateByPrimaryKeySelective(info);
        if (updateCount > 0) {
            return JsonResponse.createBySuccess("修改信息成功", info);
        }
        return JsonResponse.createByErrorMessage("修改信息失败");
    }

    @Override
    public JsonResponse<String> register(User user, int type) {


        JsonResponse validResponse = this.checkValid(user, type);
        if (!validResponse.isSuccess()) {
            return validResponse;
        }

        //MD5加密
        user.setUsePas(MD5Util.MD5EncodeUtf8(user.getUsePas()));
        user.setUseNam(user.getUseMal());
        user.setUseSta(0);
        user.setUseTyp(2);
        int resultCount = userMapper.insertSelective(user);
        if (resultCount == 0) {
            return JsonResponse.createByErrorMessage("注册失败");
        }
        return JsonResponse.createBySuccessMessage("注册成功, 请查收邮件激活账户");
    }

    @Override
    public JsonResponse<String> active(String email, String code) {
        int resultCount = userMapper.checkEmail(email);
        if (resultCount == 0) {
            return JsonResponse.createByErrorMessage("用户不存在");
        }

        resultCount = userMapper.updateStateByEmail(email, "1");
        if (resultCount == 0) {
            return JsonResponse.createByErrorMessage("用户激活失败");
        }
        return JsonResponse.createBySuccessMessage("用户激活成功");

    }

    public JsonResponse<String> checkValid(User user, int type) {

        if (Const.Register.email == type) {
            //开始校验
            if (StringUtil.isBlank(user.getUseMal())) {
                return JsonResponse.createByErrorMessage("参数错误");
            }
            int resultCount = userMapper.checkEmail(user.getUseMal());
            if (resultCount > 0) {
                return JsonResponse.createByErrorMessage("邮箱已存在");
            }
        }
        if (Const.Register.phone == type) {
            //开始校验
            if (StringUtil.isBlank(user.getUseMob())) {
                return JsonResponse.createByErrorMessage("参数错误");
            }
            int resultCount = userMapper.checkPhone(user.getUseMob());
            if (resultCount > 0) {
                return JsonResponse.createByErrorMessage("手机号已存在");
            }
        }

        return JsonResponse.createBySuccessMessage("校验成功");
    }
    
    
    
    
    
    
    /**
	 * 用户登陆
	 * 
	 * <p>
	 * <b>Release Notes:</b> <br/>
	 * <table border="1" cellspacing="0" cellpadding="5" width="80%">
	 * <tr>
	 * <th align="left">Release</th>
	 * <th align="left">Notes</th>
	 * </tr>
	 * <tr>
	 * <td>@since 1.0</td>
	 * <td>&nbsp;</td>
	 * </tr>
	 * </table>
	 * <p>
	 * 
	 * @return <code>int</code> 成功或失败
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> userLogin(Map<String, Object> map) throws Exception {
		
		map.put("reason", "success");
		String name = map.get("loginName").toString().trim();

		if (StringUtils.isNotBlank(map.get("loginName").toString())) {
			
			
			map.put("login_name", name);
			
		} else {
			// 参数异常

			map.put("reason","paramError");
			
			return map;
		}
		
		
		int count = userMapper.checkUserExist(name);
		if(count <= 0 ){
			map.put("reason", "用户名不存在");
			return map;
		}
		

		List<Map<String, Object>> userList = userMapper.getUserByLoginNamePC(map);


		if (userList != null) {

			if (!map.get("md5NewPasswd").toString().equals(userList.get(0).get("use_pas").toString())) {
				// 密码不正确

				map.put("reason", "passwordInvalid");

				return map;

			}

			map.put("reason", "success");
		}else{
			map.put("reason", "useNotExist");
		}
		
		map.put("userMap", userList.get(0));
		
		return map;
	}
	
	
	/**
	 * 用户角色权限PC
	 * 
	 * <p>
	 * <b>Release Notes:</b> <br/>
	 * <table border="1" cellspacing="0" cellpadding="5" width="80%">
	 * <tr>
	 * <th align="left">Release</th>
	 * <th align="left">Notes</th>
	 * </tr>
	 * <tr>
	 * <td>@since 1.0</td>
	 * <td>&nbsp;</td>
	 * </tr>
	 * </table>
	 * <p>
	 * 
	 * @param userDto
	 *            <code>UserDto</code> 用户信息
	 * @return <code>int</code> 成功或失败
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> getUserAuthorityPC(Map<String, Object> map) throws Exception {
		
		
		List<Map<String, Object>> auth1Levllst = userMapper.getUserRoleByModule1Levl(map);
		
		if(auth1Levllst != null && auth1Levllst.size() > 0){
			
			for(Map<String, Object> auth1LevlMap : auth1Levllst){
				
				if(auth1LevlMap != null){
					
					map.put("pos_id", auth1LevlMap.get("id").toString());
					
					List<Map<String, Object>> auth2Levllst = userMapper.getUserRoleByModule2Levl(map);
					
					if(auth2Levllst != null && auth2Levllst.size() > 0){
						
						for(Map<String, Object> auth2LevlMap : auth2Levllst){
							
							if(auth2LevlMap != null){
								
								map.put("pos_id", auth2LevlMap.get("id").toString());
								
								List<Map<String, Object>> auth3Levllst = userMapper.getUserRoleByModule2Levl(map);
								
								auth2LevlMap.put("menu", auth3Levllst);
							}
						}
					}
					
					auth1LevlMap.put("menu", auth2Levllst);
				}
			}
		}
		
		return auth1Levllst;
	}

    @Override
    public List<User> selectAllUser() {
        return userMapper.selectAllUser();
    }
}
