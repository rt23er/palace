package com.example.Aigc.Service.impl;

import com.alibaba.dashscope.common.Message;
import com.alibaba.dashscope.common.MessageManager;
import com.alibaba.dashscope.common.Role;
import com.alibaba.dashscope.exception.InputRequiredException;
import com.alibaba.dashscope.exception.NoApiKeyException;
import com.example.Aigc.Service.AiTalkService;
import com.example.Aigc.Service.AigcService;
import com.example.mapper.AigcDao;
import com.example.Aigc.entity.AiQuestion;
import com.example.Aigc.entity.Aigc;
import com.example.common.Result;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class AigcServiceImpl implements AigcService {

    @Resource
    AigcDao aigcDao;

    @Resource
    AiTalkService aiTalkService;


    @Override
    public void insert(Aigc aigc) {
        //将对话信息保存
        aigcDao.insert(aigc);
    }


    @Override
    public Result delete(Aigc aigc) {

        return null;
    }

    @Override
    public List<Aigc> selectStateByUserId(String userId) {
        List<Aigc> aigcList = aigcDao.selectStateByUserId(userId);
        List<Aigc> newAigcList = new ArrayList<>();
        for (int i = aigcList.size()-1; i >= 0 ; i--) {
            newAigcList.add(aigcList.get(i));
        }
        return newAigcList;
    }


    @Override
    public Result selectStateByUserId1(String userId) {
        List<Aigc> aigcList = aigcDao.selectStateByUserId(userId);
        List<Aigc> newAigcList = new ArrayList<>();
        for (int i = aigcList.size()-1; i >= 0 ; i--) {
            newAigcList.add(aigcList.get(i));
        }
        return Result.success(newAigcList);
    }

    @Override
    public Result getAnswer(AiQuestion Question, String id) throws NoApiKeyException, InputRequiredException, IOException {

        //拼接完成后塞入AiTalk服务
        List<Aigc> aigcList = this.selectStateByUserId(id);
        MessageManager msgManager = new MessageManager(100);
        for (Aigc aigc:aigcList) {
            Message userMsg = Message.builder().role(Role.USER.getValue()).content(aigc.getUserMessage()).build();
            Message assistantMsg = Message.builder().role(Role.ASSISTANT.getValue()).content(aigc.getAnswer()).build();
            msgManager.add(userMsg);
            msgManager.add(assistantMsg);
        }
        Message newUserMessage = Message.builder().role(Role.USER.getValue()).content(Question.getQuestion()).build();
        msgManager.add(newUserMessage);
        String answer = (String) aiTalkService.test(msgManager).getData();
        Aigc aigc = new Aigc();
        aigc.setUserID( id);
        aigc.setUserMessage(Question.getQuestion());
        aigc.setAnswer(answer);
        aigc.setCreatDate(new Date());
        aigc.setAiID(String.valueOf(UUID.randomUUID()));
        this.insert(aigc);
        return Result.success(answer);
    }
}
