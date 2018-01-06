package com.craft.service;

import com.craft.common.result.JsonResponse;
import com.craft.pojo.Judge;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface IJudgeService {

    JsonResponse<Map<String, String>> insertSelective(Judge judge, MultipartFile file);

    JsonResponse updateSelective(Judge judge, MultipartFile file);

    int delete(String judgeId);
}
