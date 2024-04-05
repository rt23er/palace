package com.example.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date; // 导入日期时间类

@Data
public class Video {
    /**
     * UUid
     */
    private String id;
    /**
     * 视频名称
     */
    private String videoName;
    /**
     * 视频路径
     */
    private String videoPath;
    /**
     * 封面图路径
     */
    private String videoPng;
    /**
     * 上传日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTime;
    /**
     * 修改日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updateTime;
    /**
     * 描述信息
     */
    private String description;
}
