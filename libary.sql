#功能一:创建新闻表
#总书籍表（查书号、标题、作者、分类、索书号、出版社、入库时间、馆藏地址、库存、价格、图片、状态、备注）
#新书表（查书号、标题、作者、分类、索书号、出版社、入库时间、页数、图片、状态、备注）
#书籍简介表（查书号、内容简介、作者简介、目录）
#读者信息表（学号、密码、姓名、性别、电话、所在系、生效日期、失效日期、违章状况、累计借书、备注）
#管理员信息表（工作号、姓名、性别、电话、家庭住址、备注）
#借阅表（工作号、ISBN、读者学号、借书日期、还书日期）
#管理员_书籍（工作号、ISBN、添加时间、是否在馆）
#管理员_学生（工作号、读者学号、借还确认）


#读者信息表（学号、密码、姓名、性别、电话、所在系、班级、生效日期、失效日期、违章状况、累计借书、备注）
CREATE TABLE user(
  uid VARCHAR(10) PRIMARY KEY, #学号
  upwd VARCHAR(20) DEFAULT '000000',   #密码
  name VARCHAR(20),     #姓名
  sex VARCHAR(5),       #性别
  tel VARCHAR(30),      #电话
  dept VARCHAR(30),     #所在系
  uclass VARCHAR(30),    #班级
  violation_status INT, #违章状况
  addcount INT,         #累计借书
  remark VARCHAR(100)  #备注
);

/* 第一次插入用户数据 */
INSERT INTO user VALUES
('150301','000000','陈铭','男','13845678945','计算机科学与技术','1503',0,0,null),
('150302','000000','李颖','女','15896548542','计算机科学与技术','1503',0,0,null),
('150303','000000','张玉洁','女','13896584125','计算机科学与技术','1503',0,0,null),
('150304','000000','梁琛','男','13852631234','计算机科学与技术','1503',0,0,null),
('150305','000000','胡平','男','17596845236','计算机科学与技术','1503',0,0,null),
('150306','000000','尹紫霞','女','13852469251','计算机科学与技术','1503',0,0,null),
('150307','000000','陈镇','男','15964852315','计算机科学与技术','1503',0,0,null),
('150308','000000','刘志','男','17526314856','计算机科学与技术','1503',0,0,null),
('150309','000000','李梦桃','女','15045678952','计算机科学与技术','1503',0,0,null),
('150310','000000','朱春霓','女','18815693524','计算机科学与技术','1503',0,0,null),
('150311','000000','吴晓','男','18745612895','计算机科学与技术','1503',0,0,null),
('150312','000000','杨鹏','男','13715824683','计算机科学与技术','1503',0,0,null),
('150313','000000','刘彩英','女','13645725863','计算机科学与技术','1503',0,0,null),
('150314','000000','王瑛','男','18815964752','计算机科学与技术','1503',0,0,null),
('150315','000000','罗胜利','男','13245826475','计算机科学与技术','1503',0,0,null),
('150316','000000','丁瑜安','男','18845632587','计算机科学与技术','1503',0,0,null),
('150317','000000','郭亮','男','13842569875','计算机科学与技术','1503',0,0,null),
('150318','000000','金雅芳','女','13645821637','计算机科学与技术','1503',0,0,null),
('150319','000000','王克勤','男','13954682165','计算机科学与技术','1503',0,0,null),
('150320','000000','张勇','男','13845721569','计算机科学与技术','1503',0,0,null);


/* 第二次插入的用户数据 */
INSERT INTO user VALUES
('150401','000000','陈铭','男','13845678945','计算机科学与技术','1503',0,0,null),


#服务器端口使用编码
SET NAMES UTF8;
#丢弃数据库，如果存在的话
DROP DATABASE IF EXISTS libary;
#创建数据库
CREATE DATABASE libary CHARSET=UTF8;
USE libary;

CREATE TABLE book(
  bid INT PRIMARY KEY AUTO_INCREMENT,  #id
  ISBN VARCHAR(20),	    #查书号
  title VARCHAR(20),		#标题
  author VARCHAR(20),	  #作者
  classify VARCHAR(10),	#分类
  searchid VARCHAR(20),	#索书号
  press VARCHAR(20),	  #出版社
  address VARCHAR(20),	#地址
  entry_time DATE,		  #入库时间
  stock SMALLINT,		    #库存
  price DECIMAL(7,2),	  #价格
  page SMALLINT,        #页数
  pic VARCHAR(50),		  #图片
  state BOOL DEFAULT 1,	#状态
  remark VARCHAR(200),	#备注
  content_intro VARCHAR(500),  #内容简介
  author_intro VARCHAR(500)    #作者简介 
);

/* 第一次插入全部书籍的数据 */

