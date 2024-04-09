package com.example.mapper;

import com.example.entity.Video;

import java.util.List;

public interface VideoMapper {

    /**
     * 上传视频
     * @param video
     * @return
     */
    void insert(Video video);

    /**
     * 更新视频
     * @param video
     * @return
     */
    void update(Video video);

    /**
     * 查询所有视频
     * @return
     */
    List<Video> select();

    void deleteById(String id);


    List<Video> selectByDes(String description);
}
