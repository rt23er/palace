package com.example.entity;

import lombok.Data;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.time.LocalDateTime;

@Data
public class Video {
    private String id;
    private String video_name;
    private String video_path;
    private String video_png;
    private LocalDateTime create_time;
    private LocalDateTime update_time;
    private String description;
}