INSERT INTO book VALUES
(null,"9787208141049","陈公培文集","陈公培，1901-1968著","中文","C52/1610","上海 上海人民出版社 2016","一楼社科图书借阅室","2019-2-2",50,"52.00",277,"img/book/chengongpei.jpg",1,null,null,null),
(null,"9787561562284","越境的力量 历史与思想论集 盛嘉著","盛嘉 著","中文","C52/1615","厦门 厦门大学出版社 2016","一楼社科图书借阅室","2019-2-2",50,"52.00",358,"img/book/yuejingdeliliang.png",1,null,"《越境的力量（历史与思想论集）》为厦门大学人文学院历史系盛嘉教授的文集，内容包括对梭罗、伏尔泰、托克维尔、汉娜·阿伦特、马克思、胡适、储安平、娜塔莉·戴维斯等人的研究。作者重点关注了美国历史研究的新趋向、新史学的魅力与困境、美国革命等话题。","盛嘉，厦门大学人文学院历史系教授，康奈尔大学东亚中心访问研究员，《人文国际》（Humanities International）执行主编。曾先后获辽宁大学物理学学士、美国布朗大学硕士、康奈尔大学硕士、博士。著有《越境的力量——历史思想论集》（2016），主编《学者的使命》（2012）、《误读的经典》（2015）和《忧虑与危机》（2016）。"),
(null,"9787506341271","苏菲的世界（挪威） 乔斯坦·贾德著","戈德尔，1952-著","中文","I533.45/5d2","北京 作家出版社 2007","一楼社科图书借阅室","2019-2-2",50,"52.00",528,"img/book/sufei.jpg",1,null,"14岁的少女苏菲不断接到一些极不寻常的来信，世界像谜团一般在她眼前展开。在一位神秘导师的指引下，苏菲开始思索，她运用少女天生的悟性与后天知识，企图解开这些谜团。然而，事实真相远比她所想的更怪异、更离奇…… 《苏菲的世界》，是智慧的世界，梦的世界。它将会唤醒每个人内心深处对生命的赞叹与对人生终极意义的关怀与好奇。","乔斯坦·贾德，挪威人，世界级著名畅销书作家。1952年出生于挪威首都奥斯陆，大学主修哲学、神学及文学。担任高中哲学教师多年，精通哲学、文学、教育心理学等多种学科。 1986年发表第一部作品后，乔斯坦·贾德以几乎每年一部作品的速度及作品的震撼力令全球瞩目，并由此迅速成为北欧具有世界影响力的文坛高手。 1990年，《纸牌的秘密》获挪威“儿童及青少年评论协会奖”及“文化科学事务部文学奖”。 1991-1995年，《苏菲的世界》分别获得挪威“宋雅·赫格曼那斯童书奖”、德国《时代周刊》文学奖、德国“青少年文学奖”，还曾荣获我国台湾省《联合报》“读书人最佳书奖”。全球销量超过3亿册，是全球项级畅销书。 1993年《苏菲的世界》、《纸牌的秘密》、《伊丽沙白的秘密》同时获得“学校图书馆员协会奖”。"),
(null,"9787506341271","潘家洵译易卜生戏剧","易卜生，1828-1906著","中文","I533.45/5d2","北京 作家出版社 2007","一楼社科图书借阅室","2019-2-2",50,"52.00",581,"img/book/yibushengxiju.jpg",1,null,"《潘家洵译易卜生戏剧(精)》收录了易卜生中期 创作阶段的四大“社会问题剧”：《社会支柱》、《 玩偶之家》、《群鬼》、《人民公敌》。易卜生的社 会问题剧立足生活实际，从多方面剖析社会问题，揭 露和批判的锋芒直指资产阶级社会的种种弊端，触及 到法律、宗教、道德乃至国家、政党、体制等各个领 域。","《潘家洵译易卜生戏剧(精)》这个新选本是从我国杰出的戏剧翻译家潘家洵移译的19世纪挪威作家易卜生（1828—1906）十八部剧作中精选出来的，入选的剧本包括《青年同盟》、《社会支柱》、《玩偶之家》、《群鬼》、《人民公敌》、《野鸭》、《罗斯莫庄》，共七部。这本选集作为“中国翻译家译丛”的优秀成果之一，新装问世，无疑适应了中挪戏剧文学会通并连接中外文化交流与时俱进的需要，对强化易卜生在中国的百年际遇乃至其戏剧“四重奏”（翻译、研究、演出、教学）的感染动力和审美意义，大有裨益。"),
(null,"9787309126051","跨文化背景下的北欧文学研究","孙建 主编","中文","I530.6/1","上海 复旦大学出版社 2017","一楼社科图书借阅室","2019-2-2",50,"52.00",239,"img/book/kuawenhua.jpg",1,null,"由孙建主编的《跨文化背景下的北欧文学研究》主要内容包括：跨文化语境下的易卜生主义；北欧现代女性主义文学意识与样式研究；安徒生童话故事中的性别意识塑性探讨；北欧文学作品电影改编研究；结构主义神话学视角下的北欧神话与中国神话比较研究；现代西方反理性主义思潮的北欧起源；北欧虚构叙事传统及其20世纪小说创作；戏剧文本与视觉艺术的和合。",null),
(null,"9787535495525","回忆找到我","张抗抗, 1950- 著","中文","I267/871q","武汉 长江文艺出版社 2017","一楼社科图书借阅室","2019-2-2",50,"52.00",117,"img/book/English.jpg",1,null,null,null),
(null,"9787221138873","特案组 毛浦光著","毛浦光著,","小说","I247.56/178","贵阳 贵州人民出版社 2017","三楼文学图书借阅室","2019-2-2",50,"52.00",328,"img/book/teanzu.jpg",1,null,"毛浦光著的《特案组》讲述了：菜鸟警察杨思琦昏迷中染指带血人皮陷入凶杀命案。特案组介入调查，“杀人魔瞳”“午夜尸咒”“黑狱惊魂”“东京诡谲”……一系列匪夷所思的案件接踵而至。抽丝剥茧的侦破之中竟然牵扯出一个古老而神秘的组织，他们执行着残忍的“仪式”却传承着千年的“文化”。 善与恶的角逐，信仰与邪念的纠缠，站在命运的岔路口，看杨思琦和特案组如何抉择。","毛浦光，网络笔名毛小光927。 90后帅小伙，新锐悬疑作家，黑岩阅读网签约作家，记者。 现已发表作品《我开阴店那些年》《特案组》《尸案组》等。《我开阴店那些年》有声小说点击已超1000万人次，《特案组》网络点击直逼千万。"),
(null,"9787560574370","审判（奥）卡夫卡著 宁瑛译","卡夫卡，1883-1924著","小说","I521.45/2h2","西安 西安交通大学出版社 2015","三楼文学图书借阅室","2019-2-2",50,"52.00",178,"img/book/shenpan.jpg",1,null,"《审判(全译本)》是卡夫卡最著名的长篇小说代 表作之一，是公认的世界文学名著。小说描写了主人 公K为自己证明清白、洗刷罪名尝试各种努力而最终 徒劳的故事。K本是一位本分的银行职员，在30岁生 日那天突然被捕，他自知无辜，与律师一起向法院申 诉，极力证明自己的清白。然而，这是官僚制度下的 司法机构对K的“审判”，法院是个藏污纳垢的肮脏 地方，整个社会如同一张无形的法网笼罩着他。他的 一切努力均告失败，在有罪推论的前提下，加之没有 任何人能证明他无罪，K最后在采石场被无情地处决 。","弗兰茨·卡夫卡，奥地利小说家，西方现代派文学大师。他在文学史上第一次深刻而逼真地书写了人的异化、孤独与危机感，以及世界的荒诞与非理性。他性情敏感、怯懦和孤僻，生前默默无闻，去世后作品引起了世界范围的震动，“卡夫卡热”经久不衰，对后世文学产生难以估量的影响。《审判(全译本)》是卡夫卡最为著名的长篇代表作，书写了西方现代国家机器的残酷和腐朽，以及普通人生存之中无处逃避的荒诞与恐惧，被称为“后世无法逾越，必读不可的小说经典。”"),
(null,"9787010166001","红杏出墙记","刘云若著","小说","I246.4/22a1(上)","北京 中国文史出版社 2017","三楼文学图书借阅室","2019-2-2",50,"52.00",775,"img/book/hongxing.jpg",1,null,"刘云若著的长篇小说《红杏出墙记》讲的是一个20世纪30年代发生在江南的故事。 报社工作的林白萍一日回家，发现妻子林芷华与好友边仲膺同床共枕，气愤之余他仍相信妻子绝非有意背叛，只是情难自已。他成全了他们，自己辞去工作，离家出走。他来到了另一座城市，当了柳家小姐柳如烟的家庭教师。清纯俏丽的如烟，整日困于家中闷都闷死了，如今见了男人，又是如此温文尔雅的男人，豆荚该有怎样的爆裂？桌子底下用脚夹白萍小腿的调皮，树丛中半遮半掩看白萍游泳的娇羞，直到以身相许。可是，林白萍还是放不下他的妻子，如烟也觉得他们毕竟是夫妻。于是当他回家看望妻子时，她怀着他的孩子当了尼姑。谁料白萍不愿拆散边仲膺和林芷华，而又爱上了芷华的朋友张疏敏。命运弄人。柳如烟的孩子生下来就死了，栖身的庙也被一伙士兵搞毁。逃难途中，她被张疏敏的哥哥救起。疏敏怕如烟抢走白萍，把她嫁给了一个糟老头。也许是唯恐多情累美人，白萍对如烟什么也没说。如烟决定杀了林白萍，结果——却误杀了张疏敏。爱恨如烟，狱中她被他紧紧搂在怀里……第二天笑着接受了死刑，临死前唱起心爱的童谣：少年，少年，去游荡；中年，中年，上学堂；老年，老年，做和尚……","刘云若（1903－1950），20世纪30年代天津著名的社会言情小说家。字渭贤，原名兆熊，又名刘存有。1903年生于天津一个军人家庭。1926年在津创办《北洋画报》并承担编辑工作；1930年底受邀任《天风报》副刊《黑旋风》主编，同年开始创作第一部长篇社会言情小说《春风回梦记》，刊出后大受欢迎。1937年开始闭门写作。1950年去世于家中，年仅47岁。代表作有《旧巷斜阳》《红杏出墙记》《酒眼灯唇录》《歌舞江山》《情海归帆》等。"),
(null,"9787568205306","新娘·女主人·十字架（挪威）温塞特著","温塞特，1882-1949著","小说","I533.45/4.1(1)","北京 北京理工大学出版社 2015","三楼文学图书借阅室","2019-2-2",50,"52.00",1266,"img/book/xinniang.jpg",1,null,null,"西格丽德·温塞特一生中最具有代表性的长篇小 说《劳伦斯之女克里斯汀》三部曲：《新娘女主人十 字架(克里斯汀的一生三部曲共3册1928年)(精)》共 分三卷：《新娘》、《女主人》和《十字架》。小说 以14世纪上半叶为时代背景，再现了中世纪的历史和 社会生活，同时生动地描述了女主人公热烈追求爱情 、追求幸福的一生及其悲剧性结局。小说以当时的几 个庄园和庄园中人们的日常生活为起笔，生动细腻地 描绘了王宫节日、政治阴谋、鼠疫肆虐、斗殴比赛、 流行艺术等，再现了中古时代挪威的自然风貌、历史 事件、风俗人情、文化传统，特别是普通人的日常生 活得到了绘声绘色的表现。"),
(null,"9787540479497","生命本就纯真 周国平著","周国平，1945-著","中文","I267/503bf","长沙 湖南文艺出版社 2017","一楼社科图书借阅室","2019-2-2",50,"52.00",305,"img/book/shengmingbenjiuchunzhen.jpg",1,null,null,null),
(null,"9787108055637","视差 美国与东亚的关系","卡明斯，1943-著","经济科学","D871.22/68","北京 生活·读书·新知三联书店2016","一楼社科图书借阅室","2019-2-2",50,"52.00",361,"img/book/shicha.jpg",1,null,"由美国布鲁斯·卡明斯所著、李茂增翻译的这本《视差（美国与东亚的关系）》更深远的目的则是既从东亚一方，也从美国一方探寻双方复杂的互动关系，尤其是对美国进行自我反思：不仅反思其对外政策，更反思其行为、假设，同时也反思跌宕起伏的情节赖以发生的美式舞台布景。　　20世纪90年代，美国发现自己身处于所有可能的世界中更好的世界里，它赢得了冷战的胜利，同时紧紧操纵着德国和日本。这绝非偶然，因为冷战包含着两套系统：一是遏制计划，既遏制敌人，也遏制盟友，以确保安全；一是霸权计划，以确保美国对主要工业竞争对手所必需的资源的操控。无论霸权计划，还是既结盟又遏制的系统，今天都不仅依然存在，甚至更加根深叶茂。 由美国布鲁斯·卡明斯所著、李茂增翻译的这本《视差（美国与东亚的关系）》的艰巨任务之一是证明：中国的历史非常独特，其扩张仅限于周边，而且手段多有节制。1949年之后，中国运用武力的范围同样没有超出历史上的区域，而且比过去表现得更为明智、更有成效。中国领导人可能依然会宣扬中国文化与生俱来的优越性，但这一传统同时也会告诚他们，专凭武力说话的霸权必有致命之弱点。同样，武力解决不了中国的深层问题——长期以来，西方一直占据着压倒性优努。要应对挑战，只能通过文明而非武力。","布鲁斯·卡明斯，美国芝加哥大学历史系著名教授，专长为朝鲜现代史、国际关系史以及东亚－美国关系史，朝鲜战争研究中修正学派的重要代表。本书是他在20世纪结束前对东亚地区历史和现实状况以及美国与东亚关系的眷智解读，至今仍具有启发意义。"),
(null,"9787010166001","话语与贸易摩擦","吴鹏 著","教育学","F752.7712/46","北京 人民出版社 2017","一楼社科图书借阅室","2019-2-2",50,"52.00",205,"img/book/huayumaoyi.jpg",1,null,"吴鹏著的《话语与贸易摩擦--以中美轮胎保案为例》从话语研究的视角出发，在文化话语研究理论和语用论辩学的基础上，结合国际贸易学的相关背景知识，构建了贸易摩擦话语研究的基本分析框架。为验证这一分析框架的可行性，本书对中美轮胎特保案中中美双方的话语互动进行了细致分析。个案分析显示，贸易摩擦不仅是经济、政治和法律等层面的问题，还与摩擦双方的话语互动密切相关；贸易摩擦话语既是一种论辩互动，又是一种跨文化交际，还是一种权力争斗方式；对贸易摩擦话语的深入研究至少可以采取两种有机相连的研究思路：第一是剖析、对比中外双方在贸易摩擦中对各自话语行为的布局与安排。第二是从微观论辩话语策略的角度阐释与对比中外双方在贸易摩擦中对话语策略及相应语言形式的操控。本书突破了贸易摩擦的传统研究模式，开拓了贸易摩擦研究的视野，同时也拓展了话语研究的视角，为话语研究和中外／国际贸易摩擦研究搭上了对话的桥梁。","吴鹏，博士、副教授，现为江苏大学外国语学院大学外语教学部主任、文化话语研究中心主任，兼任多个社会职务。长期从事于论辩理论、话语研究、批判性思维研究。2011年毕业于浙江大学语言学及应用语言学专业，获文学博士学位。2014年至今于荷兰莱顿大学论辩理论专业攻读哲学博士学位（第二博士学位）。2013-2014年于荷兰阿姆斯特丹大学人文学院担任客座研究员。2013-2015年，南京大学外国语学院博士后流动站，博士后。近五年来发表CSSCI索引期刊8篇，SSCI索引期刊3篇（均为第一作者）。近年来先后主持国家社科基金，9项省部级课题等。"),
(null,"9787516630624","暴怒","英德里达松","小说","I535.45/5e","北京 新华出版社 2017","三楼文学图书借阅室","2019-2-2",50,278,"52.00","img/book/baonu.jpg",1,null,"阿诺德·英德里达松著全哲君译的《暴怒/欧洲十大犯罪推理小说家作品系列》讲述了：他一直留神观察着符合他品味的女孩和少妇：最好不要超过30岁，且不要完全清醒。如果她们只是喝了一点而不是太醉，那就刚刚好。 她面容姣好，有一头深褐色的秀发，身材健美，穿着一条漂亮的半身裙，短袖T恤，披着披肩。她一边喝着玛格丽塔鸡尾酒，一边抽着烟。 两天后，侦探埃琳博格接到报案：一公寓里发现了一具年轻男子的尸体。他的裤子脱至脚踝，上身穿着一件女性T恤，上面沾满了血。旁边的桌子上放有一瓶迷奸药。 面对扑朔迷离的案情，她能否最终查出凶手?","阿诺德·英德里达松，冰岛作家，当代北欧重要的犯罪推理小说家之一，被英国《卫报》评为欧洲十大犯罪小说家之一。毕业于冰岛大学历史系，当过记者，业余写剧本。1997年开始发表推理小说。《瓮城谜案》《沉默的墓地》于2002年、2003年获得北欧犯罪推理小说高奖——玻璃钥匙奖，成为蝉联该奖的作家。《沉默的墓地》还于2005年荣获英国犯罪推理小说高奖——金匕首奖。目前，其系列推理小说已出版14本，成功地刻画出了一位极具侦探天赋且富有悲悯情怀的探长埃伦迪尔，已被翻译成24种语言在26个国家出版。"),
(null,"9787503471391","酒眼灯唇录","刘云若著","中文","I246.4/22g1","北京 中国文史出版社 2017","一楼社科图书借阅室","2019-2-2",50,"52.00",298,"img/book/jiuyandengchunlu.jpg",1,null,"刘云若著、辛绍兰校注的《酒眼灯唇录》一书在二十世纪三十年代末连载于报纸，民国二十九年即1940年出版。书中描写了包含封建遗老遗少，民国政要，文艺界的名伶，下层百姓等几十个人物，有的仅着墨几十字，上百字，但各个栩栩如生。不同身份，不同性格，不同年龄，不同心理的人物都被他细腻贴切地表达到位，彰显出作者丰富的生活阅历，体察观察入微的能力，一丝不苟的创作精神及深厚的文学功底。","刘云若（1903－1950），20世纪30年代天津著名的社会言情小说家。字渭贤，原名兆熊，又名刘存有。1903年生于天津一个军人家庭。1926年在津创办《北洋画报》并承担编辑工作；1930年底受邀任《天风报》副刊《黑旋风》主编，同年开始创作第一部长篇社会言情小说《春风回梦记》，刊出后大受欢迎。1937年开始闭门写作。1950年去世于家中，年仅47岁。代表作有《旧巷斜阳》《红杏出墙记》《酒眼灯唇录》《歌舞江山》《情海归帆》等。"),
(null,"9787100158022","杜甫诗选 典藏本","杜甫, 712-770 著","中文","I222.742/28z","北京 商务印书馆 2018","二楼新书阅览室","2019-3-2",50,"52.00",362,"img/nbook/nbook1.jpg",1,null,"杜甫是伟大的唐代诗人，在人格境界和诗歌造诣两方面都达到了超凡入圣的程度，被誉为“诗圣”。杜诗不仅是大唐王朝由盛转衰的时代画卷，而且是记录人们心底波澜的心灵史，被誉为“诗史”。杜诗鲜明地体现了以儒学为代表的中国传统价值观，具有陶冶心灵、启发人生的重大意义。现存杜诗1400余首，注本繁多，故阅读杜诗可从选本开始。 《杜甫诗选(古代诗词典藏本)》撰者莫砺锋、童强热爱杜甫，长期研读杜诗，颇多心得。在此选录杜甫的代表作255首，并以“注释”和“评赏”帮助读者理解、欣赏。读者阅后更加理解热爱杜甫，并有兴趣阅读杜甫全集，则撰者幸甚。","莫砺锋，江苏无锡人，1949年生，研究生学历，1984年在南京大学获文学博士学位。现为南京大学人文社会科学资深教授、南京大学中国诗学研究中心主任，兼任新闻出版署全国古籍整理与出版规划领导小组成员、教育部社会科学委员会委员、中国韵文学会理事、中国古代文学理论学会理事、中国唐代文学学会常务理事、中国杜甫研究会副会长、中国宋代文学学会会长。长期从事中国文学史、唐宋诗学、宋代理学与文学等领域的研究。学术著作有《江西诗派研究》《杜甫评传》《朱熹文学研究》《古典诗学的文化观照》《杜甫诗歌讲演录》《唐宋诗歌论集》《文学史沉思拾零》等。其他著作有《浮生琐忆》《莫砺锋诗话》《漫话东坡》《莫砺锋说唐诗》《莫砺锋评说白居易》《宁钝斋杂著》《诗意人生》等。主编教材有《中国文学史·宋代卷》。编译有《神女之探寻》。"),
(null,"9787510217692","检查研究（2018年第2辑）","尹吉 方晓琳 严正华 主编","中文","D926.3-55/1(2016,2) D926.3-55/1(2016,4) D926.3-55/1(2016,3) D926.3-55/1(2017,5) D926.3-55/1(2017,1) D926.3-55/1(2017,2) D926.3-55/1(2018,1)","中国检察出版社 2006-","二楼新书阅览室","2019-3-2",50,"52.00",99,"img/nbook/nbook2.jpg",1,null,"《检察研究(2018年第2辑)》由江苏省人民检察院主办，江苏省检察官协会组织编写，由严正华主编，坚持以推动完善和发展社会主义检察制度为宗旨，坚持理论联系实际，坚持应用理论研究和基础理论研究并重，主要刊载检察实务、理论、改革等方面的调研文章。",null),
(null,"9787301298824","Sping 5 开发大全","柳伟卫 著","计算机","TP312JA/552","北京 北京大学出版社 2018","二楼新书阅览室","2019-3-2",50,"52.00",600,"img/nbook/nbook3.jpg",1,null,"自Spring诞生以来，以 Spring 技术栈为核心的企业级应用开发方式深入人心，已然成为Java EE开发的最佳实践。随着Spring 5版本的发布，Spring自身也发生了巨大变革。本书力求全面介绍Spring框架，涵盖了Spring核心、测试、数据访问、集成、Web开发、微服务等所有相关内容。同时，本书基于Spring 5最新版本来编写，除了涉及Spring 5版本的新特性之外，还介绍了 REST 服务、响应式 Web 开发、微服务设计、Spring Boot、Spring Cloud 等方面的前瞻技术。而且除了讲解Spring的理论知识外，还在每个知识点上辅以大量的代码案例，理论联系实际，可操作性强。",null),
(null,"9787115438140","计算机思维与计算文化(中文)","王永全 单美静 主编","计算机","TP3/520","北京 人民邮电出版社 2016","二楼新书阅览室","2019-3-2",50,"52.00",227,"img/nbook/nbook4.jpg",1,null,"王永全、单美静主编的《计算思维与计算文化》以提升知识和技能、素养和能力为目标，兼顾广度和深度，融多学科交叉领域知识为一体，对计算思维与计算文化涉及的基本概念和知识、基本技能和应用等相关内容进行了较为全面系统地阐述和分析。主要包括：计算思维概述、信息与信息处理技术、数学与数学模型、计算与计算方法、计算文化、程序设计思想与算法基础、网络与网络通信、互联网与新型网络、数据分析与科学决策、人工智能与智能计算、案例与实践等知识和内容。 本书不仅可作为高等院校各专业，特别是非计算机专业开设《计算思维与计算文化》等相关课程的参考书，同时也可供社会各领域工作者了解和学习计算思维与计算文化等相关知识参考或使用。",null),
(null,"9787540782955","论语心要别裁参译下(中文)","赵强 译注","中文","B222.2/49(上)","桂林 漓江出版社 2017","二楼新书阅览室","2019-3-2",50,"52.00",438,"img/nbook/nbook5.jpg",1,null,"《论语》是记载孔子言语行事的儒家经典，其影响遍及政治、文化、教育、伦理等各个领域。台湾地区著名学者南怀瑾先生以渊博的知识，旁征博引，结合孔子在每一章句讲话的环境、语气解读《论语》，使得该书读起来活泼、有生气。《论语心要》编委怀师文化编委会以弘扬传统文化为宗旨，以探寻南师精神理念为己任，依照南师心愿编辑了《论语心要——“别裁”参译》2，收集了《论语》后十篇内容。","赵强，原太湖大学堂资深校长，得遇南师感应教化，感悟人生。现任“怀师文化编委会”主编，编辑出版了南怀瑾纪念文集《人道之路》《师道》《教育与人性》等，赢得了广大教师、家长、社会各界及有关领导的赞誉和好评。 “怀师文化”以弘扬中国传统文化为宗旨，以深入探究南师的文化精神和教育理念为己任，依照南师心愿，致力于传播中国传统文化，推动公益性“中国传统文化教育实验基地”建设，继续南师“教育实验”的实践与推广。 教育理想：创建以中国传统文化为根基，融合东西方文化之精华的、世界一流“国际化”学校（学院）。 教育理念：关注人性，尊重生命，去发现那丰富多彩的、充满阳光和活力的生命世界。为新时代培养具有中国文化底蕴和国际视野的社会主义建设者和接班人。"),
(null,"9787030527028","NBIoT技术详解等","解运洲 著","计算机","TP393.409/48","北京 科学出版社 2017","二楼新书阅览室","2019-3-2",50,"52.00",327,"img/nbook/nbook6.jpg",1,null,"NB—IoT技术的诞生承载着全球电信运营商对物联网生态体系的变革。NB—IoT技术具有广覆盖、低功耗、低成本、大连接等特点，定位于运营商级、基于授权频谱的低速率物联网市场，可被广泛应用在不同的物联网垂直应用领域，并就此开启智能连接的新时代。 NB—IoT产业已经是全球化趋势，受到了全球物联网产业链的普遍关注。解运洲著的《NB-IoT技术详解与行业应用(物联网工程专业系列教材)》的目的是让读者更好地理解NB—IoT技术，掌握NB—IoT全产业链体系架构，并清晰认识NB—IoT适用的物联网垂直应用领域。 本书适合NB—IoT产业链从业人员从全局角度掌握NB—IoT技术带来的突破性革命，适合高等院校物联网工程专业作为教材使用，也适合对物联网感兴趣的读者参考阅读。","解运洲：中国NB—IOT产业联盟发起人。毕业于西安电子科技大学通信工程学院，深耕数据通信、无线通信、M2M通信、移动支付、智慧城市等领域。从2010年开始从事物联网行业的产业研究和咨询服务。熟悉物联网产业链发展现状和发展趋势。掌握多项物联网垂直应用领域的解决方案。NB—10T技术的积极推广者，擅长组织物联网领域的生态大会和技术研讨，拥有物联网领域的广泛人脉，积极营造政府部门、运营商、物联网企业等共生共荣的产业链生态圈。"),
(null,"9787509646373","兼论中国银行业的顺周期效应","刘鹏 著","经济科学","F832/313","北京 经济管理出版社 2016","二楼新书阅览室","2019-3-2",50,"52.00",198,"img/nbook/nbook7.jpg",1,null,"2008年的金融危机被称为“二战”后最具破坏性的浩劫。金融的顺周期性对危机的加深和影响无疑是显著的。由刘鹏著的《监管视角下的金融顺周期性研究——兼论中国银行业的顺周期效应》聚焦于金融的顺周期性以及金融监管对金融顺周期性的影响，考察经济周期波动与金融顺周期性的内在关联，剖析金融监管体系对金融顺周期性的深层次影响。从监管视角出发，以经济学理论为基础，重点研究中国问题。以中国银行业监管为例分析了《巴塞尔资本协议Ⅲ》实施前金融监管体系对金融顺周期性的作用与影响，并对《巴塞尔资本协议Ⅲ》实施后中国银行业监管的顺周期效应进行了研究和思考。在借鉴成功实践经验和理论研究成果的基础上，结合中国实际给出了缓释金融顺周期性的一些政策建议。","刘鹏，山西省阳泉市人。2012年毕业于中国人民大学经济学院，获经济学博士学位。2012年起，在国家信息中心经济预测部财政金融研究室工作，主要研究方向为金融监管、货币政策、宏观金融研究等。在《国际贸易问题》、《教学与研究》、《经济理论与经济管理》、《中国物价》、《上海证券报》等全国重点学术期刊和报刊上发表论文近20篇。"),
(null,"9787030546104","功能视野下我国职业教育...","董显辉 著","教育学","G719.2/46","北京 科学出版社 2017","二楼新书阅览室","2019-3-2",50,"52.00",177,"img/nbook/nbook8.jpg",1,null,"董显辉著的《功能视野下我国职业教育层次结构的调整》以结构功能主义为视角，运用历史研究、比较研究、调查研究等方法，对职业教育层次的本质、结构和功能的关系和合理性运行机制进行了分析研究：一是从职业教育层次结构的历史演变，分析各阶段职业教育层次结构的变化特点和原因，了解职业教育层次结构变化的规律；二是通过对发达国家职业教育层次结构的比较，分析发达国家职业教育层次结构变化的异同，了解发达国家职业教育层次结构的现状和职业教育层次间的衔接途径；三是通过对职业教育层次结构与功能的研究，了解职业教育层次结构的构成因素、职业教育层次结构的特点、影响职业教育层次结构调整的因素、职业教育层次结构调整的类型和职业教育层次结构合理性表现等理论；四是分析我国职业教育层次现状是否符合职业教育自身发展的规律和社会经济发展的客观规律，以及能否满足学生终身学习的意向；五是依据职业教育层次结构的合理性，对职业教育各层次的培养目标、规模结构及各层次间衔接方式提出优化建议。 本书可供教育管理职能部门、职业院校、教育科研部门等管理人员、职业教育教师及科研人员参考。",null),
(null,"9787030507259","英语非人称构式的认知研究...","马应聪 著","英文","H314/486","北京 科学出版社 2017","二楼新书阅览室","2019-3-2",50,"52.00",240,"img/nbook/nbook9.jpg",1,null,"马应聪著的《英语非人称构式的认知研究》采用定性和定量研究相结合的方法，在认知语言学相关理论的指导下建构了认知参照场域控制模型，并以该模型为理论框架系统研究了英语非人称构式对述渭的语义制约及其意义建构问题。研究表明，英语非人称构式是一类抽象认知参照点构式，反映人类的一种高级认知能力。研究以真实语料为支撑，为英语非人称构式提供了新的研究视角。 本书的读者对象是英语语言学专业的硕士生和博士生，亦可为认知语言学的相关研究提供借鉴。",null),
(null,"9787030507259","Objective-C程序设计案例教程","黑马程序员 编著","教育学","H314/486","北京 科学出版社 2017","二楼新书阅览室","2019-3-2",50,"52.00",240,"img/nbook/nbook10.jpg",1,null,"马应聪著的《英语非人称构式的认知研究》采用定性和定量研究相结合的方法，在认知语言学相关理论的指导下建构了认知参照场域控制模型，并以该模型为理论框架系统研究了英语非人称构式对述渭的语义制约及其意义建构问题。研究表明，英语非人称构式是一类抽象认知参照点构式，反映人类的一种高级认知能力。研究以真实语料为支撑，为英语非人称构式提供了新的研究视角。 本书的读者对象是英语语言学专业的硕士生和博士生，亦可为认知语言学的相关研究提供借鉴。",null),
(null,"9787310055081","读《聊斋志异》漫想走笔","章敬一 著","教育学","I207.419/251","天津 南开大学出版社 2017","二楼新书阅览室","2019-4-2",50,"52.00",174,"img/nbook/nbook11.jpg",1,null,"《聊斋志异》是我国清代著名小说家蒲松龄创作的文言小说短篇集，章敬一著的《读聊斋志异漫想走笔》以铸雪斋抄本《聊斋》为研究版本，研读文本，畅谈古今，以个人的人生经历以及与蒲翁同为知识分子的通感，不拘一格，漫想走笔。作者在书中与读者相互交流，探讨分析了《聊斋志异》与时代的关系，蒲翁与时代、故事与时代、人物与时代的关系。作者还用很大精力研究了《聊斋志异》作品中的传统观念、人物的爱恨纠葛，并与国内外几部相关著作做对比，展现了《聊斋志异》独特的魅力，以作者特有的笔触评述了《聊斋志异》的文字运用和思想内涵。",null),
(null,"9787302483915","C语言程序设计","孙海洋 编著","计算机","TP312C/354","北京 清华大学出版社 2018","二楼新书阅览室","2019-4-2",50,"52.00",381,"img/nbook/nbook12.jpg",1,null,"孙海洋编著的《C语言程序设计(21世纪普通高校计算机公共课程规划教材)》共分为11章，前5章主要介绍了C语言的基本语法、基本数据类型、运算符及表达式和三大流程结构，第6章引入批量处理数据的类型——数组。本教材从第7章开始对函数、指针、自定义类型等C语言的精髓和核心进行了重点介绍。第10章输入和输出也是综合性且实用性较强的重点章节，第11章预处理和位操作在编程中是比较实用的，例如，解决了头文件重复包含等问题及相关位操作。 全书提供了大量应用实例及源代码，每节均对应复习思考题，便于对所学知识及时巩固提高。每章有大量精心设计的习题，均是在例题及复习思考题基础上的提升，且按章节按知识点划分。每章小结均以表格的形式列出本章的重点、难点及易错点，结构清晰，便于读者学习把握。 本教材所有例题、习题均严格遵守业界较通用的编程规范，设计结构合理，思路清晰，注重程序的可读性和健壮性。 本书适合作为高等院校计算机、软件工程、电子、通信、自动化等专业高年级本科生的教材，同时也可作为计算机等级考试的参考用书。",null),
(null,"9787101121711","陟彼景山十一位中外学者访谈录精","戴燕 主编","教育学","K820.7/317","北京 中华书局 2017","二楼新书阅览室","2019-4-2",50,"52.00",207,"img/nbook/nbook13.jpg",1,null,"一代有一代之学术、一代有一代之思想。《陟彼景山（十一位中外学者访谈录）》通过戴燕教授对何兆武、李学勤、章培恒、王水照、裘锡圭等十一位从抗战到当下的老一辈中外学人的访谈，使我们了解了那个即将过去的时代所发生过的历史，以及那一代历史中的学人的思考与抉择——他们的政治关怀和学术理想是什么？在巨大的社会变动中，他们如何选择自己的人生道路？在各自的专业领域，他们又是如何思考历史与未来，如何承上启下的？ 一个个学者，体现了一代的学术、思想的风气。这些学者，可以说是这个时代精神的脊梁，是学术文化的灵魂。鉴往知来，当今学人只有充分了解上一辈学人的学术及思想，才能承上启下，继往开来。在这个意义上说，本书也是前辈学者的学人心史。","戴燕，1982年北京大学毕业，1989年中国社会科学院硕士研究生毕业，先后任职于中华书局、中国社会科学院文学所，现为复旦大学教授。"),
(null,"9787520300773","当代文学散点透视历史与现场丛书","巫晓燕, 1973- 著","中文","I206.7/1108a","北京 中国社会科学出版社 2017","二楼新书阅览室","2019-4-2",50,"52.00",355,"img/nbook/nbook14.jpg",1,null,"所谓透视，其实首先包含了著者的立足点、视角或“期待意图”等。其次，也是由中国当代文学的复杂性所决定的。因此巫晓燕著的《当代文学散点透视》以多重文化视角，以文化研究、美学探查、精神分析、叙事细读等方式，对当代工业文学创作、城市文学创作、70年代文学的民间形态、当代作家创作经验的复杂性等问题进行了探讨，具有一定的知识性和学理性。本书逻辑严谨，文字朴实。其中大多数篇章都已经在《当代作家评论》《文艺争鸣》等核心学术刊物上面发表，有些被转载引用，具有一定的学术反响。","巫晓燕，女，1973年出生，祖籍四川，2005年毕业于山东师范大学中国现当代文学专业，文学博士，教授，硕士研究生导师。中国当代文学学会会员、辽宁省理论家协会会员、辽宁省鲁迅研究会秘书长。 主要从事中国当代文学与文化研究。一直承担研究生、本科生《中国现代文学史》《中国现当代文学作品导读》《中国现代文学思潮》《中国现代文学批评史》等课程的教学工作。 自2002年以来在CISSCI、中文核心期刊发表论文数十篇，其中有的被《新华文摘》要点转摘，有的获得省市级奖励。独立完成著作2部，与人合著著作2部，参编著作多部，承担省级重大课题、一般课题十余项，参与国家级、部级以上课题多项。"),
(null,"9787308162104","企业社会责任成本...","熊明华 著","经济科学","F279.243/369","杭州 浙江大学出版社 2016","二楼新书阅览室","2019-4-2",50,"52.00",241,"img/nbook/nbook15.jpg",1,null,"熊明华著的《企业社会责任成本与企业效益的关系研究(基于浙江省中小企业的实证分析)》共分七章，第一章对企业社会责任相关的国内外理论文献进行了梳理，为下文的研究提供了有力的理论支持和思想指导。第二章、第三章分析了浙江省中小企业整体的发展变化态势。通过对312家浙江中小企业的调查，分析了这些企业对社会责任的认知状况，以及企业在推进社会责任实践方面所做的工作。第四章从《劳动合同法》的角度对比分析了该法实施前后企业的发展变化。第五章从理论上分析了企业社会责任成本的构成及影响因素，以及企业履行社会责任对人力资源成本的影响。第六章应用本量利模型，结合对浙江中小企业的调查，分析了浙江中小企业社会责任成本与企业效益之间的关系，以及企业效益对社会责任成本的敏感性。第七章对前几部分的研究进行了总结。",null),
(null,"9787300249728","公司治理第5版经济科学译丛","Monks, Robert A. G.","经济科学","F276.6/276.2","北京 中国人民大学出版社 2017","二楼新书阅览室","2019-5-2",50,"52.00",409,"img/nbook/nbook16.jpg",1,null,"在复杂动荡的商业环境下，很有必要让经济与管理专业的学生们了解高管、董事会中的董事、股东与投资者之间的关系。 这本公司治理领域的权威著作为阅读它的每位学生和商务专家提供了一个必不可少的指南，由罗伯特·A.G.蒙克斯、尼尔·米诺著的《公司治理(第5版)/经济科学译丛》共分五大部分，即公司、股东、董事、管理者与跨国公司治理，全方位地帮助读者掌握那些基本的公司治理概念。 本书是这本经典著作的第五版，包括了更多的思考题；精辟地分析了最新的企业失败案例和有关争议。本书的最大特色是以金融危机中的机构和企业为例，分析了多家知名公司治理失败的原因(包括雷曼兄弟、通用汽车、美国运通、时代华纳、旧M和英国石油公司等)。","罗伯特.A.G.蒙克斯(Robert A.G.Monks)： 国际治理标准公司的创始人，该公司是一个独立的研究机构，致力于公司治理的研究。蒙克斯和尼尔·米诺原来是透镜基金的主管和机构股东服务公司的高级职员。蒙克斯与米诺还合作出版过另外两本书——《权力和责任》和《监督监督人》。"),
(null,"9787020141739","南方邮航(精)","圣埃克苏佩里","英文","I565.45/18i","北京 人民文学出版社 2018","二楼新书阅览室","2019-5-2",50,"52.00",119,"img/nbook/nbook17.jpg",1,null,"1927年春天，圣埃克苏佩里至摩洛哥塔尔法亚附近的朱比角当中途站站长，也就是在挨着西班牙要塞盖的一间木屋内，做过路飞机的联络工作。他一无自卫手段，二无人身保障，在沙漠与天空、摩尔人与西班牙人中间，度过了十八个月。身居荒凉的沙漠，接触猜疑的异族，分享同志的水、面包和“最后”时刻，使他发现和体验到人的情意与交流是人生的根本。也就是在朱比角这间简陋的木屋内，圣埃克苏佩里完成了他的第一部小说——《南方邮航》。小说描写飞行员贝尼斯徘徊于感情与行动之间的矛盾心理，也是影射作者与维尔莫兰那段失败的罗曼史。本书不仅是圣埃克苏佩里的开山之作，也是他的小说中*具浪漫色彩的一部。","马振骋，1934年生于上海，法语文学翻译家，首届“傅雷翻译出版奖”得主。先后翻译了圣埃克苏佩里、波伏娃、高乃依、萨巴蒂埃、克洛德·西蒙、纪德、蒙田、杜拉斯、米兰·昆德拉、洛朗·戈伐等法国重要文学家的作品。著有散文集《巴黎，人比香水神秘》《镜子中的洛可可》《我眼中残缺的法兰西》《误读的浪漫：关于艺术家、书籍与巴黎》等。译著《蒙田随笔全集》(全三卷)2009年荣获首届“傅雷翻译出版奖”，并被评为“2009年度十大好书”。"),
(null,"9787561386651","溯水而上汉水文化寻访之旅","张惠 著","中文","K296/12","西安 陕西师范大学出版总社 2016","二楼新书阅览室","2019-5-2",50,"52.00",250,"img/nbook/nbook18.jpg",1,null,"《溯水而上(汉水文化寻访之旅)》记录了作者张惠沿汉江溯水而上的行走历程，追寻与探索汉水文化的身影。在一场对文化追根溯源的奇妙旅程中，读者随作者一起抵达普通旅行者所不能抵达的幽深之地，碰触完全不同的人生、生活与心灵。全书分为下游、中游与上游三个部分，作者以一个画家的视角，通过对汉水流域的建筑、人文以及人们日常生活等各个方面细致入微的观察和体会，用轻松优美的文字，带读者领略一场别有风情的汉水文化之旅。","张惠，女，陕西汉中人，艺术硕士，民进党人士。现为陕西理工大学艺术学院美术系教师，从事美术理论及中国画研究、教学工作。相关专业论文在《美与时代》《艺术评论》《西北美术》等专业核心期刊发表。绘画作品入选陕西青年女画家展、“高原高原”西部中国画展等。"),
(null,"9787510851315","儿童分析的故事克莱因文集","克莱因","教育学","B844.1/93a2","北京 九州出版社 2017","二楼新书阅览室","2019-5-2",50,"52.00",585,"img/nbook/nbook19.jpg",1,null,"《儿童分析的故事》这本富含生命力的作品，在梅兰妮·克莱因的著作中占有特殊的地位，其中详述一名十岁男孩长达四个月的分析历程，并对当中的画作、游戏、语言联想和梦境作出精辟的诠释。本书说明了她在分析当时的理论概念，并尽可能忠实地呈现实务工作与理论观点。文中更揭露了许多崭新的想法，克莱因的这部最后著作，可以说是深具创造性的一部代表作，更是探究儿童精神分析技巧不可多得的必备书籍。","梅兰妮·克莱因（Melanie Klein，1882—1960），著名精神分析学家，被称为“客体关系之母”，儿童精神分析研究的先驱。在其意义深远而富于开创性的工作中，她打开了理解婴儿早期的心理历程的途径，这些早期心理历程支配着婴儿的内心活动。她的理论将精神分析关注的重点，从之前的“驱力”转到了“关系”上。她也被誉为继弗洛伊德之后，对精神分析理论发展极具贡献的领军人物之一。"),
(null,"9787512132948","产业空心化问题研究","李孟刚, 1967- 著","经济科学","F269.24/98","北京 北京交通大学出版社 2017","二楼新书阅览室","2019-5-2",50,"52.00",137,"img/nbook/nbook20.jpg",1,null,"《产业空心化问题研究(国家产业安全理论与预警机制)(精)》由李孟刚著。在一国(或地区)产业结构的升级过程中，如果新旧产业衔接不好，就会不同程度地出现产业空心化问题。当前，我国正处于产业结构调整和升级的关键时期，面临贸易摩擦日益加剧、区域经济一体化进程加快、国内传统产业产能过剩，以及国内产业结构调整等复杂的经济环境，与日本20多年前发生产业空心化的背景极其相似。因此，全面阐释产业空心化问题，研究全球已发生的产业空心化，对预防我国产业空心化的发生，实现我国产业结构的升级，保持我国经济的平稳发展，具有十分重要的意义。",null);

