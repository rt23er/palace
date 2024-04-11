package com.example.Aigc.controller;


import com.alibaba.dashscope.exception.InputRequiredException;
import com.alibaba.dashscope.exception.NoApiKeyException;
import com.example.Aigc.Service.AigcService;

import com.example.Aigc.entity.AiQuestion;
import com.example.common.Result;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RestController
@RequestMapping("/Ai")
public class AigcController {

    @Resource
    AigcService aigcService;

// 问答
    @RequestMapping(value = "/test",method = RequestMethod.POST)
    public Result AI(@RequestBody AiQuestion Question) throws NoApiKeyException, InputRequiredException, IOException {

        return aigcService.getAnswer(Question, Question.getId());
    }

//查询历史记录
    @RequestMapping(value = "/hisData",method = RequestMethod.GET)
    public Result getHIstoryData(String id){
        String userId = id;
        //查询前10条问答数据
        return aigcService.selectStateByUserId1(userId);
    }
}
