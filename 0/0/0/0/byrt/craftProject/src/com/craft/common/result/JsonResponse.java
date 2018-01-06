package com.craft.common.result;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;

/**
 * Created by geely
 */
//保证序列化json的时候,如果是null的对象,key也会消失
//@JsonInclude(JsonInclude.Include.NON_NULL)
public class JsonResponse<T> implements Serializable {

    private int status;
    private String msg;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private T data;

    private JsonResponse(int status){
        this.status = status;
    }
    private JsonResponse(int status, T data){
        this.status = status;
        this.data = data;
    }

    private JsonResponse(int status, String msg, T data){
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    private JsonResponse(int status, String msg){
        this.status = status;
        this.msg = msg;
    }

    //使之不在json序列化结果当中
    @JsonIgnore
    public boolean isSuccess(){
        return this.status == ResponseCode.SUCCESS.getCode();
    }

    public int getStatus(){
        return status;
    }
    public T getData(){
        return data;
    }
    public String getMsg(){
        return msg;
    }


    public static <T> JsonResponse<T> createBySuccess(){
        return new JsonResponse<T>(ResponseCode.SUCCESS.getCode());
    }

    public static <T> JsonResponse<T> createBySuccessMessage(String msg){
        return new JsonResponse<T>(ResponseCode.SUCCESS.getCode(),msg);
    }

    public static <T> JsonResponse<T> createBySuccess(T data){
        return new JsonResponse<T>(ResponseCode.SUCCESS.getCode(),data);
    }

    public static <T> JsonResponse<T> createBySuccess(String msg, T data){
        return new JsonResponse<T>(ResponseCode.SUCCESS.getCode(),msg,data);
    }


    public static <T> JsonResponse<T> createByError(){
        return new JsonResponse<T>(ResponseCode.ERROR.getCode(),ResponseCode.ERROR.getDesc());
    }


    public static <T> JsonResponse<T> createByErrorMessage(String errorMessage){
        return new JsonResponse<T>(ResponseCode.ERROR.getCode(),errorMessage);
    }

    public static <T> JsonResponse<T> createByErrorCodeMessage(int errorCode, String errorMessage){
        return new JsonResponse<T>(errorCode,errorMessage);
    }








}
