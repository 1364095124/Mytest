package com.lh.service;


import com.lh.model.FileFloder;
import com.lh.model.MyFile;
import com.lh.model.ResultMap;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface IFileService {



    String uploadImg(MultipartFile file);

    void download(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception;

    String changeAvatar(MultipartFile file);

    String addFileFloder(FileFloder fileFloder);

    String updateFileFloder(FileFloder fileFloder);

    String delFileFloder(String id,String url);

    ResultMap<List<FileFloder>> getAllFileFloder();

    String addFile(MultipartFile file,MyFile myFile);

    String updateFile(MyFile myFile);

    String delFile(String id,String url);

    ResultMap<List<MyFile>> getAllFile();

    String queryAllFileFloder();
}
