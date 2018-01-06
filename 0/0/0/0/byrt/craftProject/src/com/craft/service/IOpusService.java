package com.craft.service;

import com.craft.common.result.JsonResponse;
import com.craft.pojo.Opus;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface IOpusService {

    JsonResponse<Map<String, String>> uploadOpus(Opus opus, MultipartFile[] file);

    JsonResponse<Map<String, String>> upload(MultipartFile file);
    
    JsonResponse<Map<String, Object>> selOpus(Map<String, Object> inpOpusMap);

	JsonResponse<Map<String, Object>> selOpusByOpusId(Map<String, Object> inpOpusMap);

	JsonResponse<Map<String, Object>> selBasReg();

	JsonResponse<Map<String, Object>> selBasRegCity(Map<String, Object> map);

	JsonResponse<Map<String, Object>> selBasRegArea(Map<String, Object> map);

	JsonResponse<Map<String, Object>> selAgeByCityArea(Map<String, Object> map);

	JsonResponse<Map<String, Object>> vote(Map<String, Object> map);

	JsonResponse<Map<String, Object>> opusHot(Map<String, Object> map);

	JsonResponse<Map<String, Object>> selOpusByUserId(Map<String, Object> map);


	JsonResponse<Object> addUser(Map<String, Object> map);

	JsonResponse<Map<String, Object>> selOpusByLike(Map<String, Object> map);

	JsonResponse<Map<String, Object>> selAllOpus(Map<String, Object> map);

	JsonResponse<List<Map<String, Object>>> updOpusState(
			Map<String, Object> map);

	JsonResponse<List<Map<String, Object>>> insertUse(Map<String, Object> map);

	JsonResponse<List<Map<String, Object>>> selectUserById(
			Map<String, Object> map);

	JsonResponse<List<Map<String, Object>>> updateUser(Map<String, Object> map);

	JsonResponse<List<Map<String, Object>>> delUser(Map<String, Object> map);

	JsonResponse<List<Map<String, Object>>> selAllUserByNameAndMob(
			Map<String, Object> map);

	Map<String, Object> selAllOpusCount(Map<String, Object> map);

	Map<String, Object> selOpusByNewHotAgeCount(Map<String, Object> map);


    int upOpusHot(Integer opusId, Integer count);

    JsonResponse updateOpus(Opus opus, MultipartFile[] files);
}
