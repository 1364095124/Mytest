package com.lh.service;


import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IFileService {



    String uploadImg(MultipartFile file);

    void download(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
