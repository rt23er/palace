package com.example.mapper;


import com.example.Aigc.entity.Aigc;

import java.util.List;

public interface AigcDao {
    /**
     * @author Zzj
     * @description
     * @date 2023/12/15 10:11
     * @param
     * @return
       **/
    int insert(Aigc aigc);

    /**
     * 删除数据
     *
     * @param userId 用户ID
     * @param aigcId 对话ID
     * @return 影响行数
     */
    //功能待定
//    void delete(String userId,String aigcId);

    /**
     * @author Zzj
     * @description 
     * @date 2023/12/15 9:49 
     * @param userId 用户ID
     * @return 
       **/
    List<Aigc> selectStateByUserId(String userId);

}
