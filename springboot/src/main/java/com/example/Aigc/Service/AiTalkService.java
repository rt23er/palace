package com.example.Aigc.Service;

import com.alibaba.dashscope.common.MessageManager;
import com.alibaba.dashscope.exception.InputRequiredException;
import com.alibaba.dashscope.exception.NoApiKeyException;
import com.example.common.Result;


import java.io.IOException;

public interface AiTalkService {
    Result test(MessageManager message) throws NoApiKeyException, InputRequiredException, IOException;
}