/* 第二次插入全部书籍的数据 */


/* 一楼社科图书借阅室、二楼新书阅览室 */
/* 中文、英文、教育学、经济科学、计算机 */


/* 新书表 */
CREATE TABLE newbook(
  nid INT PRIMARY KEY AUTO_INCREMENT,  #id
  ISBN VARCHAR(20),	    #查书号
  title VARCHAR(20),		#标题
  author VARCHAR(20),	  #作者
  classify VARCHAR(10),	#分类
  searchid VARCHAR(20),	#索书号
  press VARCHAR(20),	  #出版社
  address VARCHAR(30),  #地址
  entry_time DATE,		  #入库时间
  stock SMALLINT,		    #库存
  price DECIMAL(7,2),	  #价格
  page SMALLINT,        #页数
  pic VARCHAR(50),		  #图片
  state BOOL DEFAULT 1,	#状态
  remark VARCHAR(200),	#备注
  content_intro VARCHAR(500), #内容简介
	author_intro VARCHAR(200)  #作者简介
);



/* 第一次插入新书的数据 */
INSERT INTO newbook VALUES
(null,"9787100158022","杜甫诗选 典藏本","杜甫, 712-770 著","中文","I222.742/28z","北京 商务印书馆 2018","二楼新书阅览室","2019-3-2",50,"52.00",362,"img/nbook/nbook1.jpg",1,null,"杜甫是伟大的唐代诗人，在人格境界和诗歌造诣两方面都达到了超凡入圣的程度，被誉为“诗圣”。杜诗不仅是大唐王朝由盛转衰的时代画卷，而且是记录人们心底波澜的心灵史，被誉为“诗史”。杜诗鲜明地体现了以儒学为代表的中国传统价值观，具有陶冶心灵、启发人生的重大意义。现存杜诗1400余首，注本繁多，故阅读杜诗可从选本开始。 《杜甫诗选(古代诗词典藏本)》撰者莫砺锋、童强热爱杜甫，长期研读杜诗，颇多心得。在此选录杜甫的代表作255首，并以“注释”和“评赏”帮助读者理解、欣赏。读者阅后更加理解热爱杜甫，并有兴趣阅读杜甫全集，则撰者幸甚。","莫砺锋，江苏无锡人，1949年生，研究生学历，1984年在南京大学获文学博士学位。现为南京大学人文社会科学资深教授、南京大学中国诗学研究中心主任，兼任新闻出版署全国古籍整理与出版规划领导小组成员、教育部社会科学委员会委员、中国韵文学会理事、中国古代文学理论学会理事、中国唐代文学学会常务理事、中国杜甫研究会副会长、中国宋代文学学会会长。长期从事中国文学史、唐宋诗学、宋代理学与文学等领域的研究。学术著作有《江西诗派研究》《杜甫评传》《朱熹文学研究》《古典诗学的文化观照》《杜甫诗歌讲演录》《唐宋诗歌论集》《文学史沉思拾零》等。其他著作有《浮生琐忆》《莫砺锋诗话》《漫话东坡》《莫砺锋说唐诗》《莫砺锋评说白居易》《宁钝斋杂著》《诗意人生》等。主编教材有《中国文学史·宋代卷》。编译有《神女之探寻》。"),
(null,"9787510217692","检查研究（2018年第2辑）","尹吉 方晓琳 严正华 主编","中文","D926.3-55/1(2016,2) D926.3-55/1(2016,4) D926.3-55/1(2016,3) D926.3-55/1(2017,5) D926.3-55/1(2017,1) D926.3-55/1(2017,2) D926.3-55/1(2018,1)","中国检察出版社 2006-","二楼新书阅览室","2019-3-2",50,"52.00",99,"img/nbook/nbook2.jpg",1,null,"《检察研究(2018年第2辑)》由江苏省人民检察院主办，江苏省检察官协会组织编写，由严正华主编，坚持以推动完善和发展社会主义检察制度为宗旨，坚持理论联系实际，坚持应用理论研究和基础理论研究并重，主要刊载检察实务、理论、改革等方面的调研文章。",null),
(null,"9787301298824","Sping 5 开发大全","柳伟卫 著","计算机","TP312JA/552","北京 北京大学出版社 2018","二楼新书阅览室","2019-3-2",50,"52.00",600,"img/nbook/nbook3.jpg",1,null,"自Spring诞生以来，以 Spring 技术栈为核心的企业级应用开发方式深入人心，已然成为Java EE开发的最佳实践。随着Spring 5版本的发布，Spring自身也发生了巨大变革。本书力求全面介绍Spring框架，涵盖了Spring核心、测试、数据访问、集成、Web开发、微服务等所有相关内容。同时，本书基于Spring 5最新版本来编写，除了涉及Spring 5版本的新特性之外，还介绍了 REST 服务、响应式 Web 开发、微服务设计、Spring Boot、Spring Cloud 等方面的前瞻技术。而且除了讲解Spring的理论知识外，还在每个知识点上辅以大量的代码案例，理论联系实际，可操作性强。",null),
(null,"9787115438140","计算机思维与计算文化(中文)","王永全 单美静 主编","计算机","TP3/520","北京 人民邮电出版社 2016","二楼新书阅览室","2019-3-2",50,"52.00",227,"img/nbook/nbook4.jpg",1,null,"王永全、单美静主编的《计算思维与计算文化》以提升知识和技能、素养和能力为目标，兼顾广度和深度，融多学科交叉领域知识为一体，对计算思维与计算文化涉及的基本概念和知识、基本技能和应用等相关内容进行了较为全面系统地阐述和分析。主要包括：计算思维概述、信息与信息处理技术、数学与数学模型、计算与计算方法、计算文化、程序设计思想与算法基础、网络与网络通信、互联网与新型网络、数据分析与科学决策、人工智能与智能计算、案例与实践等知识和内容。 本书不仅可作为高等院校各专业，特别是非计算机专业开设《计算思维与计算文化》等相关课程的参考书，同时也可供社会各领域工作者了解和学习计算思维与计算文化等相关知识参考或使用。",null),
(null,"9787540782955","论语心要别裁参译下(中文)","赵强 译注","中文","B222.2/49(上)","桂林 漓江出版社 2017","二楼新书阅览室","2019-3-2",50,"52.00",438,"img/nbook/nbook5.jpg",1,null,"《论语》是记载孔子言语行事的儒家经典，其影响遍及政治、文化、教育、伦理等各个领域。台湾地区著名学者南怀瑾先生以渊博的知识，旁征博引，结合孔子在每一章句讲话的环境、语气解读《论语》，使得该书读起来活泼、有生气。《论语心要》编委怀师文化编委会以弘扬传统文化为宗旨，以探寻南师精神理念为己任，依照南师心愿编辑了《论语心要——“别裁”参译》2，收集了《论语》后十篇内容。","赵强，原太湖大学堂资深校长，得遇南师感应教化，感悟人生。现任“怀师文化编委会”主编，编辑出版了南怀瑾纪念文集《人道之路》《师道》《教育与人性》等，赢得了广大教师、家长、社会各界及有关领导的赞誉和好评。 “怀师文化”以弘扬中国传统文化为宗旨，以深入探究南师的文化精神和教育理念为己任，依照南师心愿，致力于传播中国传统文化，推动公益性“中国传统文化教育实验基地”建设，继续南师“教育实验”的实践与推广。 教育理想：创建以中国传统文化为根基，融合东西方文化之精华的、世界一流“国际化”学校（学院）。 教育理念：关注人性，尊重生命，去发现那丰富多彩的、充满阳光和活力的生命世界。为新时代培养具有中国文化底蕴和国际视野的社会主义建设者和接班人。"),
(null,"9787030527028","NBIoT技术详解等","解运洲 著","计算机","TP393.409/48","北京 科学出版社 2017","二楼新书阅览室","2019-3-2",50,"52.00",327,"img/nbook/nbook6.jpg",1,null,"NB—IoT技术的诞生承载着全球电信运营商对物联网生态体系的变革。NB—IoT技术具有广覆盖、低功耗、低成本、大连接等特点，定位于运营商级、基于授权频谱的低速率物联网市场，可被广泛应用在不同的物联网垂直应用领域，并就此开启智能连接的新时代。 NB—IoT产业已经是全球化趋势，受到了全球物联网产业链的普遍关注。解运洲著的《NB-IoT技术详解与行业应用(物联网工程专业系列教材)》的目的是让读者更好地理解NB—IoT技术，掌握NB—IoT全产业链体系架构，并清晰认识NB—IoT适用的物联网垂直应用领域。 本书适合NB—IoT产业链从业人员从全局角度掌握NB—IoT技术带来的突破性革命，适合高等院校物联网工程专业作为教材使用，也适合对物联网感兴趣的读者参考阅读。","解运洲：中国NB—IOT产业联盟发起人。毕业于西安电子科技大学通信工程学院，深耕数据通信、无线通信、M2M通信、移动支付、智慧城市等领域。从2010年开始从事物联网行业的产业研究和咨询服务。熟悉物联网产业链发展现状和发展趋势。掌握多项物联网垂直应用领域的解决方案。NB—10T技术的积极推广者，擅长组织物联网领域的生态大会和技术研讨，拥有物联网领域的广泛人脉，积极营造政府部门、运营商、物联网企业等共生共荣的产业链生态圈。"),
(null,"9787509646373","兼论中国银行业的顺周期效应","刘鹏 著","经济科学","F832/313","北京 经济管理出版社 2016","二楼新书阅览室","2019-3-2",50,"52.00",198,"img/nbook/nbook7.jpg",1,null,"2008年的金融危机被称为“二战”后最具破坏性的浩劫。金融的顺周期性对危机的加深和影响无疑是显著的。由刘鹏著的《监管视角下的金融顺周期性研究——兼论中国银行业的顺周期效应》聚焦于金融的顺周期性以及金融监管对金融顺周期性的影响，考察经济周期波动与金融顺周期性的内在关联，剖析金融监管体系对金融顺周期性的深层次影响。从监管视角出发，以经济学理论为基础，重点研究中国问题。以中国银行业监管为例分析了《巴塞尔资本协议Ⅲ》实施前金融监管体系对金融顺周期性的作用与影响，并对《巴塞尔资本协议Ⅲ》实施后中国银行业监管的顺周期效应进行了研究和思考。在借鉴成功实践经验和理论研究成果的基础上，结合中国实际给出了缓释金融顺周期性的一些政策建议。","刘鹏，山西省阳泉市人。2012年毕业于中国人民大学经济学院，获经济学博士学位。2012年起，在国家信息中心经济预测部财政金融研究室工作，主要研究方向为金融监管、货币政策、宏观金融研究等。在《国际贸易问题》、《教学与研究》、《经济理论与经济管理》、《中国物价》、《上海证券报》等全国重点学术期刊和报刊上发表论文近20篇。"),
(null,"9787030546104","功能视野下我国职业教育...","董显辉 著","教育学","G719.2/46","北京 科学出版社 2017","二楼新书阅览室","2019-3-2",50,"52.00",177,"img/nbook/nbook8.jpg",1,null,"董显辉著的《功能视野下我国职业教育层次结构的调整》以结构功能主义为视角，运用历史研究、比较研究、调查研究等方法，对职业教育层次的本质、结构和功能的关系和合理性运行机制进行了分析研究：一是从职业教育层次结构的历史演变，分析各阶段职业教育层次结构的变化特点和原因，了解职业教育层次结构变化的规律；二是通过对发达国家职业教育层次结构的比较，分析发达国家职业教育层次结构变化的异同，了解发达国家职业教育层次结构的现状和职业教育层次间的衔接途径；三是通过对职业教育层次结构与功能的研究，了解职业教育层次结构的构成因素、职业教育层次结构的特点、影响职业教育层次结构调整的因素、职业教育层次结构调整的类型和职业教育层次结构合理性表现等理论；四是分析我国职业教育层次现状是否符合职业教育自身发展的规律和社会经济发展的客观规律，以及能否满足学生终身学习的意向；五是依据职业教育层次结构的合理性，对职业教育各层次的培养目标、规模结构及各层次间衔接方式提出优化建议。 本书可供教育管理职能部门、职业院校、教育科研部门等管理人员、职业教育教师及科研人员参考。",null),
(null,"9787030507259","英语非人称构式的认知研究...","马应聪 著","英文","H314/486","北京 科学出版社 2017","二楼新书阅览室","2019-3-2",50,"52.00",240,"img/nbook/nbook9.jpg",1,null,"马应聪著的《英语非人称构式的认知研究》采用定性和定量研究相结合的方法，在认知语言学相关理论的指导下建构了认知参照场域控制模型，并以该模型为理论框架系统研究了英语非人称构式对述渭的语义制约及其意义建构问题。研究表明，英语非人称构式是一类抽象认知参照点构式，反映人类的一种高级认知能力。研究以真实语料为支撑，为英语非人称构式提供了新的研究视角。 本书的读者对象是英语语言学专业的硕士生和博士生，亦可为认知语言学的相关研究提供借鉴。",null),
(null,"9787030507259","Objective-C程序设计案例教程","黑马程序员 编著","教育学","H314/486","北京 科学出版社 2017","二楼新书阅览室","2019-3-2",50,"52.00",240,"img/nbook/nbook10.jpg",1,null,"马应聪著的《英语非人称构式的认知研究》采用定性和定量研究相结合的方法，在认知语言学相关理论的指导下建构了认知参照场域控制模型，并以该模型为理论框架系统研究了英语非人称构式对述渭的语义制约及其意义建构问题。研究表明，英语非人称构式是一类抽象认知参照点构式，反映人类的一种高级认知能力。研究以真实语料为支撑，为英语非人称构式提供了新的研究视角。 本书的读者对象是英语语言学专业的硕士生和博士生，亦可为认知语言学的相关研究提供借鉴。",null),
(null,"9787310055081","读《聊斋志异》漫想走笔","章敬一 著","教育学","I207.419/251","天津 南开大学出版社 2017","二楼新书阅览室","2019-4-2",50,"52.00",174,"img/nbook/nbook11.jpg",1,null,"《聊斋志异》是我国清代著名小说家蒲松龄创作的文言小说短篇集，章敬一著的《读聊斋志异漫想走笔》以铸雪斋抄本《聊斋》为研究版本，研读文本，畅谈古今，以个人的人生经历以及与蒲翁同为知识分子的通感，不拘一格，漫想走笔。作者在书中与读者相互交流，探讨分析了《聊斋志异》与时代的关系，蒲翁与时代、故事与时代、人物与时代的关系。作者还用很大精力研究了《聊斋志异》作品中的传统观念、人物的爱恨纠葛，并与国内外几部相关著作做对比，展现了《聊斋志异》独特的魅力，以作者特有的笔触评述了《聊斋志异》的文字运用和思想内涵。",null),
(null,"9787302483915","C语言程序设计","孙海洋 编著","计算机","TP312C/354","北京 清华大学出版社 2018","二楼新书阅览室","2019-4-2",50,"52.00",381,"img/nbook/nbook12.jpg",1,null,"孙海洋编著的《C语言程序设计(21世纪普通高校计算机公共课程规划教材)》共分为11章，前5章主要介绍了C语言的基本语法、基本数据类型、运算符及表达式和三大流程结构，第6章引入批量处理数据的类型——数组。本教材从第7章开始对函数、指针、自定义类型等C语言的精髓和核心进行了重点介绍。第10章输入和输出也是综合性且实用性较强的重点章节，第11章预处理和位操作在编程中是比较实用的，例如，解决了头文件重复包含等问题及相关位操作。 全书提供了大量应用实例及源代码，每节均对应复习思考题，便于对所学知识及时巩固提高。每章有大量精心设计的习题，均是在例题及复习思考题基础上的提升，且按章节按知识点划分。每章小结均以表格的形式列出本章的重点、难点及易错点，结构清晰，便于读者学习把握。 本教材所有例题、习题均严格遵守业界较通用的编程规范，设计结构合理，思路清晰，注重程序的可读性和健壮性。 本书适合作为高等院校计算机、软件工程、电子、通信、自动化等专业高年级本科生的教材，同时也可作为计算机等级考试的参考用书。",null),
(null,"9787101121711","陟彼景山十一位中外学者访谈录精","戴燕 主编","教育学","K820.7/317","北京 中华书局 2017","二楼新书阅览室","2019-4-2",50,"52.00",207,"img/nbook/nbook13.jpg",1,null,"一代有一代之学术、一代有一代之思想。《陟彼景山（十一位中外学者访谈录）》通过戴燕教授对何兆武、李学勤、章培恒、王水照、裘锡圭等十一位从抗战到当下的老一辈中外学人的访谈，使我们了解了那个即将过去的时代所发生过的历史，以及那一代历史中的学人的思考与抉择——他们的政治关怀和学术理想是什么？在巨大的社会变动中，他们如何选择自己的人生道路？在各自的专业领域，他们又是如何思考历史与未来，如何承上启下的？ 一个个学者，体现了一代的学术、思想的风气。这些学者，可以说是这个时代精神的脊梁，是学术文化的灵魂。鉴往知来，当今学人只有充分了解上一辈学人的学术及思想，才能承上启下，继往开来。在这个意义上说，本书也是前辈学者的学人心史。","戴燕，1982年北京大学毕业，1989年中国社会科学院硕士研究生毕业，先后任职于中华书局、中国社会科学院文学所，现为复旦大学教授。"),
(null,"9787520300773","当代文学散点透视历史与现场丛书","巫晓燕, 1973- 著","中文","I206.7/1108a","北京 中国社会科学出版社 2017","二楼新书阅览室","2019-4-2",50,"52.00",355,"img/nbook/nbook14.jpg",1,null,"所谓透视，其实首先包含了著者的立足点、视角或“期待意图”等。其次，也是由中国当代文学的复杂性所决定的。因此巫晓燕著的《当代文学散点透视》以多重文化视角，以文化研究、美学探查、精神分析、叙事细读等方式，对当代工业文学创作、城市文学创作、70年代文学的民间形态、当代作家创作经验的复杂性等问题进行了探讨，具有一定的知识性和学理性。本书逻辑严谨，文字朴实。其中大多数篇章都已经在《当代作家评论》《文艺争鸣》等核心学术刊物上面发表，有些被转载引用，具有一定的学术反响。","巫晓燕，女，1973年出生，祖籍四川，2005年毕业于山东师范大学中国现当代文学专业，文学博士，教授，硕士研究生导师。中国当代文学学会会员、辽宁省理论家协会会员、辽宁省鲁迅研究会秘书长。 主要从事中国当代文学与文化研究。一直承担研究生、本科生《中国现代文学史》《中国现当代文学作品导读》《中国现代文学思潮》《中国现代文学批评史》等课程的教学工作。 自2002年以来在CISSCI、中文核心期刊发表论文数十篇，其中有的被《新华文摘》要点转摘，有的获得省市级奖励。独立完成著作2部，与人合著著作2部，参编著作多部，承担省级重大课题、一般课题十余项，参与国家级、部级以上课题多项。"),
(null,"9787308162104","企业社会责任成本...","熊明华 著","经济科学","F279.243/369","杭州 浙江大学出版社 2016","二楼新书阅览室","2019-4-2",50,"52.00",241,"img/nbook/nbook15.jpg",1,null,"熊明华著的《企业社会责任成本与企业效益的关系研究(基于浙江省中小企业的实证分析)》共分七章，第一章对企业社会责任相关的国内外理论文献进行了梳理，为下文的研究提供了有力的理论支持和思想指导。第二章、第三章分析了浙江省中小企业整体的发展变化态势。通过对312家浙江中小企业的调查，分析了这些企业对社会责任的认知状况，以及企业在推进社会责任实践方面所做的工作。第四章从《劳动合同法》的角度对比分析了该法实施前后企业的发展变化。第五章从理论上分析了企业社会责任成本的构成及影响因素，以及企业履行社会责任对人力资源成本的影响。第六章应用本量利模型，结合对浙江中小企业的调查，分析了浙江中小企业社会责任成本与企业效益之间的关系，以及企业效益对社会责任成本的敏感性。第七章对前几部分的研究进行了总结。",null),
(null,"9787300249728","公司治理第5版经济科学译丛","Monks, Robert A. G.","经济科学","F276.6/276.2","北京 中国人民大学出版社 2017","二楼新书阅览室","2019-5-2",50,"52.00",409,"img/nbook/nbook16.jpg",1,null,"在复杂动荡的商业环境下，很有必要让经济与管理专业的学生们了解高管、董事会中的董事、股东与投资者之间的关系。 这本公司治理领域的权威著作为阅读它的每位学生和商务专家提供了一个必不可少的指南，由罗伯特·A.G.蒙克斯、尼尔·米诺著的《公司治理(第5版)/经济科学译丛》共分五大部分，即公司、股东、董事、管理者与跨国公司治理，全方位地帮助读者掌握那些基本的公司治理概念。 本书是这本经典著作的第五版，包括了更多的思考题；精辟地分析了最新的企业失败案例和有关争议。本书的最大特色是以金融危机中的机构和企业为例，分析了多家知名公司治理失败的原因(包括雷曼兄弟、通用汽车、美国运通、时代华纳、旧M和英国石油公司等)。","罗伯特.A.G.蒙克斯(Robert A.G.Monks)： 国际治理标准公司的创始人，该公司是一个独立的研究机构，致力于公司治理的研究。蒙克斯和尼尔·米诺原来是透镜基金的主管和机构股东服务公司的高级职员。蒙克斯与米诺还合作出版过另外两本书——《权力和责任》和《监督监督人》。"),
(null,"9787020141739","南方邮航(精)","圣埃克苏佩里","英文","I565.45/18i","北京 人民文学出版社 2018","二楼新书阅览室","2019-5-2",50,"52.00",119,"img/nbook/nbook17.jpg",1,null,"1927年春天，圣埃克苏佩里至摩洛哥塔尔法亚附近的朱比角当中途站站长，也就是在挨着西班牙要塞盖的一间木屋内，做过路飞机的联络工作。他一无自卫手段，二无人身保障，在沙漠与天空、摩尔人与西班牙人中间，度过了十八个月。身居荒凉的沙漠，接触猜疑的异族，分享同志的水、面包和“最后”时刻，使他发现和体验到人的情意与交流是人生的根本。也就是在朱比角这间简陋的木屋内，圣埃克苏佩里完成了他的第一部小说——《南方邮航》。小说描写飞行员贝尼斯徘徊于感情与行动之间的矛盾心理，也是影射作者与维尔莫兰那段失败的罗曼史。本书不仅是圣埃克苏佩里的开山之作，也是他的小说中*具浪漫色彩的一部。","马振骋，1934年生于上海，法语文学翻译家，首届“傅雷翻译出版奖”得主。先后翻译了圣埃克苏佩里、波伏娃、高乃依、萨巴蒂埃、克洛德·西蒙、纪德、蒙田、杜拉斯、米兰·昆德拉、洛朗·戈伐等法国重要文学家的作品。著有散文集《巴黎，人比香水神秘》《镜子中的洛可可》《我眼中残缺的法兰西》《误读的浪漫：关于艺术家、书籍与巴黎》等。译著《蒙田随笔全集》(全三卷)2009年荣获首届“傅雷翻译出版奖”，并被评为“2009年度十大好书”。"),
(null,"9787561386651","溯水而上汉水文化寻访之旅","张惠 著","中文","K296/12","西安 陕西师范大学出版总社 2016","二楼新书阅览室","2019-5-2",50,"52.00",250,"img/nbook/nbook18.jpg",1,null,"《溯水而上(汉水文化寻访之旅)》记录了作者张惠沿汉江溯水而上的行走历程，追寻与探索汉水文化的身影。在一场对文化追根溯源的奇妙旅程中，读者随作者一起抵达普通旅行者所不能抵达的幽深之地，碰触完全不同的人生、生活与心灵。全书分为下游、中游与上游三个部分，作者以一个画家的视角，通过对汉水流域的建筑、人文以及人们日常生活等各个方面细致入微的观察和体会，用轻松优美的文字，带读者领略一场别有风情的汉水文化之旅。","张惠，女，陕西汉中人，艺术硕士，民进党人士。现为陕西理工大学艺术学院美术系教师，从事美术理论及中国画研究、教学工作。相关专业论文在《美与时代》《艺术评论》《西北美术》等专业核心期刊发表。绘画作品入选陕西青年女画家展、“高原高原”西部中国画展等。"),
(null,"9787510851315","儿童分析的故事克莱因文集","克莱因","教育学","B844.1/93a2","北京 九州出版社 2017","二楼新书阅览室","2019-5-2",50,"52.00",585,"img/nbook/nbook19.jpg",1,null,"《儿童分析的故事》这本富含生命力的作品，在梅兰妮·克莱因的著作中占有特殊的地位，其中详述一名十岁男孩长达四个月的分析历程，并对当中的画作、游戏、语言联想和梦境作出精辟的诠释。本书说明了她在分析当时的理论概念，并尽可能忠实地呈现实务工作与理论观点。文中更揭露了许多崭新的想法，克莱因的这部最后著作，可以说是深具创造性的一部代表作，更是探究儿童精神分析技巧不可多得的必备书籍。","梅兰妮·克莱因（Melanie Klein，1882—1960），著名精神分析学家，被称为“客体关系之母”，儿童精神分析研究的先驱。在其意义深远而富于开创性的工作中，她打开了理解婴儿早期的心理历程的途径，这些早期心理历程支配着婴儿的内心活动。她的理论将精神分析关注的重点，从之前的“驱力”转到了“关系”上。她也被誉为继弗洛伊德之后，对精神分析理论发展极具贡献的领军人物之一。"),
(null,"9787512132948","产业空心化问题研究","李孟刚, 1967- 著","经济科学","F269.24/98","北京 北京交通大学出版社 2017","二楼新书阅览室","2019-5-2",50,"52.00",137,"img/nbook/nbook20.jpg",1,null,"《产业空心化问题研究(国家产业安全理论与预警机制)(精)》由李孟刚著。在一国(或地区)产业结构的升级过程中，如果新旧产业衔接不好，就会不同程度地出现产业空心化问题。当前，我国正处于产业结构调整和升级的关键时期，面临贸易摩擦日益加剧、区域经济一体化进程加快、国内传统产业产能过剩，以及国内产业结构调整等复杂的经济环境，与日本20多年前发生产业空心化的背景极其相似。因此，全面阐释产业空心化问题，研究全球已发生的产业空心化，对预防我国产业空心化的发生，实现我国产业结构的升级，保持我国经济的平稳发展，具有十分重要的意义。",null);



