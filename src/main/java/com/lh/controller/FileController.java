package com.lh.controller;


import com.lh.service.IFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;


@Controller
public class FileController {

    @Value("#{configProperties['upload.path']}")
    private static String upload_Path;

    @Autowired
    private IFileService fileService;

    //跳转到私人空间
    @RequestMapping(value="/fileManager/personFile")
    public String personFile(){
        return "fileManager/personFile";
    }

    /*
    @Param file
    图片上传
     */
    @ResponseBody
    @RequestMapping(value="/file/uploadImg",produces = "text/plain;charset=utf-8")
    public String uploadImg( MultipartFile file, HttpServletRequest request){

        return fileService.uploadImg(file);
    }

    /*
    @Param path
    图片下载
     */
    @RequestMapping(value="/file/download")
    public void download(@RequestParam(value = "fileName",required = false)  String fileName, HttpServletResponse response) throws Exception {
        //String truePath=upload_Path+"/"+fileName;
        String truePath=upload_Path+"/Images/zhengshu1.JPG";
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
