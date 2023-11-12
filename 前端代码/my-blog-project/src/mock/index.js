import Mock from "mockjs"
import {post} from "axios";
//设置延迟
// Mock.setup({
//     timeout: 4000
// })
//也可以使用正则表达式
Mock.mock("/user/all", 'get',{
    "msg": 0,
    "data":{
       "user|30-50": [{
           "id|+1": 1,
           "createTime":"@date('yyyy-MM-dd hh:mm')",
           "username": '@email',
           "type|1": ["admin", "user"],
           "lastLogin": "@date('yyyy-MM-dd hh:mm')"
       }],
    },
    "error": ""
})

Mock.mock("/loginLog", 'get',{
    "msg": 0,
    "data":{
        "loginLog|30-50": [{
            "id|+1": 1,
            "username": '@email',
            "type|1": ["admin", "user"],
            "ip": "@ip",
            "location|1": ["武汉", "上海", "成都", "广州", "北京"],
            "time": "@date('yyyy-MM-dd hh:mm')",
            "action|1": ["登录", "退出"]
        }],
    },
    "error": ""
})

Mock.mock("/visitLog", 'get',{
    "msg": 0,
    "data":{
        "visitLog|30-50": [{
            "id|+1": 1,
            "time": "@date('yyyy-MM-dd hh:mm')",
            "ip": "@ip",
            "location|1": ["武汉", "上海", "成都", "广州", "北京"],
            "method|1": ["GET", "POST", "PUT", "DELETE"],
            "url": "@url",
            "statusCode|1": ["200", "302", "404", "500"],
            "length|30-1500": 1
        }],
    },
    "error": ""
})

Mock.mock("/operationLog", 'get',{
    "msg": 0,
    "data":{
        "operationLog|30-50": [{
            "id|+1": 1,
            "time": "@date('yyyy-MM-dd hh:mm')",
            "ip": "@ip",
            "location|1": ["武汉", "上海", "成都", "广州", "北京"],
            "sql|1": ["select", "delete", "update", "insert"]
        }],
    },
    "error": ""
})

Mock.mock("/passage", 'get',{
    "msg": 0,
    "data":{
        "passage|30-50": [{
            "id|+1": 1,
            "username": '@email',
            "type|1": ["admin", "user"],
            "passageId|+1": 1,
            "title|1": ["cpp进阶", "python爬虫", "javaweb", "thinkphp"],
            "description|1": ["关于cpp的介绍", "教你如何从0到1搭建一个网站", "thinkphp反序列化漏洞"],
            "passageType|1": ["php", "java", "cpp", "python"],
            "createTime": "@date('yyyy-MM-dd hh:mm')",
            "updateTime": "@date('yyyy-MM-dd hh:mm')",
        }],
    },
    "error": ""
})

Mock.mock("/comment", 'get',{
    "msg": 0,
    "data":{
        "comment|30-50": [{
            "id|+1": 1,
            "userId|+1": 1,
            "username": '@email',
            "commentId|+1": 1,
            "comment|1": ["棒!", "太好了!", "点赞!"],
            "passageId|+1": 1,
            "passageTitle|1": ["cpp进阶", "python爬虫", "javaweb", "thinkphp"],
            "passageAuthor": '@email',
            "createTime": "@date('yyyy-MM-dd hh:mm')",
        }],
    },
    "error": ""
})

Mock.mock("/passageIndex", 'get',{
    "msg": 0,
    "data":{
        "passage|5": [{
            "id|+1": 1,
            'authorId|+1': 1,
            "authorName": '@email',
            "passageId|+1": 1,
            "title|1": ["cpp进阶", "python爬虫", "javaweb", "thinkphp"],
            "description|1": ["关于cpp的介绍", "教你如何从0到1搭建一个网站", "thinkphp反序列化漏洞"],
            "type|1": ["php", "java", "cpp", "python"],
            "createTime": "@date('yyyy-MM-dd hh:mm')",
            "updateTime": "@date('yyyy-MM-dd hh:mm')",
            'content|1': [
                "wireshark是一款抓 `http` 请求的工具，只能查看数据包，不能修改。\n" +
                "# wireshark的安装\n" +
                "\n" +
                "kali里面自带 `wireshark` 工具，在终端输入 `wireshark` 命令即可直接进入其图形化界面。\n",

                "# 概述\n" +
                "XSS是一种发生在Web **前端** 的漏洞，其危害的对象也主要是前端用户。\n" +
                "\n" +
                "# 分类\n" +
                "\n" +
                "1. 反射型\n" +
                "交互的数据一般不会被存在数据库里边，一次性，所见即所得，一般出现在查询页面等。\n" +
                "\n" +
                "**定义**：",

                "# 反序列化攻击的流程\n" +
                "1.  客户端构造 `payload` (有效载荷)，并进行一层层的封装，完成最后的 `exp`（ `exploit` -利用代码）\n" +
                "2. `exp` 发送到服务端，进入一个服务端自主复写（也可能是也有组件复写）的`readobject` 函数，它会反序列化恢复我们构造的 `exp` 去形成一个恶意的数据格式`exp_1` （剥去第一层）\n" +
                "3.  这个恶意数据 `exp_1` 在接下来的处理流程(可能是在自主复写的 `readobject` 中、也可能是在外面的逻辑中)，会执行一个 `exp_1` 这个恶意数据类的一个方法，在方法中会根据 `exp_1` 的内容进行函处理，从而一层层地剥去（或者说变形、解析）我们`exp_1` 变成 `exp_2` 、`exp_3` ......",

                "```text\n" +
                "官方文档\n" +
                "https://docs.oracle.com/javase/tutorial/rmi/\n" +
                "https://xz.aliyun.com/t/9261\n" +
                "```\n" +
                "\n" +
                "`RMI` （ `Remote Method Invocation` ）远程方法调用，**是Java编程语言里一种用于实现远程过程调用的应用程序编程接口** 。\n" +
                "\n" +
                "# `RMI` 架构\n" +
                "从设计角度上讲，JAVA采用的是三层结构模式来实现 `RMI` 。在整个体系结构中，有如下几个关键角色构成了通信双方：（可以类比 `TCP` 的架构）     ",

                "字符串逃逸分为两种，减少和增多。\n" +
                "\n" +
                "主要是通过一个 `preg_replace()` 函数来进行字符串的减少和增多。\n" +
                "\n" +
                "首先要知道逃逸的原理，就是反序列化时，是以 `}` 来进行结尾的，同时在字符串内，是以关键字后面的数字来规定所读取的内容的长度。因此如果我们把 `\";}` 带入需要反序列化的字符串中（除了结尾处），就能让反序列化提前结束而后面的内容就会被丢弃。\n",

            ]
        }],
    },
    "error": ""
})
//
// Mock.mock(RegExp("/passage/all"), {
//     "ret": 0,
//     "data":{
//         "mtime": "@datetime",//随机生成日期时间
//         "score|1-800": 1,//随机生成1-800的数字
//         "rank|1-100": 1,//随机生成1-100的数字
//         "stars|1-5": 1,//随机生成1-5的数字
//         "nickname": "@cname",//随机生成中文名字
//         //生成图片
//         "img":"@image('200x100', '#ffcc33', '#FFF', 'png', 'Fast Mock')"
//     }
// })