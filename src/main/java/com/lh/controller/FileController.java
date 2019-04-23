package com.lh.controller;


import com.alibaba.fastjson.JSON;
import com.lh.model.FileFloder;
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


        try {
            fileService.download(fileName,request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 跳转到文件夹管理页面
     * @return
     */
    @RequestMapping("file/fileFloderList")
    public String fileFloderList(){
        return "fileManager/fileFloderManager";
    }

    @ResponseBody
    @RequestMapping(value="file/getAllFileFloder",produces = "text/plain;charset=utf-8")
    public String getAllFileFloder(){
        return JSON.toJSONString(fileService.getAllFileFloder());
    }

    @RequestMapping("file/fileList")
    public String fileList(){
        return "fileManager/fileManager";
    }

    @ResponseBody
    @RequestMapping(value="file/getAllFile",produces = "text/plain;charset=utf-8")
    public String getAllFile(){
      return  JSON.toJSONString(fileService.getAllFile());
    }

    @ResponseBody
    @RequestMapping(value="file/addFileFloder",produces = "text/plain;charset=utf-8")
    public String addFileFloder(FileFloder fileFloder){
        return fileService.addFileFloder(fileFloder);
    }

    @ResponseBody
    @RequestMapping(value="file/queryAllFileFloder",produces = "text/plain;charset=utf-8")
    public String queryAllFileFloder(){
     return fileService.queryAllFileFloder();
    }

    /**
     * p2p文件传输
     * @param file
     * @param sendId
     * @param receviceId
     * @return
     */
    @ResponseBody
    @RequestMapping(value="file/p2pFile",produces = "text/plain;charset")
    public String p2pFile( MultipartFile file,@RequestParam("sendId") String sendId,
                           @RequestParam("receviceId") String receviceId){
        return fileService.p2pFile(file,sendId,receviceId);
    }
}
