package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.dao.FileMapper;
import com.lh.dao.PersonMapper;
import com.lh.model.*;
import com.lh.service.IFileService;
import com.lh.service.IMsgService;
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
import java.util.List;

@Service("fileService")
public class FileServiceImpl implements IFileService {

    @Value("#{configProperties['upload.path']}")
    private String upload_Path;

    @Autowired
    private PersonMapper personMapper;

    @Autowired
    private FileMapper fileMapper;

    @Autowired
    private IMsgService msgService;

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
            String truefileName="H:/upload/images/"+date+"_"+fileName;
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
        File file=new File(fileName);
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

    /**
     * 新增文件夹
     * @param fileFloder
     * @return
     */
    @Override
    public String addFileFloder(FileFloder fileFloder) {
        JSONObject rs=new JSONObject();
        String filename="";
        if(null==fileFloder.getPid()&&("").equals(fileFloder.getPid())){
               filename="H:/upload/fileSpace/"+fileFloder.getName();
        }else{
            FileFloder fileFloder1=fileMapper.queryFileFlodById(fileFloder.getPid());
            filename=fileFloder1.getUrl()+"/"+fileFloder.getName();
        }
        File file=new File(filename);
        if(file.exists()){
            rs.put("success",false);
            rs.put("msg","文件夹已存在");
        }else{
            if (file.mkdir()){
                fileFloder.setUrl(filename);
                if(fileMapper.addFileFloder(fileFloder)>0){
                    rs.put("success",true);
                    rs.put("msg",filename);
                }else{
                    rs.put("success",false);
                    rs.put("msg","新增失败！");
                }
            }
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 更新文件夹
     * @param fileFloder
     * @return
     */
    @Override
    public String updateFileFloder(FileFloder fileFloder) {
        JSONObject rs=new JSONObject();
        if(fileMapper.updateFileFloder(fileFloder)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","更新失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 删除文件夹
     * @param id
     * @return
     */
    @Override
    public String delFileFloder(String id,String url) {
        JSONObject rs=new JSONObject();
        if(fileMapper.queryFileByFlodId(id)!=null){
            File file=new File(url);
            if(!file.exists()){
                fileMapper.delFileFloder(id);
                rs.put("success",true);
                rs.put("msg","");
            }else{
                if (file.isDirectory()) {
                    if(file.delete()){
                        if(fileMapper.delFileFloder(id)>0){
                            rs.put("success",true);
                            rs.put("msg","");
                        }else{
                            rs.put("success",false);
                            rs.put("msg","新增失败！");
                        }
                    }else{
                        rs.put("success",true);
                        rs.put("msg","删除真实文件啊出错！");
                    }
                }
            }
        }else{
            rs.put("success",false);
            rs.put("msg","删除失败，请先删除文件夹里面");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 查询所有文件夹
     * @return
     */
    @Override
    public ResultMap<List<FileFloder>> getAllFileFloder() {
        List<FileFloder> list=fileMapper.getAllFileFloder();
        Integer count=fileMapper.queryFileFloderCount();
        return new ResultMap<List<FileFloder>>("",list,0,count);
    }

    /**
     * 新增文件
     * @param file
     * @param myFile
     * @return
     */
    @Override
    public String addFile(MultipartFile file,MyFile myFile) {
        JSONObject rs=new JSONObject();
        FileFloder fileFloder=fileMapper.queryFileFlodById(myFile.getPid());
        File file1=new File(myFile.getUrl());
        if(file1.exists()){
            rs.put("success",false);
            rs.put("msg","文件名重复");
        }else{
            if(file==null||file.isEmpty()){
                rs.put("success",false);
                rs.put("msg","上传失败，上传的图片文件不能为空！");
            }else{
                String fileName=file.getOriginalFilename();
                String truefileName=fileFloder.getUrl()+"/"+fileName;
                try {
                    InputStream inputStream=file.getInputStream();
                    OutputStream outputStream=new FileOutputStream(truefileName);
                    byte[] buffer=new byte[1024];
                    while(inputStream.read(buffer)>0){
                        outputStream.write(buffer);
                    }
                    outputStream.close();
                    myFile.setUrl(truefileName);
                    if(fileMapper.addFile(myFile)>0){
                        rs.put("success",true);
                        rs.put("msg","");
                    }else{
                        rs.put("success",false);
                        rs.put("msg","更新失败！");
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                    rs.put("success",false);
                    rs.put("msg","异常！上传失败请重试！");
                }
            }
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 更新文件信息
     * @param myFile
     * @return
     */
    @Override
    public String updateFile(MyFile myFile) {
        JSONObject rs=new JSONObject();
        if(fileMapper.updateFile(myFile)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","更新失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 删除文件信息
     * @param id
     * @return
     */
    @Override
    public String delFile(String id,String url) {
        JSONObject rs=new JSONObject();
        File file = new File(url);
        if (!file.exists()) {
            System.out.println("删除文件失败:" + url + "不存在！");
            fileMapper.delFile(id);
            rs.put("success", true);
            rs.put("msg", "");

        } else {
            if (file.isFile()) {
                if (file.delete()) {
                    if (fileMapper.delFile(id) > 0) {

                        rs.put("success", true);
                        rs.put("msg", "");
                    } else {
                        rs.put("success", false);
                        rs.put("msg", "删除失败！");
                    }
                }
            }else{
                rs.put("success",false);
                rs.put("msg","删除失败！对应路径是文件夹");
            }
        }

        return JSON.toJSONString(rs);
    }

    /**
     * 查找文件
     * @return
     */
    @Override
    public ResultMap<List<MyFile>> getAllFile() {
        List<MyFile> list=fileMapper.getAllFile();
        Integer count=fileMapper.queryFileCount();
        return new ResultMap<List<MyFile>>("",list,0,count);
    }

    @Override
    public String queryAllFileFloder() {
        return JSON.toJSONString(fileMapper.getAllFileFloder());
    }

    /**
     * 个人到个人的文件传输
     * @param file 文件
     * @param sendId 发送者
     * @param receviceId 接收者
     * @return
     */
    @Override
    public String p2pFile(MultipartFile file, String sendId, String receviceId) {
        JSONObject result=new JSONObject();
        if(file==null||file.isEmpty()){
            result.put("success",false);
            result.put("msg","传输失败，传输的文件不能为空！");
        }else{
            //如果目录不存在则创建目录
            File uploadFile=new File("H:/upload/p2p");
            if(!uploadFile.exists()){
                uploadFile.mkdirs();
            }
            String fileName=file.getOriginalFilename();
            SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");
            String date=sm.format(new Date());
            //String truefileName=upload_Path+"/Images/"+date+"_"+fileName;
            String truefileName="H:/upload/p2p/"+date+"_"+fileName;
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
                Message message=new Message();
                message.setSend_id(sendId);
                message.setReceive_id(receviceId);
                message.setContent(fileName);
                message.setUrl("file/download?fileName="+truefileName);
                message.setType("文件");
                String rs=msgService.sendMsg(message);
                JSONObject data=JSON.parseObject(rs);
                if((Boolean)data.get("success")){
                    result.put("success",true);
                    result.put("msg",truefileName);
                }else{
                    result.put("success",false);
                    result.put("msg","上传成功，但传输时失败！");
                }

            } catch (IOException e) {
                e.printStackTrace();
                result.put("success",false);
                result.put("msg","异常！上传失败请重试！");
            }
        }
        return JSON.toJSONString(result);
    }

}
