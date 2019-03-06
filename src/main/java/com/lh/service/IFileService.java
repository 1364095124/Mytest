package com.lh.service;


import org.springframework.web.multipart.MultipartFile;

public interface IFileService {



    String uploadImg(MultipartFile file);
}
