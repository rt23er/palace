package com.example.Aigc;

// Copyright (c) Alibaba, Inc. and its affiliates.

import com.alibaba.dashscope.aigc.generation.Generation;
import com.alibaba.dashscope.aigc.generation.GenerationResult;
import com.alibaba.dashscope.aigc.generation.models.QwenParam;
import com.alibaba.dashscope.common.Message;
import com.alibaba.dashscope.common.MessageManager;
import com.alibaba.dashscope.common.Role;
import com.alibaba.dashscope.exception.ApiException;
import com.alibaba.dashscope.exception.InputRequiredException;
import com.alibaba.dashscope.exception.NoApiKeyException;
import com.alibaba.dashscope.utils.Constants;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ResourceBundle;

@Service
public class TokenizationQuickStart {

    public static void main(String[] args)  throws ApiException, NoApiKeyException, InputRequiredException, IOException {

        String ApiKey = "my-key-key";
        Constants.apiKey=ApiKey;

        Generation gen = new Generation();
        MessageManager msgManager = new MessageManager(10);
        //初始设定
        Message systemMsg = Message.builder().role(Role.SYSTEM.getValue()).content("你是一个计算机专家").build();
        //用户对话
        Message userMsg = Message.builder().role(Role.USER.getValue()).content("1+1=").build();
        msgManager.add(systemMsg);
        msgManager.add(userMsg);

        QwenParam param =
                QwenParam.builder().model(Generation.Models.QWEN_PLUS).messages(msgManager.get())
                        .resultFormat(QwenParam.ResultFormat.MESSAGE)
                        .topP(0.8)
                        .enableSearch(true)
                        .build();
        BufferedReader reader =new BufferedReader(new InputStreamReader(System.in));
        String UserQuestion="";
        while(!"退出".equals(UserQuestion)){
            GenerationResult result = gen.call(param);
            msgManager.add(result);
            System.out.println("提问:");
            UserQuestion = reader.readLine();
            Message nextUserMsg = Message.builder().role(Role.USER.getValue()).content(UserQuestion).build();
            msgManager.add(nextUserMsg);
            param.setMessages(msgManager.get());
            result = gen.call(param);
            String Answer = result.getOutput().getChoices().get(0).getMessage().getContent();
            System.out.println("\n小通(打出“退出”即可结束对话): \n"+Answer+"\n");
            System.out.println(msgManager.get()+"\n");
        }
    }

}
