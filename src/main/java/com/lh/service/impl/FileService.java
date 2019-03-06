package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.service.IFileService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service("fileService")
public class FileService implements IFileService {

    @Value("#{configProperties['upload.path']}")
    private static String upload_Path;

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
}
