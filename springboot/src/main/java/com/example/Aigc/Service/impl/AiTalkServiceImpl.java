package com.example.Aigc.Service.impl;

import com.alibaba.dashscope.aigc.generation.Generation;
import com.alibaba.dashscope.aigc.generation.GenerationResult;
import com.alibaba.dashscope.aigc.generation.models.QwenParam;
import com.alibaba.dashscope.common.MessageManager;
import com.alibaba.dashscope.exception.InputRequiredException;
import com.alibaba.dashscope.exception.NoApiKeyException;
import com.alibaba.dashscope.utils.Constants;
import com.example.Aigc.Service.AiTalkService;
import com.example.common.Result;
import org.springframework.stereotype.Service;


import java.io.IOException;
import java.util.ResourceBundle;

@Service
public class AiTalkServiceImpl implements AiTalkService {

    @Override
    public Result test(MessageManager message) throws NoApiKeyException, InputRequiredException, IOException {
        //todo 调用Apikey

        String ApiKey = "my-key-key";
        Constants.apiKey=ApiKey;

        Generation gen = new Generation();
        MessageManager msgManager = message;
//        初始设定
//        Message systemMsg = Message.builder().role(Role.SYSTEM.getValue()).content("你是一个计算机专家").build();
//        初始设定先不要，后面有能力再搞
//        msgManager.add(systemMsg);


        QwenParam param =
                QwenParam.builder().model(Generation.Models.QWEN_PLUS).messages(msgManager.get())
                        .resultFormat(QwenParam.ResultFormat.MESSAGE)
                        .topP(0.8)
                        .enableSearch(true)
                        .build();

        GenerationResult result = gen.call(param);
        String Answer = result.getOutput().getChoices().get(0).getMessage().getContent();
        return Result.success(Answer);
    }
}
