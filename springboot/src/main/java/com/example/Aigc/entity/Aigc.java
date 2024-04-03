package com.example.Aigc.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Aigc implements Serializable {


    private String AiID;

    private String UserID;

    private String userMessage;

    private String Answer;

    private Date CreatDate;






}
