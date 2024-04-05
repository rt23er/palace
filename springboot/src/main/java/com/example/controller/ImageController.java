package com.example.controller;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.StrUtil;
import com.example.common.Result;
import com.example.entity.Image3D;
import com.example.service.ImageServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

/**
 * 3d图片接口
 */
@RestController
@RequestMapping("/images")
public class ImageController {

    // 文件上传存储路径
    private static final String filePath = System.getProperty("user.dir") + "/files/";

    @Value("${server.port:9090}")
    private String port;

    @Value("${ip:localhost}")
    private String ip;

    @Autowired
    ImageServer imageServer;

    /**
     * 图片上传
     */
    @PostMapping(value = "/upload",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public Result upload(@RequestPart("file") MultipartFile file,String UserId,String GroupId,String Description) {
        String flag;
        synchronized (ImageController.class) {
            flag = System.currentTimeMillis() + "";
            ThreadUtil.sleep(1L);
        }
        String fileName = file.getOriginalFilename();
        try {
            if (!FileUtil.isDirectory(filePath)) {
                FileUtil.mkdir(filePath);
            }
            // 文件存储形式：时间戳-文件名
            FileUtil.writeBytes(file.getBytes(), filePath + flag + "-" + fileName);  // ***/manager/files/1697438073596-avatar.png
            System.out.println(fileName + "--上传成功");

        } catch (Exception e) {
            System.err.println(fileName + "--文件上传失败");
        }
        String http = "http://" + ip + ":" + port + "/files/";

        String imageId = imageServer.select(UserId,GroupId);

        Image3D image3D = new Image3D();
        image3D.setImageUrl(http + flag + "-" + fileName);
        image3D.setDescription(Description);
        image3D.setImageId(imageId);
        image3D.setGroupId(GroupId);
        if(imageId!=null){
            image3D.setUserId(UserId);
            imageServer.update(image3D);
        }else{
            image3D.setImageId(String.valueOf(UUID.randomUUID()));
            imageServer.insert(image3D);
        }

        return Result.success(http + flag + "-" + fileName);  //  http://localhost:9090/files/1697438073596-avatar.png
    }

    /**
     * 获取组图片
     *
     */
    @GetMapping("/getGroupImage")
    public Result delFile(String UserId) {
       List<Image3D> list = imageServer.getGroupImage(UserId);
       return  Result.success(list);
    }


}
