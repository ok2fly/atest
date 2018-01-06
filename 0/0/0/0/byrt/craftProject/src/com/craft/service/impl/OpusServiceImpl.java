package com.craft.service.impl;

import com.craft.common.result.JsonResponse;
import com.craft.dao.*;
import com.craft.pojo.BasPic;
import com.craft.pojo.Opus;
import com.craft.service.IOpusService;
import com.craft.util.PropertiesUtil;
import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class OpusServiceImpl implements IOpusService {

    private Logger logger = LogManager.getLogger(OpusServiceImpl.class);
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

    @Autowired
    private OpusMapper opusMapper;

    @Autowired
    private BasPicMapper basPicMapper;


    @Value("${img.upload.path}")
    String imgPath;

    @Override
    public JsonResponse<Map<String, String>> uploadOpus(Opus opus, MultipartFile[] files) {


        BasPic img = null;
        List<Integer> imgIds = Lists.newArrayList();

        for (MultipartFile file : files) {

            if (file == null || file.isEmpty() ) {
                continue;
            }

            JsonResponse<Map<String, String>> upload = upload(file);

            if (!upload.isSuccess()) {
                return upload;
            }
            Map<String, String> map = upload.getData();
            if (map != null) {
                String url = PropertiesUtil.getProperty("image.prefix") + map.get("newName");
                String thumurl = PropertiesUtil.getProperty("image.prefix") + map.get("thumName");

                img = new BasPic();
                img.setPicNam(map.get("oldName"));
                img.setPicUrl(url);
                img.setPicThum(thumurl);

                int count = basPicMapper.insertSelective(img);
                if (count > 0) {
                    Integer id = img.getId();
                    imgIds.add(id);
                }
            }
        }

        opus.setImgIds(Joiner.on(",").skipNulls().join(imgIds));
        opusMapper.insertSelective(opus);

        return JsonResponse.createBySuccess();
    }


    @Override
    public JsonResponse<Map<String, String>> upload(MultipartFile file) {

        try {
            String fileName = file.getOriginalFilename();
            logger.debug("开始上传文件,上传文件的文件名:{},上传的路径:{}", fileName, imgPath);
//            BufferedImage image = ImageIO.read(file.getInputStream());
//            if (image == null) {
//                logger.error("上传的文件 {} 图片 ", image == null ? "不是" :"是");
//                return JsonResponse.createByErrorMessage("上传的文件" + fileName + ",不是图片类型");
//            }

            //abc.jpg
            String fileExtensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
            String uploadFileName = UUID.randomUUID().toString() + "." + fileExtensionName;

            File fileDir = new File(imgPath);
            if (!fileDir.exists()) {
                fileDir.setWritable(true);
                fileDir.mkdirs();
            }
            File targetFile = new File(imgPath, uploadFileName);
            file.transferTo(targetFile);

            //缩略图
            BufferedImage image = ImageIO.read(targetFile);
            String thumFileName = UUID.randomUUID().toString() + "." + fileExtensionName;
            File thumFile = new File(imgPath, thumFileName);
            if (thumFile != null) {
                thumFile.setWritable(true, false);
                Thumbnails.of(file.getInputStream()).size(image.getWidth() / 2, image.getHeight() / 2).toFile(thumFile);
            }

            logger.info("上传文件 {} 成功，路径为{}, 文件为 {}, 缩略图为 {}", fileName, imgPath, uploadFileName, thumFileName);

            Map<String, String> map = Maps.newHashMap();
            map.put("oldName", fileName);
            map.put("newName", uploadFileName);
            map.put("thumName", thumFileName);

            return JsonResponse.createBySuccess(map);

        } catch (IOException e) {
            logger.error("上传文件异常", e);
            return JsonResponse.createByErrorMessage("上传文件异常");
        }

    }

    //查询所有作品 根据组id
    @Override
    public JsonResponse<Map<String, Object>> selOpus(Map<String, Object> inpOpusMap) {


        Map<String, Object> map = new HashMap<String, Object>();

        //查询作品
        List<Map<String, Object>> opusLst = opusMapper.selOpusByNewHotAge(inpOpusMap);

        if (opusLst != null && !opusLst.isEmpty()) {

            for (Map<String, Object> opusMap : opusLst) {

                //获取作品id
                int opusId = Integer.parseInt(opusMap.get("id").toString());

                Map<String, Object> voteMap = new HashMap<String, Object>();

                voteMap.put("opusId", opusId);

                //投票数量
                List<Map<String, Object>> vote = opusMapper.selVoteByOpusId(voteMap);

                opusMap.put("vote", vote);

                //获取作品图片 id
                String[] ids = opusMap.get("img_ids").toString().split(",");

                List<BasPic> picLst = new ArrayList<BasPic>();

                for (int j = 0; j < ids.length; j++) {
                    //id查看图片信息
                    BasPic basPic = basPicMapper.selectByPrimaryKey(Integer.parseInt(ids[j]));

                    picLst.add(basPic);
                }

                opusMap.put("picLst", picLst);
            }
        }
        map.put("opus", opusLst);

        return JsonResponse.createBySuccess("成功", map);
    }


    //查询作品详情  根据作品id
    @Override
    public JsonResponse<Map<String, Object>> selOpusByOpusId(Map<String, Object> inpOpusMap) {


        Map<String, Object> map = new HashMap<String, Object>();

        List<Map<String, Object>> opusLst = opusMapper.selOpusByOpusId(inpOpusMap);

        if (opusLst != null && !opusLst.isEmpty()) {

            for (Map<String, Object> opusMap : opusLst) {

                //获取作品id
                int opusId = Integer.parseInt(opusMap.get("id").toString());

                Map<String, Object> voteMap = new HashMap<String, Object>();

                voteMap.put("opusId", opusId);

                //投票数量
                List<Map<String, Object>> vote = opusMapper.selVoteByOpusId(voteMap);

                opusMap.put("vote", vote);

                String[] ids = opusMap.get("img_ids").toString().split(",");

                List<BasPic> picLst = new ArrayList<BasPic>();

                for (int j = 0; j < ids.length; j++) {
                    //id查看图片的信息
                    BasPic basPic = basPicMapper.selectByPrimaryKey(Integer.parseInt(ids[j]));

                    picLst.add(basPic);
                }

                opusMap.put("picLst", picLst);
            }
        }
        map.put("opus", opusLst);

        return JsonResponse.createBySuccess("成功", map);
    }


    //查询所有省
    @Override
    public JsonResponse<Map<String, Object>> selBasReg() {


        Map<String, Object> map = new HashMap<String, Object>();

        List<Map<String, Object>> basRegLst = opusMapper.selBasReg();

        map.put("basRegLst", basRegLst);

        return JsonResponse.createBySuccess("成功", map);
    }


    //id查询所有市
    @Override
    public JsonResponse<Map<String, Object>> selBasRegCity(Map<String, Object> map) {


        Map<String, Object> mapCity = new HashMap<String, Object>();

        List<Map<String, Object>> basRegCity = opusMapper.selBasRegCity(map);

        mapCity.put("basRegCity", basRegCity);

        return JsonResponse.createBySuccess("成功", mapCity);
    }

    //id查询所有区
    @Override
    public JsonResponse<Map<String, Object>> selBasRegArea(Map<String, Object> map) {


        Map<String, Object> mapArea = new HashMap<String, Object>();

        List<Map<String, Object>> basRegArea = opusMapper.selBasRegArea(map);

        mapArea.put("basRegArea", basRegArea);

        return JsonResponse.createBySuccess("成功", mapArea);
    }


    // 省、市，查询年龄
    @Override
    public JsonResponse<Map<String, Object>> selAgeByCityArea(Map<String, Object> map) {


        Map<String, Object> mapAge = new HashMap<String, Object>();

        List<Map<String, Object>> basAge = opusMapper.selAgeByCityArea(map);

        mapAge.put("basAge", basAge);

        return JsonResponse.createBySuccess("成功", mapAge);
    }


    // 投票
    @Transactional
    @Override
    public JsonResponse<Map<String, Object>> vote(Map<String, Object> map) {

        //查询 用户是否已经投票
        List<Map<String, Object>> voteLst = opusMapper.selVoteByIpAndOpusId(map);

        if (voteLst == null || voteLst.isEmpty()) {

            // 添加 投票用户信息
            opusMapper.vote(map);

            return JsonResponse.createBySuccessMessage("投票成功");

        }

        return JsonResponse.createByErrorMessage("失败");
    }


    // 热度
    @SuppressWarnings("unused")
    @Transactional
    @Override
    public JsonResponse<Map<String, Object>> opusHot(Map<String, Object> map) {

        Map<String, Object> mapVote = new HashMap<String, Object>();

        mapVote.put("opusId", map.get("opusId").toString());

        if (map != null || !map.isEmpty()) {

            // 根据作品id 查看热度
            List<Map<String, Object>> hotLst = opusMapper.selOpusHotByOpusId(mapVote);

            if (hotLst.get(0).get("opus_hot").equals("0")) {

                int opusHot = 1;

                mapVote.put("opusHot", opusHot);

            } else {

                int opusHot = (Integer) hotLst.get(0).get("opus_hot") + 1;

                mapVote.put("opusHot", opusHot);
            }

            // 作品热度加1
            opusMapper.updOpusHot(mapVote);

            return JsonResponse.createBySuccessMessage("成功，热度+1");

        } else {

            return JsonResponse.createByErrorMessage("失败");
        }

    }


    // 用户id查询信息以及作品信息
    @Override
    public JsonResponse<Map<String, Object>> selOpusByUserId(Map<String, Object> map) {

        Map<String, Object> mapOpus = new HashMap<String, Object>();

        //查询用户详情
        List<Map<String, Object>> basUser = opusMapper.selUserByUserId(map);


        //查询作品详情
        List<Map<String, Object>> basOpus = opusMapper.selOpusByUserId(map);

        for (Map<String, Object> opus : basOpus) {

            Map<String, Object> vote = new HashMap<String, Object>();

            vote.put("opusId", opus.get("id"));

            //投票数量
            List<Map<String, Object>> voteCount = opusMapper.selVoteByOpusId(vote);
            opus.put("voteCount", voteCount);

            // 作品图片
            String[] ids = opus.get("img_ids").toString().split(",");
            List<BasPic> picLst = new ArrayList<BasPic>();
            for (int j = 0; j < ids.length; j++) {
                //id查看图片信息
                BasPic basPic = basPicMapper.selectByPrimaryKey(Integer.parseInt(ids[j]));

                picLst.add(basPic);
            }
            opus.put("picLst", picLst);
        }

        mapOpus.put("basOpus", basOpus);

        mapOpus.put("basUser", basUser);

        return JsonResponse.createBySuccess("成功", mapOpus);
    }


    // 注册
    @Override
    public JsonResponse<Object> addUser(Map<String, Object> map) {

        Map<String, Object> mobMap = new HashMap<String, Object>();

        // 判断mob是否已经注册
        mobMap.put("mob", map.get("mob"));

        List<Map<String, Object>> mobList = opusMapper.selUserByMob(mobMap);

        if (!mobList.isEmpty()) {

            return JsonResponse.createByErrorMessage("注册失败，该手机号已被成功注册。");

        } else {

            opusMapper.addUser(map);

            return JsonResponse.createBySuccessMessage("注册成功！");

        }


    }


    // 手机端 查看作品
    @Override
    public JsonResponse<Map<String, Object>> selOpusByLike(Map<String, Object> map) {

        Map<String, Object> opusMap = new HashMap<String, Object>();

        List<Map<String, Object>> opusList = opusMapper.selOpusByLike(map);

        Map<String, List<Object>> opus12Map = new HashMap<String, List<Object>>();

        Map<String, List<Object>> opus13Map = new HashMap<String, List<Object>>();

        for (int i = 0; i < opusList.size(); i++) {

            //查询投票数量
            Map<String, Object> item = opusList.get(i);
            int opusId = Integer.valueOf(item.get("id").toString());
            Map<String, Object> voteMap = new HashMap<String, Object>();
            voteMap.put("opusId", opusId);
            List<Map<String, Object>> vote = opusMapper.selVoteByOpusId(voteMap);
            item.put("vote_count", vote.get(0).get("vote"));

            //查询图片url
            String imgIds = item.get("img_ids").toString();
            List<BasPic> picLst = new ArrayList<BasPic>();
            if (imgIds.contains(",")) {
                String[] ids = imgIds.split(",");
                for (int j = 0; j < ids.length; j++) {
                    //id查看图片信息
                    BasPic basPic = basPicMapper.selectByPrimaryKey(Integer.parseInt(ids[j]));
                    picLst.add(basPic);
                }
            } else {
                BasPic basPic = basPicMapper.selectByPrimaryKey(Integer.parseInt(imgIds));
                picLst.add(basPic);
            }
            item.put("picLst", picLst);

            // 12 为传统工艺
            if ("12".equals(opusList.get(i).get("parent_id").toString())) {


                // containsKey 获取map指定的键名 判断是否有opusList键名
                if (opus12Map.containsKey("opusList")) {

                    ArrayList<Object> list = (ArrayList<Object>) opus12Map.get("opusList");

                    list.add(opusList.get(i));

                } else {

                    ArrayList<Object> list1 = new ArrayList<Object>();

                    list1.add(opusList.get(i));

                    opus12Map.put("opusList", list1);
                }

            }

            // 12 为创意设计
            if ("13".equals(opusList.get(i).get("parent_id").toString())) {

                if (opus13Map.containsKey("opusList")) {

                    ArrayList<Object> list = (ArrayList<Object>) opus13Map.get("opusList");

                    list.add(opusList.get(i));

                } else {

                    ArrayList<Object> list1 = new ArrayList<Object>();

                    list1.add(opusList.get(i));

                    opus13Map.put("opusList", list1);

                }
            }
        }

        opusMap.put("opus12Map", opus12Map);

        opusMap.put("opus13Map", opus13Map);

        return JsonResponse.createBySuccess("成功", opusMap);

    }

    
    
    //查看所有参赛作品信息
    @Override
    public JsonResponse<Map<String, Object>> selAllOpus(Map<String, Object> map) {
    	
    	 Map<String, Object> opusMapLst = new HashMap<String, Object>();
    	 
    	//获取所有作品信息
    	List<Map<String,Object>> opusLst = opusMapper.selAllOpus(map);
    	
    	 if (opusLst != null && !opusLst.isEmpty()) {

             for (Map<String, Object> opusMap : opusLst) {

                 //获取作品id
                 int opusId = Integer.parseInt(opusMap.get("id").toString());

                 Map<String, Object> voteMap = new HashMap<String, Object>();

                 voteMap.put("opusId", opusId);

                 //投票数量
                 List<Map<String, Object>> vote = opusMapper.selVoteByOpusId(voteMap);

                 opusMap.put("vote", vote);

                 //获取作品图片 id
                 String[] ids = opusMap.get("img_ids").toString().split(",");

                 List<BasPic> picLst = new ArrayList<BasPic>();

                 for (int j = 0; j < ids.length; j++) {
                     //id查看图片信息
                     BasPic basPic = basPicMapper.selectByPrimaryKey(Integer.parseInt(ids[j]));

                     picLst.add(basPic);
                 }

                 opusMap.put("picLst", picLst);
             }
         }
    	 opusMapLst.put("opus", opusLst);
         
    	 return JsonResponse.createBySuccess("成功", opusMapLst);

    }
    
    
    
	// 作品审核  state 2 审核通过  3 审核未通过
	@Override
	public JsonResponse<List<Map<String, Object>>> updOpusState(Map<String, Object> map) {
		
		if("2".equals(map.get("state"))){
			//审核通过
			List<Map<String, Object>> opusStateTwo = opusMapper.updOpusStateTwo(map);
			
			return JsonResponse.createBySuccess("成功", opusStateTwo);
			
		}else if ("3".equals(map.get("state"))){
			//审核未通过
			List<Map<String,Object>> opusStateThree = opusMapper.updOpusStateThree(map);
			
			return JsonResponse.createBySuccess("成功", opusStateThree);
		}
		
		return null;
	}
	
	
	
	// 添加
	@Override
	public JsonResponse<List<Map<String, Object>>> insertUse(Map<String, Object> map) {
		
			 opusMapper.insertUse(map);
			
			 return JsonResponse.createBySuccessMessage("成功！");
			
		
	}
	// 回显
	@Override
	public JsonResponse<List<Map<String, Object>>> selectUserById(Map<String, Object> map) {
		
		List<Map<String, Object>> userlstList = opusMapper.selectUserById(map);
		
		return JsonResponse.createBySuccess("成功", userlstList);
		
		
	}
	
	// 更新
	@Override
	public JsonResponse<List<Map<String, Object>>> updateUser(Map<String, Object> map) {
		
		opusMapper.updateUser(map);
		
		return JsonResponse.createBySuccessMessage("成功！");
		
		
	}
	
	// 删除
	@Override
	public JsonResponse<List<Map<String, Object>>> delUser(Map<String, Object> map) {
		
		opusMapper.delUser(map);
		
		return JsonResponse.createBySuccessMessage("成功！");
		
		
	}
	
	// 查询
	@Override
	public JsonResponse<List<Map<String, Object>>> selAllUserByNameAndMob(Map<String, Object> map) {
		
		List<Map<String, Object>> userlstList = opusMapper.selAllUserByNameAndMob(map);
		
		return JsonResponse.createBySuccess("成功", userlstList);
		
		
	}
	// 总数
	@Override
	public Map<String, Object> selAllOpusCount(Map<String, Object> map) {
		
		Map<String, Object> userlstList = opusMapper.selAllOpusCount(map);
		
		return userlstList;
		
		
	}
	// 
	@Override
	public Map<String, Object> selOpusByNewHotAgeCount(Map<String, Object> map) {
		
		Map<String, Object> userlstList = opusMapper.selOpusByNewHotAgeCount(map);
		
		return userlstList;
		
		
	}

    @Override
    public int upOpusHot(Integer opusId, Integer count) {
        return opusMapper.upOpusHot(opusId, count);
    }

    @Override
    public JsonResponse updateOpus(Opus opus, MultipartFile[] files) {
        BasPic img = null;

        if (files !=null && files.length>0){
            List<Integer> imgIds = Lists.newArrayList();
            for (MultipartFile file : files) {

                if (file == null || file.isEmpty() ) {
                    continue;
                }

                JsonResponse<Map<String, String>> upload = upload(file);

                if (!upload.isSuccess()) {
                    return upload;
                }
                Map<String, String> map = upload.getData();
                if (map != null) {
                    String url = PropertiesUtil.getProperty("image.prefix") + map.get("newName");
                    String thumurl = PropertiesUtil.getProperty("image.prefix") + map.get("thumName");

                    img = new BasPic();
                    img.setPicNam(map.get("oldName"));
                    img.setPicUrl(url);
                    img.setPicThum(thumurl);

                    int count = basPicMapper.insertSelective(img);
                    if (count > 0) {
                        Integer id = img.getId();
                        imgIds.add(id);
                    }
                }
            }
            opus.setImgIds(Joiner.on(",").skipNulls().join(imgIds));
        }


       int count  =  opusMapper.updateByPrimaryKeySelective(opus);
        if ( count > 0 ){

            return JsonResponse.createBySuccessMessage("修改成功");
        }
        return JsonResponse.createByErrorMessage("修改失败");
    }

}
