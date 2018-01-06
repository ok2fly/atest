package com.craft.service.sendsms;

import com.craft.common.result.JsonResponse;
import com.craft.dao.BasPicMapper;
import com.craft.dao.JudgeMapper;
import com.craft.pojo.BasPic;
import com.craft.pojo.Judge;
import com.craft.pojo.Opus;
import com.craft.service.IJudgeService;
import com.craft.service.IOpusService;
import com.craft.util.PropertiesUtil;
import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Service
public class JudgeServiceImpl implements IJudgeService {

    @Autowired
    JudgeMapper judgeMapper;

    @Autowired
    IOpusService opusService;
    @Autowired
    private BasPicMapper basPicMapper;

    @Override
    public JsonResponse<Map<String, String>> insertSelective(Judge judge, MultipartFile file) {

        if (file != null && !file.isEmpty()) {

            JsonResponse<Map<String, String>> upload = opusService.upload(file);

            if (!upload.isSuccess()) {
                return upload;
            }
            Map<String, String> map = upload.getData();
            if (map != null) {
                String url = PropertiesUtil.getProperty("image.prefix") + map.get("newName");
                String thumurl = PropertiesUtil.getProperty("image.prefix") + map.get("thumName");

                BasPic img = new BasPic();
                img.setPicNam(map.get("oldName"));
                img.setPicUrl(url);
                img.setPicThum(thumurl);

                int count = basPicMapper.insertSelective(img);
                if (count > 0) {
                    Integer id = img.getId();
                    judge.setPicId(id);
                }
            }
        }

        int count = judgeMapper.insertSelective(judge);

        if (count > 0 ){
            JsonResponse.createBySuccess();
        }

        return JsonResponse.createByErrorMessage("修改失败");
    }

    @Override
    public JsonResponse updateSelective(Judge judge, MultipartFile file) {

        if (file != null && !file.isEmpty()) {

            JsonResponse<Map<String, String>> upload = opusService.upload(file);

            if (!upload.isSuccess()) {
                return upload;
            }
            Map<String, String> map = upload.getData();
            if (map != null) {
                String url = PropertiesUtil.getProperty("image.prefix") + map.get("newName");
                String thumurl = PropertiesUtil.getProperty("image.prefix") + map.get("thumName");

                BasPic img = new BasPic();
                img.setPicNam(map.get("oldName"));
                img.setPicUrl(url);
                img.setPicThum(thumurl);

                int count = basPicMapper.insertSelective(img);
                if (count > 0) {
                    Integer id = img.getId();
                    judge.setPicId(id);
                }
            }
        }

        int count = judgeMapper.updateByPrimaryKeySelective(judge);
        if (count > 0 ){
            JsonResponse.createBySuccess();
        }

        return JsonResponse.createByErrorMessage("修改失败");


    }

    @Override
    public int delete(String judgeId) {
        return judgeMapper.deleteByPrimaryKey(Integer.valueOf(judgeId));
    }
}
