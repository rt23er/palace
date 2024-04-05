package com.example.service;

import com.example.entity.Video;
import com.example.mapper.VideoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
public class VideoServer {

    @Resource
    VideoMapper videoMapper;

    public void upload(Video video) {
        video.setId(String.valueOf(UUID.randomUUID()));
        videoMapper.insert(video);
    }

    public void update(Video video) {
        videoMapper.update(video);
    }

    public List<Video> select() {
        return videoMapper.select();
    }
}
