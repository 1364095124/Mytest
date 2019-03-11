package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.service.IFileService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service("fileService")
public class FileService implements IFileService {

    @Value("#{configProperties['upload.path']}")
    private String upload_Path;

    @Override
    public String uploadImg(MultipartFile file) {
        JSONObject result=new JSONObject();
        if(file==null||file.isEmpty()){
            result.put("state","500");
            result.put("message","上传失败，上传的图片文件不能为空！");
        }else{
            //如果目录不存在则创建目录
            File uploadFile=new File(upload_Path+"/Images");
            if(!uploadFile.exists()){
                uploadFile.mkdirs();
            }
            String fileName=file.getOriginalFilename();
            SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
            String date=sm.format(new Date());
            String truefileName=upload_Path+"/Images/"+date+"_"+fileName;
            try {
                //创建输入流
                InputStream inputStream=file.getInputStream();
                //创建文件的输出流
                OutputStream outputStream=new FileOutputStream(truefileName);
                byte[] buffer=new byte[1024];
                while(inputStream.read(buffer)>0){
                    outputStream.write(buffer);
                }
                outputStream.close();
                result.put("state","200");
                result.put("message",truefileName);
            } catch (IOException e) {
                e.printStackTrace();
                result.put("state","500");
                result.put("message","异常！上传失败请重试！");
            }


        }
        return JSON.toJSONString(result);
    }

    @Override
    public void download(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
        fileName="Images/zhengshu1.JPG";
        String truePath=upload_Path+"/"+fileName;
        System.out.println("---true"+truePath);
        File file=new File(truePath);
        if(file.exists()){
            response.setContentType("application/x-msdownload;");
            response.setContentType("text/html;charset=utf-8");

            response.setHeader("Content-Length", String.valueOf(file.length()));
            //设置头信息,设置文件下载时的默认文件名，同时解决中文名乱码问题
            response.addHeader("Content-disposition", "attachment;filename="+
                    new String(fileName.getBytes(), "ISO-8859-1"));
            InputStream inputStream=new FileInputStream(file);
            ServletOutputStream outputStream=response.getOutputStream();
            byte[] buffer=new byte[1024];
            while(inputStream.read(buffer)>0){
                outputStream.write(buffer);
            }
            outputStream.close();
            inputStream.close();

        }
    }
}
