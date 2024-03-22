/*
 Navicat Premium Data Transfer

 Source Server         :  myblog
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : xm-blog

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 22/03/2024 14:12:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '活动名称',
  `descr` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '活动简介',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '活动内容',
  `start` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开始时间',
  `end` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结束时间',
  `form` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '活动形式',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '活动地址',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '主办方',
  `read_count` int NULL DEFAULT 0 COMMENT '浏览量',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '活动' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (11, '记忆训练活动', '提高我们的记忆力', '<h1>五个让你成为记忆冠军的小技巧</h1><ul><li>克劳迪娅·哈蒙德</li><li>（Claudia Hammond）</li></ul><p><time>2019年6月5日</time></p><figure><p><picture><img src=\"https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/922F/production/_107232473_p074vcf6.jpg\" alt=\"图钉\"/></picture></p><p>图像来源,GETTY IMAGES</p></figure><p><b>我们经常这样：想着要买三样东西，去到商店之后却只记得两样；上楼之后却忘了上来的原因；看完信息之后转眼忘掉。我们要是能有更好的记忆力就好了。</b></p><p>许多记忆方法都已被尝试并证实过，口诀记忆、联想记忆等记忆术（mnemonic）甚至已经存在了数十年。现在的科学家又在寻找什么新方法呢？在我们确定最佳方法前还需要进行许多调查，但最新的研究能告诉我们哪些未来最常见的记忆技巧呢？</p><h2>1）向后走</h2><p>我们将时间与空间想象成非常不同的事物，可能都没有意识到即使是在说话时也提到了很多与时间和空间相关的概念。我们把发生的事情“放诸脑后”、“期望着”周末。这些表达可能因文化各有差异，但在西方世界中，我们大部分人都将未来想象成在我们前方空间伸展的事物，而过去则是在我们身后。</p><ul><li><a href=\"https://www.bbc.com/ukchina/simp/vert-fut-43258880\">让大脑关机 轻轻松松改善记忆力</a></li><li><a href=\"https://www.bbc.com/ukchina/simp/vert_fut/2016/08/160809_vert_fut_the-mystery-of-why-you-cant-remember-being-a-baby\">为何人类没有婴儿时期的记忆？</a></li><li><a href=\"https://www.bbc.com/ukchina/simp/vert_fut/2015/11/151117_vert_fut_improve-your-memory\">只要40秒就能改善记忆的方法</a></li></ul><p>罗汉普顿大学（University of Roehampton）的研究人员决定，针对我们心智中对时间与空间的这种联系进行研究，以便增强我们的记忆力。</p><section></section><p>他们向人们展示一列单词，一套图组或是记录一位女性的手提包被盗过程的分段影像。人们被告知，在节拍器跳动时在房间内向前或向后走10米。人们在记忆影像、单词以及图片后进行测试，向后走的人们在每个测试中都表现出更好的记忆力。</p><p>倒着走像是鼓励他们的心智在时间上回到过去，结果则是他们能更加容易地记起事情。</p><p>在他们仅仅想象自己倒着走，实际上并没有这么做的时候，这种方法甚至也行得通。这份2018年的研究与一些2006年在白鼠身上的有趣研究不谋而合。当白鼠学会在迷宫中找到方向时，被称作“位置细胞”的神经元在每个位置都作了标记。研究人员发现，每当白鼠在迷宫中停顿，神经元就会和每个它们一路上学习过的地点关联起来，并作逆向标记。所以它们心智上的回溯能帮助他们记住正确的路线。</p><figure><p><picture><img src=\"https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/85BA/production/_107243243_p074v9kt.jpg\" alt=\"便利贴\"/></picture></p><p>图像来源,GETTY IMAGES</p><figcaption>图像加注文字,<p>许多增强记忆力的方式都已被尝试、证实，科学也可能已经发现了其它方法（Credit：Getty Images）</p></figcaption></figure><p>如今，全新的研究显示，当人类记忆过去的事件时，会反向地在心智上重新构建这件事情的体验。当我们第一次看见一个物体时，我们先注意到它的图案和颜色，然后才想到它是什么。当我们尝试记住一件事物时，使用的则是另一种方法：我们先记住这件物体，然后如果幸运的话，才会记忆它的细节。</p><h2>2）画画</h2><p>不如尝试画出你的购物清单而不是简单地写下商品？2018年的一项实验中，一组年轻人和老年人分别记忆一份单词列表，其中有一半被告知为每一个单词画画，而剩下一半的人则被告知在记忆的时候写下单词，稍后测试人们记住了多少个单词。虽然“同位素”等单词很难被画出来，但画画的行为效果好得多，让老年人在回忆单词时能表现得像年轻人一样。画画甚至能够在老年失智症人群中起作用。</p><p>当我们画画时，我们不得不考虑更多细节，而这种深层次思考让我们更有可能记住它。抄写单词也略有帮助。你到了超市却把购物清单忘在家里，也比不写清单记得多，就是这个原因。画画则是比书写更进一步。</p><ul><li><a href=\"https://www.bbc.com/ukchina/simp/vert_fut/2015/06/150624_vert_fut_learn_zero_effort\">记忆专家教你如何\"超级学习\"</a></li><li><a href=\"https://www.bbc.com/ukchina/simp/vert-fut-45591893\">开学季必读：五个让你变聪明的记忆小技巧</a></li><li><a href=\"https://www.bbc.com/ukchina/simp/vert-fut-41986139\">“超强自我记忆症”带来的烦恼</a></li></ul><p>如果因为擅长玩“你画我猜”，就觉得这个技巧对你更有效的话，你可能要失望了。绘画本身的质量并不会造成任何影响。</p><h2>3）做点运动，但要找对时机</h2><p>跑步等有氧运动有助于增强记忆力，已经是大家早就知道的事情了。规律运动对整体记忆的作用不大，但当你需要专门学习一项事物时，一段时间内一次性的努力，至少是有效的。</p><figure><p><picture><img src=\"https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/D3DA/production/_107243245_p074vc07.jpg\" alt=\"写字\"/></picture></p><p>图像来源,GETTY IMAGES</p><figcaption>图像加注文字,<p>即使你写了购物清单却把它忘在家里，书写的动作也会让你更有可能记住要买的东西（Credit：Getty Images）</p></figcaption></figure><p>但研究显示，如果我们刚好在正确的时间运动，记忆力可能会更大幅度增强。在学习带有地点的图组后，学习之后四小时再做35分钟间歇训练的人，比学习后直接做间歇运动的人能更好记住图组。</p><p>未来，研究人员将会努力找出效益最高的运动时间点，而该时间点可能因需要记忆的事物不同而不同。</p><h2>4）什么都不做</h2><p>当外伤性健忘症患者试图记忆15个单词，然后再做其他任务时，10分钟后，他们只记得14%的原来的单词。但如果让他们记忆后坐在黑暗的房间里，15分钟内什么也不做，他们能记住49%的单词，效果惊人。</p><p>自从赫瑞瓦特大学（Herriot Watt University）杜瓦（Michaela Dewar）的研究发表以来，相同的技巧就被运用到多种研究中。杜瓦发现，一名健康人在学习后稍作休息，甚至能影响他一整个星期后此记忆还剩多少。你可能会想，我们怎么能知道，测试对象有没有狡黠地将在暗房中的10分钟用来重复背诵单词，因此他们才没有忘记。为了防止这种情况，杜瓦聪明地让人们去记忆一些难以发音的外文单词，测试人员几乎不可能自己重复这些单词。</p><p>这些研究证明了，新记忆是多么的脆弱，以至于一段短暂的休息都能决定它们的存留。</p><figure><p><picture><img src=\"https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/121FA/production/_107243247_p074v9z7.jpg\" alt=\"跑步\"/></picture></p><p>图像来源,GETTY IMAGES</p><figcaption>图像加注文字,<p>跑步等体育运动已被证实能增强记忆（Credit：Getty Images）</p></figcaption></figure><h2>5）打个盹</h2><p>如果向后走、画画、运动甚至是稍作休息都听上去过于麻烦的话，不如试试打个盹？睡眠时，我们会在大脑中重演或者再次激活刚刚学习的事物，人们也一直认为睡眠有助于巩固记忆。而睡眠也不一定要在晚上进行。德国的研究人员发现，在记忆几组单词时，随后睡了90分钟的人比看了一场电影的人能记住更多单词。</p><p>最近的研究认为，这种技巧在人们习惯午后打盹时效果最好。这让加州大学河滨分校（University of California Riversid）的麦克德维特（Elizabeth McDevitt）和她的团队思考：有无可能训练人们打盹。所以，四名平时不打盹的人士开始在为期四周中的白天里，尽可能地打盹。</p><p>可惜的是，对于这些人来说，打盹并没有促进他们的记忆力。所以，可能需要延长训练期，或者有些人需要的只是向后走、画画、跑跑步或者简单一点——什么都不做。</p>', '2024-03-01', '2024-03-14', NULL, '线上', '北栅记忆', 1, 'http://localhost:9090/files/1709714658385-Snipaste_52.png');

-- ----------------------------
-- Table structure for activity_sign
-- ----------------------------
DROP TABLE IF EXISTS `activity_sign`;
CREATE TABLE `activity_sign`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `activity_id` int NULL DEFAULT NULL COMMENT '活动ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '报名时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '活动报名' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activity_sign
-- ----------------------------

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '北栅', 'http://localhost:9090/files/1709873842996-Snipaste_3.png', 'ADMIN', '15528023790', ' tingqingzhang90@gmail.com');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简介',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签',
  `user_id` int NULL DEFAULT NULL COMMENT '发布人ID',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布日期',
  `read_count` int NULL DEFAULT 0 COMMENT '浏览量',
  `category_id` int NULL DEFAULT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '博客信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (33, '2023十大思维导图软件排行，好用的思维导图软件推荐', '<p>接下来，我将为大家推荐10款2023年最好用的思维导图软件：</p><h2>1、<a href=\"https://link.zhihu.com/?target=https%3A//gitmind.cn/%3Fapptype%3Dchn-zhihu\" target=\"_blank\">GitMind</a></h2><p>GitMind是一款支持在电脑、手机、网页和平板设备上使用的思维导图软件，无节点数量限制，导出无水印。</p><p>主要功能有AI一句话生成思维导图、图片转思维导图、文档自动转思维导图、大纲视图、一键自动布局、多人实时协作、插入公式/贴纸/备注、批量管理文件、格式刷、自定义主题、快速查看历史版本、插入关系线、添加概括、演示模式、一键分享思维导图、多格式文本导出、电脑手机云同步等等。</p><p>可用来轻松制作思维导图、逻辑结构图、业务流程图、UML图、组织架构图、拓扑图以及数据流图等等，适用于做读书笔记、项目规划、会议记录以及头脑风暴、产品规划等。<br/></p><p><b>主要特点：</b></p><p>免费无广告无水印，简单易上手</p><p>支持输入一句话，AI生成思维导图</p><p>支持上传Word/PDF文档，AI自动生成思维导图</p><p>支持上传图片，AI自动转成思维导图</p><p>支持自由设计主题样式和风格</p><p>可以导出PDF、TXT以及多种图片格式</p><p>支持将文件适时同步至手机端、平板端</p><p>支持插入公式/图片以及关系线等</p><p>支持制作流程图、拓扑图等多种图形</p><p>支持创建多个中心主题</p><p>提供有大量的思维导图模板可直接使用</p><p>有演示模式，可以想PPT一样演示思维导图</p><p>支持多人实时协作，内容自动同步</p><p>有历史版本功能，可一键恢复历史内容</p><p>支持思维导图文件拆分、合并，打印更方便</p><figure><p><img src=\"https://pic4.zhimg.com/v2-bf6e0d37a8db664be820afa25647eb9f_b.jpg\" alt=\"动图封面\"/></p><p><g><ellipse></ellipse><ellipse></ellipse></g><g><path></path></g></p></figure><figure><p><img src=\"https://pic2.zhimg.com/v2-e6e14c0adfc5a7abb62a575fff4ee929_b.jpg\" alt=\"动图封面\"/></p><p><g><ellipse></ellipse><ellipse></ellipse></g><g><path></path></g></p></figure><figure><p><img src=\"https://pic4.zhimg.com/80/v2-c27a3252d4fea5175fa2c1819fd3096f_720w.webp\"/></p><figcaption>GitMind思维导图模板</figcaption></figure><p><b>官网直达：</b></p><p><a target=\"_blank\" href=\"https://link.zhihu.com/?target=https%3A//gitmind.cn/%3Fapptype%3Dchn-zhihu\">GitMind · 思乎 - 全平台思维导图软件<path></path>gitmind.cn/?apptype=chn-zhihu<img src=\"https://pic3.zhimg.com/v2-5d25a7d19c69ece0aebe3c41ceabc456_180x120.jpg\" alt=\"\"/></a></p><h2>2、MindMaster</h2><p>MindMaster是由忆图出品的一款思维导图软件，提供有丰富的功能和模版，可导出多种文本格式。有脑图社区，提供有脑图模版可以参考；可以为脑图内容插入关系线，快速梳理各个主题的关系。</p><p><b>主要特点：</b></p><p>功能和模版丰富，导出格式比较多</p><p>提供有脑图模版可供参考</p><p>可以为脑图内容插入关系线</p><figure><p><img src=\"https://pic4.zhimg.com/80/v2-895cc39bc3acc02ed38dd05be1df3f2b_720w.webp\"/></p></figure><p><br/></p><h2>3、iMindMap</h2><p>iMindMap是思维导图创始人托尼·巴赞开发的思维导图APP ，线条自由，具有手绘功能。结合独特的自由形态头脑风暴视图模式和系统的思维导图视图模式，适用于头脑风暴、策划和管理项目、创建演示文稿等。可用来创造3D视图、演示文稿视图、iMINDMAP 在线、多图、动画+时尚的界面、图像+图标以及智能单元格等等。</p><p><b>主要特点：</b></p><p>支持手绘思维导图，色彩好</p><p>头脑风暴功能较为出彩</p><p>有思维导图的认证及培训等外在服务</p><figure><p><img src=\"https://pic1.zhimg.com/80/v2-17afc8294b1c9619e196604acd6c7f5c_720w.webp\"/></p></figure><p><br/></p><h2>4、Xmind</h2><p>XMind是一款国内比较知名的思维导图软件，该软件有 Plus/Pro 版本，提供更专业的功能。除了常规的思维导图， XMind 同时也提供了树状图，逻辑结构图和鱼骨图，具有内置拼写检查，搜索，加密，甚至是音频笔记功能。</p><p><b>主要特点：</b></p><p>界面简洁美观</p><p>结构比较丰富</p><p>支持自由节点</p><figure><p><img src=\"https://pic1.zhimg.com/80/v2-5ab822ea177f7f170de64bcda162cb10_720w.webp\"/></p></figure><p><br/></p><h2>5、MindNode</h2><p>MindNode作为一款好用的思维导图软件 ，界面简洁，操作人性化，基本功能一应俱全。可以与 Mac 电脑同步，还提供了无线局域网访问。运用 Mindnode，我们可以轻松记录下自己的想法和知识结构。</p><p><b>主要特点：</b></p><p>支持无限延伸</p><p>支持Mac和IOS云同步</p><figure><p><img src=\"https://pic3.zhimg.com/80/v2-6b68d52aa2890f16e324428e8f2ad7aa_720w.webp\"/></p></figure><p><br/></p><h2>6、MindLine</h2><p>MindLine是一款兼容安卓、iOS、Windows以及Mac四大系统的免费思维导图软件，在电脑端安装便捷而且占用内存小，不管是Windows还是Mac电脑都可以流畅使用。适合奉行极简主义用户进行简单的思维导图编辑与个人创作。</p><p><b>主要特点：</b></p><p>操作简单快捷，支持Windows/Mac系统云同步</p><p>支持导出图片、XMind、FreeMind等格式文件</p><p>支持iOS、安卓设备和电脑网页同步共享文件</p><p>支持添加概括、连接线以及标记内容</p><figure><p><img src=\"https://pic2.zhimg.com/80/v2-099061fd4b654002bd8b66ba51094835_720w.webp\"/></p></figure><p><br/></p><h2>7、zhimap</h2><p>zhimap是一个在线知识整理、在线免费思维导图软件，支持富文本编辑、插入图片、插入数学公式、创建文件夹、修改颜色、导出高清图片、PDF文档等。</p><p><b>主要特点：</b></p><p>支持在微信公众号直接打开编辑</p><p>手机在线端使用很流畅</p><p>支持为节点添加图标和备注</p><p>提供有3个样式，简单直观</p><p>支持在手机端直接下载思维导图图片</p><figure><p><img src=\"https://pic1.zhimg.com/80/v2-efd01400bd07b630702fd5797f75bc20_720w.webp\"/></p></figure><p><br/></p><p><b>8、Mindjet Maps</b></p><p>Mindjet Maps是一款全平台的思维导图APP，可直接在安卓手机、iOS手机上绘制编辑思维导图，创建主题备注、添加图标和图像、丰富上下文和细节、设置优先级标记以及在主题之间创建关联等等。<br/></p><p><b>主要特点：</b></p><p>支持平台多样</p><p>可以自由设计图形样式</p><p>可以自由更改连接线颜色</p><p>支持添加图标、图像等</p><figure><p><img src=\"https://pic2.zhimg.com/80/v2-f10802a2b9112213d02febc2ce2687c9_720w.webp\"/></p></figure><h2>9、思维简图</h2><p>思维简图是一款支持在手机端绘制放射图、树状图、步骤图以及清单图的思维导图App。界面简洁，支持将制作的思维导图导入PC版本，支持一键搜索百度百科模板。</p><p><b>主要特点：</b></p><p>支持制作放射图</p><p>支持制作树状图</p><p>支持将制作的思维导图导入PC版本</p><p>支持一键搜索百度百科模板</p><figure><p><img src=\"https://pic3.zhimg.com/80/v2-2830e0c4f902b88b2beb77d99c9902fe_720w.webp\"/></p></figure><p><br/></p><h2>10、3A 思维导图</h2><p>3A 思维导图是一款用于企业管理、团队协作、个人成长的思维导图软件，支持Mac、Windows系统，可以在安卓手机上随时查看和编辑思维导图。除此之外，该工具还支持离线编辑、电脑平板云同步等等。<br/></p><p><b>主要特点：</b></p><p>支持多平台制作思维导图</p><p>支持离线编辑思维导图</p><p>有很多思维导图模板可以使用</p><figure><p><img src=\"https://pic1.zhimg.com/80/v2-48cf60d0dc77f20cb42c9ab5c4175fc4_720w.webp\"/></p></figure><p>以上就是本次推荐的10款最好用的思维导图软件了，如果你有更好用的脑图软件，欢迎留言告诉我哦~</p>', '很多朋友都在搜索思维导图软件/脑图软件，因为思维导图软件可以帮我们快速整理思维，提高我们的思维梳理效率。在如今的市面上，已经涌现出了很多好用的思维导图软件。使用这些思维导图软件，不仅可以在电脑上制作思维导图，也可以在手机上制作思维导图。', 'http://localhost:9090/files/1709187294118-w1.avif', '[\"小白\",\"习惯养成\"]', 13, '2024-02-29', 0, 1);
INSERT INTO `blog` VALUES (34, '我的记忆方法', '<p>记忆宫殿，或者说宫殿记忆法，它所用的记忆方法是“位置记忆法”，也就是把要记忆的信息存放到特定空间的特定位置上，从而更好地完成记忆。</p><p>宫殿记忆法的主要步骤有三个，第一是选择或创建你的记忆宫殿，第二是在宫殿内规划一条记忆路线，第三是在宫殿内的记忆线路上存放东西并记住它。</p><p>首先是选择或创建你的记忆宫殿</p><p>记忆宫殿包含宫殿和记忆，所以首先你得有一座宫殿，这个宫殿没有固定的型态，可以是你的卧室、你的房子、你的身体、你的教室和学校，也可以是一条街道、一条上班或上学的路线、甚至是整个城市等等，都可以。我的建议是选择你较为熟悉的地方比较好，因为这样更有利于记忆。比如“精英特速读记忆训练软件”中的人体编码和家居定位，就是用我们每个人都比较熟悉的身体和房间作为宫殿。</p><p><img src=\"http://p2.itc.cn/q_70/images03/20201219/63829460c80a4dec9be5912e46cfff00.jpeg\"/></p><p>当然，如果你不想用现有的“宫殿”，或觉得现有的不够理想，你也可以自己想象并创建一个。比如你的宫殿是一栋大楼，你可以设定大楼有几层，每层有几个房间，在房间里面，又可以设定小空间，比如箱子、图画、家具等等。要注意的是：最好确保设定的每个地方和其他地方都是不同的，避免混淆。</p><p>有了宫殿之后，还要在自己的“宫殿内”规划一条路线。</p><p>比如你的宫殿是你的房子，你的路线可以是：从进入家门开始，沿着左边以顺时针方向延伸的一条路线，这条路线上依次有：鞋柜、挂钟、餐桌、沙发、茶几等等。</p><p><img src=\"http://p6.itc.cn/q_70/images03/20201219/11f61fd4de1042d79edc5cee593a2e81.jpeg\"/></p><p>规划好线路之后，闭上眼睛，检查一下脑海中的图像，确保你已经记住了线路上的所有位置和顺序。</p><p>线路的顺序和线路上的位置是非常重要，位置或物品的顺序是你之后存放东西的顺序，也就是记忆的顺序，位置或物品本身是你要存放东西的地方。对于新手来说，建议在同一个地方放1-2样东西就可以了，放的东西太多容易造成错乱。</p><p>放好之后就是如何记的问题，如果是死记硬背，把知识或信息硬塞进这个宫殿中，那没有多少意义。要想让记忆宫殿更好的发挥作用，一定要充分调动你的想象力，进行关联记忆。</p><p>例如，你要记住“椅子，书，河流，树枝，剪刀”这5个词语。假如你选择的线路上前5个家居物品是：鞋柜、挂钟、餐桌、沙发、茶几。那么就可以依次想象：鞋柜上有一把椅子摇啊摇，挂钟的钟摆是一本书摆啊摆，餐桌上流淌着一条弯弯曲曲的河流，沙发上躺着一根树枝，茶几上插着一把剪刀。这样一幅奇特的画面你一定已经记住了，那关联的5个词语、包括词语的顺序也就记住了。</p><p>当然了，线路上的每一个位置或物品上可以放多个记忆对象。比如刚才的场景，如果放两个记忆对象，就可以是：鞋柜上一把椅子在看书，挂钟是一条河流的出口，不断淌出大把的树枝和剪刀。</p><p>用记忆宫殿进行记忆的时候，关键就是要充分调动我们的想象和联想的能力，想的越奇特越好，这样越容易快速记住。关于联想和想象力的练习，可以参考我刚说的精英特速读记忆训练软件，软件中速读部分的“无声看图和无声思考”、记忆部分的大部分练习都可以很好地锻炼我们的思维能力，提高想象和联想的能力。</p><p><img src=\"http://p5.itc.cn/q_70/images03/20201219/022b539ec0b6426dbb16892a87e2ebbf.jpeg\"/></p><p>记忆宫殿的用法相对还是比较广泛的，可以用来临时记忆，比如记住一个购物清单；也可以用来长久记忆，比如记住一篇文章或一本书籍的重要知识点。如果你想要在宫殿中长期记忆一些信息的话，你需要时常地“进去”看看、想想。比如晚上睡觉前，就可以进入你的记忆宫殿中，按照线路一一的重现一下画面。</p><p>以上就是记忆宫殿的基本方法和步骤了。&nbsp;<strong>方法其实并不能，关键是练习。任何一种记忆方法的掌握，都离不开大量的练习，只有在不断练习中才能熟练掌握，快速使用。</strong></p>', '主要介绍了我目前使用到的记忆方法', 'http://localhost:9090/files/1709187880169-w2.jpg', '[\"训练\",\"习惯养成\"]', 13, '2024-02-29', 4, 6);
INSERT INTO `blog` VALUES (35, '海的圣都', '<p>海就是包容万物</p><p><img src=\"http://localhost:9090/files/1709559649830-Snipaste_41.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '什么是海', 'http://localhost:9090/files/1709559579090-Snipaste_4.png', '[\"寻找搭档\"]', 13, '2024-03-04', 0, 9);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '博客分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '思维导图');
INSERT INTO `category` VALUES (2, '联想记忆');
INSERT INTO `category` VALUES (4, '位置记忆法');
INSERT INTO `category` VALUES (5, '组织法');
INSERT INTO `category` VALUES (6, '记忆宫殿法');
INSERT INTO `category` VALUES (7, '图标图形法');
INSERT INTO `category` VALUES (8, '语言和音频法');
INSERT INTO `category` VALUES (9, '其他');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fid` int NULL DEFAULT NULL COMMENT '关联ID',
  `user_id` int NULL DEFAULT NULL COMMENT '点赞人ID',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模块',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收藏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (26, 26, 5, '博客');
INSERT INTO `collect` VALUES (31, 26, 4, '博客');
INSERT INTO `collect` VALUES (42, 9, 4, '活动');
INSERT INTO `collect` VALUES (43, 28, 5, '博客');
INSERT INTO `collect` VALUES (44, 4, 5, '博客');
INSERT INTO `collect` VALUES (45, 10, 5, '活动');
INSERT INTO `collect` VALUES (46, 5, 5, '活动');
INSERT INTO `collect` VALUES (47, 9, 5, '活动');
INSERT INTO `collect` VALUES (48, 29, 12, '博客');
INSERT INTO `collect` VALUES (49, 8, 12, '活动');
INSERT INTO `collect` VALUES (50, 29, 13, '博客');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `user_id` int NULL DEFAULT NULL COMMENT '评论人',
  `pid` int NULL DEFAULT NULL COMMENT '父级ID',
  `root_id` int NULL DEFAULT NULL COMMENT '根节点ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论时间',
  `fid` int NULL DEFAULT NULL COMMENT '关联ID',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模块',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fid` int NULL DEFAULT NULL COMMENT '关联ID',
  `user_id` int NULL DEFAULT NULL COMMENT '点赞人ID',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模块',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '点赞' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES (25, 3, 5, '博客');
INSERT INTO `likes` VALUES (26, 4, 5, '博客');
INSERT INTO `likes` VALUES (27, 26, 5, '博客');
INSERT INTO `likes` VALUES (30, 25, 4, '博客');
INSERT INTO `likes` VALUES (31, 3, 4, '博客');
INSERT INTO `likes` VALUES (33, 26, 1, '博客');
INSERT INTO `likes` VALUES (41, 26, 4, '博客');
INSERT INTO `likes` VALUES (53, 9, 4, '活动');
INSERT INTO `likes` VALUES (55, 28, 5, '博客');
INSERT INTO `likes` VALUES (56, 8, 5, '活动');
INSERT INTO `likes` VALUES (59, 9, 5, '活动');
INSERT INTO `likes` VALUES (60, 29, 12, '博客');
INSERT INTO `likes` VALUES (61, 8, 12, '活动');
INSERT INTO `likes` VALUES (62, 32, 4, '博客');
INSERT INTO `likes` VALUES (65, 29, 13, '博客');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '今天系统正式上线，开始内测', '今天系统正式上线，开始内测', '2023-09-05', 'admin');
INSERT INTO `notice` VALUES (2, '目前正处于测试阶段', '处于测试阶段 ，暂不支持场景自定义', '2023-09-05', 'admin');

-- ----------------------------
-- Table structure for shipins
-- ----------------------------
DROP TABLE IF EXISTS `shipins`;
CREATE TABLE `shipins`  (
  `id` int NOT NULL,
  `url` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lujing` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipins
-- ----------------------------

-- ----------------------------
-- Table structure for t_classes
-- ----------------------------
DROP TABLE IF EXISTS `t_classes`;
CREATE TABLE `t_classes`  (
  `noid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `classes_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '班级名称',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`noid`) USING BTREE,
  UNIQUE INDEX `unq_banji_name`(`classes_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_classes
-- ----------------------------
INSERT INTO `t_classes` VALUES ('1ebceb38fa7c4972af8dde09702ba560', '大数据2', '2022-01-18 12:00:00');
INSERT INTO `t_classes` VALUES ('83492e01ab1d43d39092c18827242377', '大数据', '2022-01-05 12:00:00');

-- ----------------------------
-- Table structure for t_classes_student
-- ----------------------------
DROP TABLE IF EXISTS `t_classes_student`;
CREATE TABLE `t_classes_student`  (
  `noid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `classes_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '班级id',
  `student_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学生id',
  PRIMARY KEY (`noid`) USING BTREE,
  UNIQUE INDEX `unq_banji_student`(`classes_id` ASC, `student_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_classes_student
-- ----------------------------
INSERT INTO `t_classes_student` VALUES ('0b4312460b0548b2930cedad806aca37', '1ebceb38fa7c4972af8dde09702ba560', '190ff80cba6c4c10848cce2c13f1a664');
INSERT INTO `t_classes_student` VALUES ('7ba87e44c1624472b98856105be5db2e', '1ebceb38fa7c4972af8dde09702ba560', 'b03fcfbc79204d8f92f616f4792ab175');
INSERT INTO `t_classes_student` VALUES ('8a2f4977ea4246a89b6ae285b5d5aed8', '1ebceb38fa7c4972af8dde09702ba560', 'bb639f5510174fc9be9225322214d0bb');
INSERT INTO `t_classes_student` VALUES ('c0043af843da482f961cdab0a43e9eaf', '83492e01ab1d43d39092c18827242377', '190ff80cba6c4c10848cce2c13f1a664');
INSERT INTO `t_classes_student` VALUES ('40ab20235f574a12986fa5f279c12929', '83492e01ab1d43d39092c18827242377', 'b03fcfbc79204d8f92f616f4792ab175');
INSERT INTO `t_classes_student` VALUES ('213b40e25ddb4f1490c462da56b21263', '83492e01ab1d43d39092c18827242377', 'bb639f5510174fc9be9225322214d0bb');
INSERT INTO `t_classes_student` VALUES ('ce0bf8074ef2444ea99e0e00e2c29431', '83492e01ab1d43d39092c18827242377', 'ca5ebbdbe28f414d94b6bcde2c818b57');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student`  (
  `noid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `student_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学号',
  `student_realname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `student_sex` tinyint NULL DEFAULT NULL COMMENT '1. 男 2.女',
  `student_age` smallint NULL DEFAULT NULL COMMENT '年龄',
  `order_numb` int NULL DEFAULT 100 COMMENT '顺序值，默认100',
  `current_class` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学生当前所选择的班级',
  PRIMARY KEY (`noid`) USING BTREE,
  UNIQUE INDEX `unq_student_code`(`student_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('190ff80cba6c4c10848cce2c13f1a664', 'xiaowang', '111111', '103', '小王', 1, 18, 103, '83492e01ab1d43d39092c18827242377');
INSERT INTO `t_student` VALUES ('b03fcfbc79204d8f92f616f4792ab175', 'lisi', '123', '102', '小李', 2, 23, 102, '83492e01ab1d43d39092c18827242377');
INSERT INTO `t_student` VALUES ('bb639f5510174fc9be9225322214d0bb', 'xiaomei', '111111', '104', '小美', 2, 20, 104, '1ebceb38fa7c4972af8dde09702ba560');
INSERT INTO `t_student` VALUES ('ca5ebbdbe28f414d94b6bcde2c818b57', 'zhangsan', '111111', '101', '张三', 1, 20, 101, '1ebceb38fa7c4972af8dde09702ba560');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `noid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账户密码',
  `realname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `role` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`noid`) USING BTREE,
  UNIQUE INDEX `unq_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '111111', '超级管理员', 'admin');
INSERT INTO `t_user` VALUES ('25baf5c711004da7b91c3d464bd6e692', 'xiaowang', '111111', '小王', 'student');
INSERT INTO `t_user` VALUES ('892d98081ac44e62a583fde126bcf24f', 'xiaomei', '111111', '小美', 'student');
INSERT INTO `t_user` VALUES ('90d6f8f2d21e451c89ef663438b77a87', 'zhangsan', '111111', '张三', 'student');
INSERT INTO `t_user` VALUES ('aa17efabd8414f0db5b382461c9574f6', 'lisi', '123', '小李', 'student');

-- ----------------------------
-- Table structure for t_video_info
-- ----------------------------
DROP TABLE IF EXISTS `t_video_info`;
CREATE TABLE `t_video_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `video_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '视频名称',
  `video_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '视频路径',
  `video_png` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面图路径',
  `create_time` datetime NULL DEFAULT NULL COMMENT '上传日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_video_info
-- ----------------------------
INSERT INTO `t_video_info` VALUES (89, 'Nginx', '2022-04/23/2105539543.mp4', '2022-04/23/2105559039.jpg', '2022-04-22 12:00:00', '2022-04-23 21:05:53');
INSERT INTO `t_video_info` VALUES (93, '效果图', '2022-04/23/2109329013.mp4', '2022-04/23/2109329372.jpg', '2022-04-13 12:00:00', '2022-04-23 21:09:31');
INSERT INTO `t_video_info` VALUES (95, '我爱你不问归期', '2022-04/23/2115109741.mp4', '2022-04/23/2115109188.jpg', '2022-04-05 12:00:00', '2022-04-23 21:14:42');
INSERT INTO `t_video_info` VALUES (98, '辞九门回忆', '2022-04/23/2117439355.mp4', '2022-04/23/2117439203.jpg', '2022-04-13 12:00:00', '2022-04-23 21:17:17');
INSERT INTO `t_video_info` VALUES (112, 'Echarts效果图', '2022-04/25/1049369248.mp4', '2022-04/25/1049369356.jpg', '2022-04-13 12:00:00', '2022-04-25 10:49:36');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简介',
  `birth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生日',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (10, 'acc', '123', 'acc', 'http://localhost:9090/files/1702263517115-微信截图_20231018172452.png', 'USER', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (11, 'abc', '1234', 'abc', 'http://localhost:9090/files/1701745246171-微信截图_20231114162404.png', 'USER', NULL, '13899887799', NULL, NULL, NULL);
INSERT INTO `user` VALUES (12, 'aff', '123', 'aff', 'http://localhost:9090/files/1702376508412-微信截图_20231018172452.png', 'USER', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (13, 'bei1', '123', 'bei1', 'http://localhost:9090/files/1709132790912-EasyPhoto-0019.png', 'USER', NULL, '15528023790', ' tingqingzhang90@gmail.com', '我是大v快关注我', '2024-02-14');
INSERT INTO `user` VALUES (14, 'r1', '123', 'r1', NULL, 'USER', NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
