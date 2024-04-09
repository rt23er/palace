package com.example.controller;


import com.example.common.Result;
import com.example.entity.Video;
import com.example.service.VideoServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 视频接口
 */
@RestController
@RequestMapping("/Video")
public class VideoController {
    @Autowired
    VideoServer videoServer;

    /**
     * 上传视频数据
     */
    @PostMapping( "/upload")
    public void upload(@RequestBody Video video) {
        videoServer.upload(video);
    }

    /**
     * 查询所有视频
     */
    @GetMapping("/getAllVideo")
    public Result select() {
        List<Video> list = videoServer.select();
        return Result.success(list);
    }

    /**
     * 更新视频数据
     *
     * @return
     */
    @PostMapping("/updateVideo")
    public Result update(@RequestBody Video video) {
        videoServer.update(video);
        return Result.success() ;
    }

    /**
     * 按照id删除照片
     * @param id
     */
    @DeleteMapping("/deleteById")
    public void delete(String id){
        videoServer.deleteById(id);
    }

    /**
     * 按照id列表批量删除照片
     * @param id
     */
    @DeleteMapping("/deleteByIdList")
    public void delete(List<String> id){
        videoServer.deleteByIdList(id);
    }

    /**
     * 按照描述模糊搜索
     * @param description
     * @return
     */
    @GetMapping("selectByDes")
    public Result selectByDes(String description){
        return Result.success(videoServer.selectByDes(description));
    }

}
