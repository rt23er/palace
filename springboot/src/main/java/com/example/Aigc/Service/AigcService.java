package com.example.Aigc.Service;



import com.alibaba.dashscope.exception.InputRequiredException;
import com.alibaba.dashscope.exception.NoApiKeyException;
import com.example.Aigc.entity.AiQuestion;
import com.example.Aigc.entity.Aigc;
import com.example.common.Result;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public interface AigcService {
    void insert(Aigc aigc);

    Result delete(Aigc aigc);

    List<Aigc> selectStateByUserId(String userId);

    Result selectStateByUserId1(String userId);

    Result getAnswer(AiQuestion Question, String  id) throws NoApiKeyException, InputRequiredException, IOException;
}
