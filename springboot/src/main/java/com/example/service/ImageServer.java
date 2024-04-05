package com.example.service;

import com.example.entity.Image3D;
import com.example.mapper.ImageMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ImageServer {

    @Resource
    ImageMapper imageMapper;

    public String select(String userId, String groupId) {
        return  imageMapper.select(userId,groupId);
    }

    public void update(Image3D image3D) {
        imageMapper.upodate(image3D);
    }

    public void insert(Image3D image3D) {
        imageMapper.insert(image3D);
    }

    public List<Image3D> getGroupImage(String userId) {
         return imageMapper.getGroupImage(userId);
    }
}
