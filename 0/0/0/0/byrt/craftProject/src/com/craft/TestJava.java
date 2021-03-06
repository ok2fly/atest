package com.craft;


import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.alibaba.fastjson.JSON;
import com.craft.common.result.JsonResponse;
import com.craft.pojo.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.usermodel.Workbook;
import org.junit.Test;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

public class TestJava {


    private static Logger logger = LogManager.getLogger(TestJava.class);

    public static void main(String[] args) throws Exception {
//        File file = new File("C:\\Users\\cj\\Desktop\\门锁\\Lock.sql");
//        File file = new File("C:\\Users\\cj\\Desktop\\门锁\\mensuo.png");
//        ImageInputStream image = ImageIO.createImageInputStream(new FileInputStream(file));
//        BufferedImage image = ImageIO.read(file);
//        logger.error("上传的文件 {} 图片 ", image == null ? "不是" :"是");


        JsonResponse<Object> result = JsonResponse.createByErrorMessage("您没有权限");

        logger.debug("ids = {}", JSON.toJSONString(result));
    }


    @Test
    public  void exportExcel() {


//        List<Student> list = new ArrayList<>();
//
//        for (int i = 0; i < 2; i++) {
//
//            Student student = new Student();
//            student.setId(2 + "");
//            student.setName(" xuesheng " + 1);
//            student.setSex(i % 2);
//
//            student.setBirthday(new Date());
//            student.setRegistrationDate(new Date());
//
//            list.add(student);
//
//        }
//        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("计算机一班学生", "学生"),
//                Student.class, list);

        List<User> list = new ArrayList<User>();

        for (int i = 0; i < 2; i++) {

            User student = new User();
            student.setUseSex( i );
            student.setUseNam( i + " safas" );


            list.add(student);

        }

        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("计算机一班学生", "学生"),
                User.class, list);


        logger.info(" wor == null is  {}" , workbook==null );


        try {
            FileOutputStream fileOutputStream = new FileOutputStream(new File("E:/logs/test.xls"));

            workbook.write(fileOutputStream);

        } catch (Exception e) {
            e.printStackTrace();
        }

        logger.info(" good !"  );

    }


}
