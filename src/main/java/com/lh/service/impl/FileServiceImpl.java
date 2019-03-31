package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.dao.PersonMapper;
import com.lh.model.Person;
import com.lh.model.User;
import com.lh.service.IFileService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
public class FileServiceImpl implements IFileService {

    @Value("#{configProperties['upload.path']}")
    private String upload_Path;

    @Autowired
    private PersonMapper personMapper;

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
            SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");
            String date=sm.format(new Date());
            //String truefileName=upload_Path+"/Images/"+date+"_"+fileName;
            String truefileName="H:/ideaworkspace/Mytest/src/main/webapp/upload/images/"+date+"_"+fileName;
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

    @Override
    public String changeAvatar(MultipartFile file) {
        IFileService f=new FileServiceImpl();
        String result=f.uploadImg(file);
        JSONObject rs=new JSONObject();
        JSONObject jsonObject=JSONObject.parseObject(result);
        if(jsonObject.get("state").toString().equals("200")){
            String urlPath=jsonObject.get("message").toString();
            String filename=urlPath.substring(urlPath.lastIndexOf("/")+1);
            System.out.println(filename);
            User user=(User) SecurityUtils.getSubject().getPrincipal();
            Person person=new Person();
            person.setAccount(user.getAccount());
            person.setPhoto_url("upload/images/"+filename);
            if(personMapper.updatePerson(person)>0){
                rs.put("success",true);
                rs.put("msg","upload/images/"+filename);
            }else{
                rs.put("success",false);
                rs.put("msg","更新数据库失败！");
            }
        }else{
            rs.put("success",true);
            rs.put("msg","图片上传失败");
        }
        return JSON.toJSONString(rs);
    }
}
