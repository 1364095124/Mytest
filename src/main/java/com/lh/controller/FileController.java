package com.lh.controller;


import com.lh.service.IFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@Controller
public class FileController {



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

    @ResponseBody
    @RequestMapping(value="/file/changeAvatar")
    public String changeAvatar(MultipartFile file){
        return fileService.changeAvatar(file);
    }


    /*
    @Param path
    图片下载
     */
    @RequestMapping(value="/file/download")
    public void download(@RequestParam(value = "fileName",required = false)  String fileName,
                         HttpServletRequest request,HttpServletResponse response) {
        //String truePath=upload_Path+"/"+fileName;

        try {
            fileService.download(fileName,request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
