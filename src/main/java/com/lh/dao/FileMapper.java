package com.lh.dao;

import com.lh.model.MyFile;
import com.lh.model.FileFloder;

import java.util.List;

public interface FileMapper {

    Integer addFileFloder(FileFloder fileFloder);

    Integer delFileFloder(String id);

    Integer updateFileFloder(FileFloder fileFloder);

    List<FileFloder> getAllFileFloder();

    Integer queryFileFloderCount();

    Integer addFile(MyFile myFile);

    Integer delFile(String id);

    Integer updateFile(MyFile myFile);

    List<MyFile> getAllFile();

    Integer queryFileCount();

    Integer queryFileByFlodId(String id);

    FileFloder queryFileFlodById(String id);

}
