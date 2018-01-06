package com.craft.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.craft.common.result.JsonResponse;
import com.craft.dao.AwardMapper;
import com.craft.dao.CollectionTimeMapper;
import com.craft.dao.JudgeMapper;
import com.craft.dao.MatchMapper;
import com.craft.dao.MatchOrgMapper;
import com.craft.dao.UserMapper;
import com.craft.pojo.Award;
import com.craft.pojo.CollectionTime;
import com.craft.pojo.Judge;
import com.craft.pojo.Match;
import com.craft.pojo.MatchOrg;
import com.craft.pojo.User;
import com.craft.service.IMatchOrgService;
import com.craft.service.IUserService;
import com.craft.util.MD5Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchOrgServiceImpl implements IMatchOrgService{

    private static final List<MatchOrg> mapAward = null;

	@Autowired
    private MatchOrgMapper matchOrgMapper;
    
    @Autowired
    private MatchMapper matchMapper;

    @Autowired
    private CollectionTimeMapper collectionTimeMapper;
    
    @Autowired
    private AwardMapper awardMapper;
    
    @Autowired
    private JudgeMapper judgeMapper;
    
    
    
    @Override
   public JsonResponse<List<MatchOrg>> selectMatchOrg(){
        List<MatchOrg> listMatchOrgs  = matchOrgMapper.selectMatchOrg();
         if(listMatchOrgs == null){
             return JsonResponse.createByErrorMessage("数据为空");
         }
         return JsonResponse.createBySuccess("成功",listMatchOrgs);
    	
    }
    
    
    
    //首页
    @Override
    public JsonResponse<Map<String, Object>> selectMatchNew(){
    	
    	
    	//查询最新记录的 比赛信息
    	Match match = matchMapper.selectMatchNew();
    	
    	int match_id = match.getId();
    	
    
    	//根据比赛id 查询最新征集时间
    	List<CollectionTime> collectionTime = collectionTimeMapper.selCollectionTimeByMatchId(match_id);
    	
    	//查询组织机构
    	MatchOrg matchOrg = matchOrgMapper.selMatchOrgByMatchId(match_id);
    	
    	//查询奖项设置 
    	List<Award> awardList = awardMapper.selAwardByMatchId(match_id);
    	
    	//判断 type 1-专题赛，2-单项赛，3-优秀奖，4-参与奖
    	Map<String, Object> mapAward = new HashMap<String, Object>();
    	for(int i = 0;i<awardList.size(); i++){
    		
	    	if( 1 == (awardList.get(i).getType())){
	    		
	    		mapAward.put("OneType",awardList.get(i));
	    	}
	    	
	    	if( 2 == (awardList.get(i).getType())){
	    		mapAward.put("TwoType",awardList.get(i));
	    	}
	    	
	    	if( 3 == (awardList.get(i).getType())){
	    		mapAward.put("ThreeType",awardList.get(i));
	    	}
	    	
	    	if( 4 == (awardList.get(i).getType())){
	    		mapAward.put("FourType",awardList.get(i));
	    	}
    	}

    	// 查询评委
    	List<Judge> judge = judgeMapper.selJudgeByMatchId(match_id);
        
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("match", match);
    	map.put("collectionTime", collectionTime);
    	map.put("matchOrg", matchOrg);
    	map.put("mapAward", mapAward);
    	map.put("judge", judge);
    	
    	
    	return JsonResponse.createBySuccess("成功",map);
     	
     }
    
    
    
}
