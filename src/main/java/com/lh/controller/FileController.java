package com.lh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileController {

    //跳转到私人空间
    @RequestMapping(value="/fileManager/personFile")
    public String personFile(){
        return "fileManager/personFile";
    }
}
