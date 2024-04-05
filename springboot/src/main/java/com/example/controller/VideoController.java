package com.example.controller;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.StrUtil;
import com.example.common.Result;
import com.example.entity.Image3D;
import com.example.entity.Video;
import com.example.service.ImageServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

/**
 * 视频接口
 */
@RestController
@RequestMapping("/Video")
public class VideoController {


    /**
     * 上传视频数据
     */
    @PostMapping( "/upload")
    public Result upload(Video video) {
        return null;
    }

    /**
     * 查询所有视频
     */
    @GetMapping("/getGroupImage")
    public Result select() {
        return null;
    }

    /**
     * 更新视频数据
     * @return
     */
    @GetMapping("/getGroupImage1")
    public Result update(Video video) {
        return null;
    }

}