CREATE TABLE nbook_in(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nid INT,
  	catalog VARCHAR(100),        #目录
 	  FOREIGN KEY(nid) references newbook(nid)   
);

#经济科学、中文、计算机

CREATE TABLE borrow(
  id INT PRIMARY KEY AUTO_INCREMENT,
  bookname VARCHAR(20),     #图书名称
  borrowdate VARCHAR(20),   #借阅时间
  Ereturndate VARCHAR(20),  #预计归还时间
  returndate VARCHAR(20),   #预计归还时间
  Manmessage VARCHAR(50),   #管理员消息
  uid INT
);
  -- uid VARCHAR(10),
  -- FOREIGN KEY(uid) references user(uid)  

# 读者意见表
  CREATE TABLE reader_advise(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uid VARCHAR(20),
    content VARCHAR(200),
    time VARCHAR(20)
  )

# 管理员信息表
#管理员信息表（工作号、姓名、性别、电话、家庭住址、备注）
CREATE TABLE managerinfo(
  id INT PRIMARY KEY AUTO_INCREMENT, 
  workid VARCHAR(20),
  pswd VARCHAR(20) DEFAULT 'admin',
  name VARCHAR(20),
  sex VARCHAR(5),
  tel VARCHAR(20),
  address VARCHAR(50),
  remark VARCHAR(100)
)

INSERT INTO managerinfo VALUES
(null,"admin","admin","Monika","女","13845678915","湖北省武汉市洪山区白沙洲大道110号张家湾",null);


-- 查找图书分类中各分类个数 取到结果后进行聚合统计大于1的数据行
-- select classify ,count(*) as total from newbook froup by classify having count(1)>1; 