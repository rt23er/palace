package com.example.mapper;

import com.example.entity.Image3D;

import java.util.List;

public interface ImageMapper {




    void upodate(Image3D image3D);

    void insert(Image3D image3D);

    String select(String userId, String groupId);

    List<Image3D> getGroupImage(String userId);
}
