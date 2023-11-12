-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: db_blog
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_about`
--

DROP TABLE IF EXISTS `tb_about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_about`
--

LOCK TABLES `tb_about` WRITE;
/*!40000 ALTER TABLE `tb_about` DISABLE KEYS */;
INSERT INTO `tb_about` VALUES (1,'# 关于我\n欢迎来到justdoit的博客，希望大家可以一起学习，一起进步！\n冲冲冲！');
/*!40000 ALTER TABLE `tb_about` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comment`
--

DROP TABLE IF EXISTS `tb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passage_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `commentator_id` int(11) NOT NULL,
  `commentator_username` varchar(30) NOT NULL,
  `create_time` datetime NOT NULL,
  `like_num` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comment`
--

LOCK TABLES `tb_comment` WRITE;
/*!40000 ALTER TABLE `tb_comment` DISABLE KEYS */;
INSERT INTO `tb_comment` VALUES (31,17,'不错',11,'2068830937','2023-04-25 18:35:36',3,0),(32,17,'不错',11,'2068830937','2023-04-25 18:36:02',0,0),(33,18,'111',1,'zhangsan','2023-04-25 19:40:04',0,0),(34,14,'真好！',14,'justdoooittt','2023-04-25 23:21:16',0,0),(29,19,'不错',11,'2068830937','2023-04-25 18:35:24',1,0),(30,17,'不错',11,'2068830937','2023-04-25 18:35:35',4,0),(28,18,'不错',11,'2068830937','2023-04-25 18:35:11',0,0),(20,19,'好好好',11,'2068830937','2023-04-25 18:27:02',6,0),(21,19,'好好好',11,'2068830937','2023-04-25 18:27:03',1,0),(22,19,'好好好',11,'2068830937','2023-04-25 18:27:30',1,0),(23,19,'好好好',11,'2068830937','2023-04-25 18:27:30',0,0),(24,19,'1',11,'2068830937','2023-04-25 18:28:11',1,0),(25,18,'写的真好！',11,'2068830937','2023-04-25 18:34:13',3,0),(26,18,'写的真好！',11,'2068830937','2023-04-25 18:34:21',0,0),(27,18,'哈哈哈',11,'2068830937','2023-04-25 18:34:36',0,0);
/*!40000 ALTER TABLE `tb_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_comment_insert_trigger` AFTER INSERT ON `tb_comment` FOR EACH ROW begin
    insert into tb_sql_log(id, operation, time,  operation_params) values
    (null, 'insert tb_comment', now(), concat('插入的数据内容是: id = ', new.id, ', passage_id = ', new.passage_id,
        ', content = ', new.content, ', commentator_id = ', new.commentator_id, ', commentator_username = ',
        new.commentator_username, ', like_num = ', new.like_num));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_comment_update_trigger` AFTER UPDATE ON `tb_comment` FOR EACH ROW begin
    insert into tb_sql_log(id, operation, time,  operation_params) values
    (null, 'update tb_comment', now(), concat(
        '更新前的数据内容是: id = ', old.id, ', passage_id = ', old.passage_id,
        ', content = ', old.content, ', commentator_id = ', old.commentator_id, ', commentator_username = ',
        old.commentator_username, ', like_num = ', old.like_num,
        '|===|更新后的数据内容是: id = ', new.id, ', passage_id = ', new.passage_id,
        ', content = ', new.content, ', commentator_id = ', new.commentator_id, ', commentator_username = ',
        new.commentator_username, ', like_num = ', new.like_num));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_comment_delete_trigger` AFTER DELETE ON `tb_comment` FOR EACH ROW begin
    insert into tb_sql_log(id, operation, time,  operation_params) values
    (null, 'delete tb_comment', now(), concat('删除前的数据内容是: id = ', old.id, ', passage_id = ', old.passage_id,
        ', content = ', old.content, ', commentator_id = ', old.commentator_id, ', commentator_username = ',
        old.commentator_username, ', like_num = ', old.like_num));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_login_log`
--

DROP TABLE IF EXISTS `tb_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `type` enum('admin','user','visitor') NOT NULL,
  `ip` varchar(20) DEFAULT '',
  `time` datetime NOT NULL,
  `action` enum('登录','退出') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_login_log`
--

LOCK TABLES `tb_login_log` WRITE;
/*!40000 ALTER TABLE `tb_login_log` DISABLE KEYS */;
INSERT INTO `tb_login_log` VALUES (1,'zhangsan','user','0:0:0:0:0:0:0:1','2023-04-25 17:25:15','登录'),(2,'justdoit','admin','0:0:0:0:0:0:0:1','2023-04-25 17:29:27','登录'),(3,'justdoit','admin','0:0:0:0:0:0:0:1','2023-04-25 17:37:16','登录'),(4,'helloworld','user','0:0:0:0:0:0:0:1','2023-04-25 17:51:19','登录'),(5,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 17:58:51','登录'),(6,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 18:14:40','登录'),(7,'zhangsan','user','0:0:0:0:0:0:0:1','2023-04-25 18:38:46','登录'),(8,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 18:43:44','登录'),(9,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 18:44:05','登录'),(10,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 18:45:06','登录'),(11,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 19:23:10','登录'),(12,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 19:25:15','登录'),(13,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 19:28:45','登录'),(14,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 19:31:54','登录'),(15,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 19:33:32','登录'),(16,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 19:35:08','登录'),(17,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 19:36:08','登录'),(18,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 19:36:49','登录'),(19,'zhangsan','user','0:0:0:0:0:0:0:1','2023-04-25 19:39:57','登录'),(20,'12345678','user','0:0:0:0:0:0:0:1','2023-04-25 19:42:20','登录'),(21,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 19:43:34','登录'),(22,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 19:44:27','登录'),(23,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 23:14:48','登录'),(24,'justdoooittt','user','0:0:0:0:0:0:0:1','2023-04-25 23:17:25','登录'),(25,'justdoooittt','user','0:0:0:0:0:0:0:1','2023-04-25 23:22:06','登录'),(26,'fafafafa','user','0:0:0:0:0:0:0:1','2023-04-25 23:34:38','登录'),(27,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 23:40:04','登录'),(28,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 23:40:51','登录'),(29,'2068830937','admin','0:0:0:0:0:0:0:1','2023-04-25 23:41:04','登录');
/*!40000 ALTER TABLE `tb_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_passage`
--

DROP TABLE IF EXISTS `tb_passage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_passage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text,
  `type` varchar(30) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `like_num` int(11) NOT NULL DEFAULT '0',
  `visit_num` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_passage`
--

LOCK TABLES `tb_passage` WRITE;
/*!40000 ALTER TABLE `tb_passage` DISABLE KEYS */;
INSERT INTO `tb_passage` VALUES (18,11,'ack扫描','ack扫描','[[scapy#ACK Scan]]\n\n```python\nfrom scapy.all import *  \nfrom scapy.layers.inet import IP, TCP\ntarget_port = [80, 81, 443, 3306, 3307, 5000, 8080, 8081, 10001, 10002]  \n# target_ip = \'192.168.188.130\'  \ntarget_ip = \'114.132.243.19\'  \n# ACK Scan  \npacket = IP(dst=target_ip) / TCP(dport=target_port, flags=\'A\')  \nans, unans = sr(packet)  \nfor i in ans:  \n    # i[1]表示回复包，flags==\'R\'表示这个回复包是rst包  \n    if i[1][TCP].flags == \'R\':  \n        print(str(i[0].dport) + \" is unfiltered\")  \n    else:  \n        print(str(i[0].dport) + \" is filtered\")  \nfor i in unans:  \n    print(str(i.dport) + \" is filtered\")\n```\n\n注意：这里的 `ack` 扫描可能会被云服务器过滤，原因见 [[scapy#ACK Scan]]\n','ack','2023-04-25 18:17:14','2023-04-25 18:36:56',5,0,0),(14,11,'shiro的入门介绍','Shiro','```text\n官网\nhttps://shiro.apache.org/\n中文指南手册\nhttp://greycode.github.io/shiro/doc/reference.html\nhttps://www.w3cschool.cn/shiro/xgj31if4.html\n```\n\n# 简介\n`shiro` 是 `apache` 的一个开源框架，是一个权限管理的框架，实现用户认证、用户授权。`spring` 中有 `spring security` (原名 `Acegi` )，是一个权限框架，它和 `spring` 依赖过于紧密，没有 `shiro` 使用简单。 `shiro` 不依赖于 `spring` ，`shiro` 不仅可以实现 `web` 应用的权限管理，还可以实现 `c/s` 系统，分布式系统权限管理，`shiro` 属于轻量框架，越来越多企业项目开始使用 `shiro` 。\n\n\n# 坐标\n```xml\n<dependency>  \n  <groupId>org.apache.shiro</groupId>  \n  <artifactId>shiro-core</artifactId>  \n  <version>1.1.0</version>  \n</dependency>  \n<!-- Shiro uses SLF4J for logging.  We\'ll use the \'simple\' binding  \n     in this example app.  See http://www.slf4j.org for more info. -->\n<dependency>  \n  <groupId>org.slf4j</groupId>  \n  <artifactId>slf4j-simple</artifactId>  \n  <version>1.6.1</version>  \n  <scope>test</scope>  \n</dependency>\n```\n\n# 入门案例\n\n```ini\n[users]  \nzhangsan=z3,role1,role2  \nlisi=l4  \n  \n[roles]  \nrole1=user:insert,user:select\n```\n\n```java\npackage com.just;  \n  \nimport org.apache.shiro.SecurityUtils;  \nimport org.apache.shiro.authc.*;  \nimport org.apache.shiro.config.IniSecurityManagerFactory;  \nimport org.apache.shiro.mgt.SecurityManager;  \nimport org.apache.shiro.subject.Subject;  \n  \npublic class ShrioRun {  \n    public static void main(String[] args) {  \n        // 通过ini文件实现认证登录,后期会利用数据库实现认证登录  \n        // 初始化获取SecurityManager  \n        IniSecurityManagerFactory factory = new IniSecurityManagerFactory(\"classpath:shiro.ini\");  \n        SecurityManager securityManager = factory.getInstance();  \n        SecurityUtils.setSecurityManager(securityManager);  \n        // 获取Subject对象  \n        Subject subject = SecurityUtils.getSubject();  \n        // 模拟前端获取token  \n        AuthenticationToken token = new UsernamePasswordToken(\"zhangsan\", \"z3\");  \n        System.out.println(token);  \n        // 完成登  \n        try{  \n            subject.login(token);  \n            System.out.println(\"登录成功\");  \n            // 判断角色  \n            boolean hasRole = subject.hasRole(\"role1\");  \n            System.out.println(\"是否拥有此角色:\" + hasRole);  \n            // 判断权限  \n            boolean permitted1 = subject.isPermitted(\"user:insert\");  \n            System.out.println(\"是否有用户的插入权限:\" + permitted1);  \n            boolean permitted2 = subject.isPermitted(\"user:select\");  \n            System.out.println(\"是否有用户的查找权限:\" + permitted2);  \n            // 也可以用checkPermission方法，此方法没有返回值，没权限抛AuthenticationException  \n//            subject.checkPermission(\"user:delete\");  \n  \n        }catch (UnknownAccountException e){  \n            e.printStackTrace();  \n            System.out.println(\"用户不存在\");  \n        }catch (IncorrectCredentialsException e){  \n            e.printStackTrace();  \n            System.out.println(\"密码错误\");  \n        }catch (AuthenticationException e){  \n            e.printStackTrace();  \n            System.out.println(\"登录失败\");  \n        }  \n    }  \n}\n```','shiro','2023-04-25 18:00:17',NULL,3,0,0),(17,11,'mysqlwin安装及配置','mysqlwin安装及配置','### 安装\n在C:\\\\Windows\\system32下以管理员方式打开cmd窗口\n1. mysqld --initilize-insecure初始化mysql，此命令会在mysql的目录下建一个data文件夹\n2. mysqld -Install 注册mysql服务\nservices.msc可以看window的服务列表，这是windows的命令\n现在你的计算机上已经安装好了mysql服务，就可以称为mysql服务器\n3. net start mysql启动mysql\nnet stop mysql关闭mysql\n4. mysqladmin -u root password 1234修改密码\n5. mysql -uroot -p1234登录\n6. exit或quit退出\nmysql -uroot -p1234 -h127.[]()0.0.1 -P3306连接别人的mysql\n\n### 卸载\n1. net stop mysql(不能带分号！)\n2. mysqld -remove mysql\n3. 然后删除mysql目录和相关的环境变量\n\nmysql的数据库都像文件一样存储在data文件中\n\n[MySQL服务正在启动或停止中，请稍候片刻后再试一次【解决方案】]([https://blog.csdn.net/qq_42319677/article/details/120532192](https://blog.csdn.net/qq_42319677/article/details/120532192))\n\n\n安装phpstudy后启动不了php mysql的服务，需要先 `sc delete mysql服务名`停止mysql的服务，并且在任务管理器中停止 `mysqld.exe` 的进程。','mysql','2023-04-25 18:15:49',NULL,4,0,0),(15,11,'一些对注解的介绍','ssm注解','`@RequestMapping(\"/user\")`：配置controller的对于网页访问地址。放在类上对全方法生效，放在方法上对该方法生效。\n\n`@ResponseBody`：放在方法上，会自动将方法的返回值转为json数据作为响应体传给前端。\n\n`@RequestParam(\"username\")`：放在方法参数的前面，解决方法参数名与前端传过来的参数名不一样（**请求参数 Key 的名称要和 POJO 中属性的名称一致，否则无法封装**）。也可以解决参数如果是 **List** 集合的会导致 **SpringMvc** 误以为是 **POJO** 对象而不识别 **List** 集合的问题。\n> 相关参数：\n> `required`：是否为必传参数。\n> `defaultValue`：参数默认值。\n> \n\n`@EnableWebMvc`：在 **SpringMVC** 的配置类中开启 **SpringMVC** 的注解支持，这里面就包含了将 **JSON** 转换为对象的功能。\n\n`@RequestBody`：放在方法参数前面，将请求中请求体所包含的数据传递给请求参数，此注解一个 **controller** 方法只能用一次。\n> `@RequestBody`用于接收 **JSON** 数据。\n> `@RequestParam`用于接收url地址传参。\n\n`@DateTimeFormat(pattern=\"yyyy-MM-dd HH:mm:ss\") Date date1`：放在日期类型的方法参数前面，帮助转换日期格式。\n\n`@PathVarible(\"id\")`：在 **Rest** 风格中解决前端传参名和参数名不一样。\n\n`@RestController`：是`@ResponseBody`和`@Controller`的结合。\n\n`@AutoWired`：按照类型注入\n\n`@Resource`：\n> name属性指定 **bean** 实例名称，\n> type属性指定 **bean** 的类型。\n\n`@Qualifier`：当`@Autowired`需要按照名称来装配的时候，则需要结合该注解一起使用。**Bean** 实例的名称由 `@Qualifier`注解的参数指定。\n\n`@Scope(\"prototype\")`：定义 **Bean** 的作用域。\n\n`@Configuration`：声明当前类是一个配置类，相当于一个 **Spring** 的 **XML** 配置。\n\n`@ComponentScan(\"com.just.service\")`：自动扫描 com.just.service 及其子包下使用的注解，并注册为 **Bean**。相当于\n```xml\n<context:component-scan base-package=\"com.just.service\"/>\n```\n多个包用`\"  \"`包裹。\n\n`@Import({JdbcConfig.class, MybatisConfig.class})`：导入其他配置类。\n\n`@PropertySource(\"classpath:jdbc.properties\")`：导入其他配置文件（不加classpath无法找到这个文件）\n\n`@EnableTransactionManagement`：开启 **Spring** 事务。\n\n`@Bean`：注解在方法上，声明当前方法的返回值是一个 **Bean**。\n\n`@EnableAspectJAutoProxy`：用在配置类上，表明开启 **Spring** 对 **AspectJ**\n的支持。\n`@Aspect`：用于定义一个切面，注解在切面类上。\n\n`@Pointcut`：用于定义切入点表达式。使用时需要定义一个切入点方法。该方法是一个返回值 **void** ，且方法体为空的普通方法。\n\n```java\n@Component  \n@Aspect  \npublic class MyAdvice {  \n    @Pointcut(\"execution(* *..update())\")  \n    private void pt(){}  \n  \n    @Before(\"pt()\")  \n    public void method(){  \n        System.out.println(System.currentTimeMillis());  \n    }  \n}\n```\n\n`@Before`：用于定义前置通知。指定的value值是已有的切入点。\n`@AfterReturning`：用于定义后置返回通知。\n`@Around`：用于定义环绕通知。\n`@AfterThrowing`：用于定义异常通知。\n`@After`：用于定义后置（最终通知）\n\n`@ModelAttribute`：在控制器类中，被`@ModelAttribute`注解的有关非请求处理方法将在每次调用该控制器类的请求处理方法前被调用。\n\n`@PostConstruct`：放在方法前，表示会在服务器加载 **Servlet** 的时候运行。','ssm','2023-04-25 18:01:07','2023-04-25 18:37:13',0,0,0),(16,11,'介绍mysql入门语法','mysql入门语法','  ### 注释\n* 单行注释 -- 注释内容 或 # 注释内容（MySql特有）\n* 多行注释 /* 注释 */\n\n### sql语句执行顺序\nFROM - ON - JOIN - **WHERE** - GROUP BY - WITH - **HAVING** - **SELECT** - DISTINCT - ORDER BY - LIMIT\n\n\n```sql\nshow  databases;\nuse 数据库名;\nshow tables;\n//用来显示服务器错误或警告错误\nshow errors;\nshow warnings;\n//用来显示授予用户的安全权限\nshow grants;\n//用来显示广泛的服务器状态信息\nshow status;\n//显示一个table中的内容（每一列），在使用前先要use 数据库名,但是不显示数据，显示数据用select\nshow columns from 表名;\n//显示表中信息\ndescribe tb_lesson;\n//简写\ndesc 表名;\n//查看数据库默认编码\n//查看建表语句\nshow create table db_user;\n//查看当前MySQL数据库支持的存储引擎：\nshow engines;\n//或者\nshow variables like \'have%\';。\n//查看系统变量\nshow global variables;\n//查看会话变量,默认是会话变量\nshow session varibles;\n//设置系统变量,mysql重启后系统变量会恢复初始值\nset session autocommit = 0;\n\n```\n### select语句检索信息\n\n```sql\n//从一个表中检索信息  \nselect 列名1， 列名2，…… from 表名;\nselect 表名.列名 from 表名;\n//返回表中所有列\nselect * from 表名;\n//重复的列只返回一次\nselect distinct 列名 from 表名;\n//只显示这个列的前5行\nselect 列名 from 表名 limit 5;\n//显示这个列的第a行开始的后b行，第一个数为开始的位置，第二个数为要检索的行数，位置序号从0开始\nselect 列名 from 表名 limit a，b;\nselect 列名 from 表名 limit b offset a;//和上者等价\n//根据第一关键字列名1，第二关键字列名2对列进行排序，默认升序（asc）。\nselect 列名1，列名2，…… from 表名 order by 列名1，列名2，……;\n//指定第二关键字列名2降序排列，第一关键字列名1仍默认升序排列\nselect 列名1，列名2，…… from 表名 order by 列名1, 列名2 desc;\n//根据where语句从表中检索一个满足过滤条件(filter condition)的行，而非返回所有行\nselect 列名…… from 表名 where 过滤条件;\n//否定过滤条件\nselect 列名…… from 表名 not where 过滤条件;\n//返回空值的行\nselect 列名 from 表名 where 列名 is NULL;\n//返回以str开头的行，%是通配符（为了在select语句中使用通配符，必须使用like操作符，like指示MySQL后跟的搜索模式是利用通配符匹配而不是直接相等匹配进行比较），可以使用多个通配符。\nselect 列名 from 表名 where 列名 like \'str%\';\n//同上，不过下划线(_)通配符只匹配单个字符而不是多个字符\nselect 列名 from 表名 where 列名 like \'str_\';\n//正则表达式，类似like操作符，\'.\'可以匹配任意一个字符，默认不区分大小写\nselect 列名 from 表名 where 列名 regexp \'.str\';\n//为区分大小写，可以使用binary关键字\nselect 列名 from 表名 where 列名 regexp binary \'.str\';\n//|类似or语句\nselect 列名 from 表名 where 列名 regexp binary \'.str1|str2\';\n//[]中的字符作为挑选集合，是另一种形式的or语句，[123]表示匹配1or2or3，也可以是[1-3]或[a-z]（匹配所有字符），如果字符是特殊符号，需要\\\\来转义\nselect 列名 from 表名 where 列名 regexp \'str[ch1ch2ch3……]\'\n//固定日期格式\nselect date_format(start, \'%H:%m\') from tb_lesson;\n```\n### where语句操作符\n```sql\n<> :不等于\nbetween a and b;\n=\n!=\n<=\n>=\n>\n<\n```\n**注意：**\n1. 同时使用order by和where语句时，order by应该位于where的后面。\n2. 如果行的类型是string，那行(列中的一个元素）应该带有引号。\n3. NULL与不匹配：\n>在通过过滤选择出不具有特定值的行时，你可能希望返回具有NULL值的行。但是，不行。因为未知（NULL）具体特殊的意义，数据库不知道他们是否匹配，所以在匹配过滤或者不匹配过滤时不返回他们。\n>因此，在过滤数据的时候，一定要验证返回数据中确实给出被过滤列具有NULL的行。\n\n4. group by的不能和where同用，应该用having代替where\n\n\n### 多个过滤条件的情况\n```sql\nselect 列名1，列名2，…… from 表名 where 过滤条件1 and/or 过滤条件2;\n```\n如果一个语句中既有and也有or，要注意and的优先级要高于or\n\n**in操作符用来限定条件范围**，范围中的每个条件都可以进行匹配。\n```sql\nselect 列名1，列名2，…… from 表名 where 列名 in (一些元素);\n```\nin操作符可以等价于or操作符\n下列语句等价于上述语句\n```sql\nselect 列名1，列名2，…… from 表名 where 列名 = 元素1 or 列名 = 元素2 or ……;\n```\n\n\n```sql\ncreate database 库名;\ncreate table 表名(\n	列名1 类型 comment \'……\'，\n	列名2 类型 comment \'……\'，\n	列名3 类型 comment \'……\'\n)comment \'……\';\n```\n\n\n\n\n```sql\n//按顺序赋值\ninsert into 表名 value(数据1，数据2，……);\n```\n### 函数\n##### 多行函数\n\n```sql\nselect avg(列名) from 表名;\n//也可以加上命名和where过滤条件\nselect avg(列名) from 表名 as 命名 where 过滤条件;\n//也可以一句使用多个聚合语句\nselect avg(列名1),agv(列名2) from 表名 as 命名 where 过滤条件;\n//加入distinct排除重复值的列\nselect avg(distinct 列名1) from 表名 as 命名 where 过滤条件;\nmin(),max(),sum(),count()\n```\n\n\n##### 字符串函数\n```sql\n//rpad：不足8位左填充；lpad：不足8位右填充。replace:将a换成b;substr:从第二个字符开始往后三个字符\n//ltrim去掉左边的空格，rtrim去掉右边的空格。\nselect lower(name), rpad(name, 8, \'#\'), lpad(name, 8, \'#\'), length(name)， replace(name, \'a\', \'b\')，substr(name, 2, 3) from 表名;\nconcat()\n```\n\n##### 数值函数\n```sql\nabs();\nfloor();\nceil();\npower();\n```\n\n##### 日期函数\n```sql\nnow();//返回当前系统时间\nlast_day(时间);//返回这个时间所在月的最后一天\nmonths_between(时间);//返回两个日期间隔月份\ndate_format();\nextract();\nadddate();\n```\n\n##### 其他函数\n```sql\nselect ifnull(grade, 0) from 表名;//如果grade为NULL就当作0\nselect md5(name) from 表名;//返回加密结果，md5是不可逆加密\n```\n\n\n**注意：**\n1. 不能把普通列和组函数（max，min）写在一起\n如\n```sql\nselect max(salary), name from emp;\n```\n这句话并不会打印出工资最大的员工，而是始终打印第一个员工的名字，虽然MySQL不会报错，但是显示的结果和我们的预期是不一样的。\n\n2. 不能把普通列和分组函数写在一起\n如\n```sql\nselect max(salary), name from emp group by job;\n```\n这句话并不会打印出每个部门里面最大工资的人是哪些，他只会打印出每一组第一个人的名字。\n\n\n## 七种约束\n[mysql的七种约束](https://blog.csdn.net/h123456789999999/article/details/123027960)\n```sql\ncreate table tb_user  \n(  \n    id int auto_increment primary key comment \'ID唯一标识\',  \n    name varchar(10) not null unique comment \'姓名\',  \n    age int check(age > 0 && age <= 120) comment \'年龄\',  \n    status char(1) default \'1\' comment \'状态\',  \n    gender char(1) comment \'性别\'  \n)character set utf8;\n```\n### 表关联语句\n如果两个表不加限制条件的连接，则展示的总条数为两个表列数的乘积（即笛卡尔积）。\n```sql\n//搜索工资大于2000的员工的工作地址\"（92语法）\"\nselect e.name, d loc from emp e, dept d where e.deptno = d.deptno and sal > 2000;\n//或者用\"新的99语法\"\"natural join\"(自然连接）代替表关联语句e.deptno = d.deptno\nselect * from emp natural join dept;\n//如果怕natural join出问题找错关联了就用\"using\"指定关联的列进行\"等值关联\"\nselect * from emp join dept using(deptno) where sal > 2000;\n//如果是\"不等值连接\"就用关键词\"on\"\nselect * from emp e join salgrade s on(e.sal between s.LOSAL and s.HISAL);				\n//从而避免了表关联语句和普通语句放在一起\n//也可以一句使用多个join连接3张表（连接三张表最少需要两个连接条件）\nselect * from emp e join dept d using(deptno) join salgrade s on(e.sal between s.LOSAL and s.HISAL);						\n```\n\n左外连接，告诉DBMS生成的结果表中，除了包括匹配行外，还包括JOIN关键字（FROM子句中）左边表的不匹配行。左外连接实际上可以表示为：  \n左外连接 = 内连接 + 左边表中失配的元组。\n这是为了防止有匹配条件为NULL而没有显示的情况。\n\n#### union\n```sql\n//查询员工姓名和薪资 在部门1中并且名字含有字母A的员工 和 在部门2薪资大于1000的员工 和 在部门3薪资小于2000的员工\nselect ename, sal, deptno from emp where deptno = 10 and ename like \"%A%\"\nunion\nselect ename, sal, deptno from emp where deptno = 20 and sal > 1000\nunion\nselect ename, sal, deptno from emp where deptno = 30 and sal < 2000;\n//union自动去重，如果想不去重就用union all\n```\n\n### 表与表的自连接\n我们要查询的两个字段同时处于一张表上，我们只能将一张表当作含有不同意义的两个表区处理。\n给相同的表取两个不同的简称。\n```sql\n//查询每个员工与其直属领导的名字\nselect e.name, m.name from emp e, emp m where m.mgr = e.empno;\nselect e.name, m.name from emp e join emp m on(e.mgr = m.empno)\n```\n\n### 子连接\n把一个select语句查询的结果作为另一个select语句查询的条件\n```sql\n//查询薪资高于公司的平均薪资的人\nselect * from emp where sal > (select avg(sal) from emp);\n//不能写成\nselect * from emp where sal > avg(sal)\n//因为行级过滤不能和组级过滤放在一起\n//查询谁的薪资低于20部门所有人的薪资\nselect * from emp where sal > all(select avg(sal) from emp where deptno = 20);\n//或者\nselect * from emp where sal > any(select avg(sal) from emp where deptno = 20);\n//查询谁的薪资低于20部门部分人的薪资\nselect * from emp where sal > some(select avg(sal) from emp where deptno = 20);\n```\n\n### 左，右连接\n```sql\n# 左外连接:会显示左边表的所有记录，并加上左边表和右边表符合搜索条件的记录，右表记录不足的地方记为null  \n# 比如这里的tb_user表如果存在某一个user的id不在tb_user_role这个表的user_id中，那么也会显示这一个user，不过对应的右表的数据应为null  \nselect * from tb_user u left join tb_user_role ur on(ur.user_id=u.id);  \n  \n# 右外连接:会显示右边表的所有记录，并加上左边表和右边表符合搜索条件的记录，左边表记录不足的地方记为null  \nselect * from tb_user u right join tb_user_role ur on(ur.user_id=u.id);\n```\n\n### 查看编码格式\n```sql\nshow variables like \'character_set_database\'\n```\n### 修改数据库编码\n```sql\nalter database数据库名character set字符集名，可以修改数据库编码。\n```\n### 修改表的编码\n```sql\nalter table \'表名\' default character set utf8;\n```\n\n### 修改列的数据类型\n```sql\nalter table tb_lesson  \n    modify start varchar(10) null;\n```\n\n### 删除\n```sql\ndrop table 表名;//删除表\ndelete from 表名 where 查询条件;//删除列\n```\n\n\n### insert\n```sql\ninsert into 表名 values(?, ?, ?,……);\n```\n\n### update\n```sql\nupdate 表名 set 需要修改的字段名 = 修改后的字段  where 查询条件;\nupdate 表名 set money = money - 100 where 查询条件;\n```\n### create\n```sql\ncreate table account(\n	id int primary key auto_increment,--自增长在赋值时为null\n	name varchar(32) not null default \'\',\n	balance double not null default 0\n) character set utf8;\n```\n### 事务\n**什么是事务:**\n> 事务用于保证数据的一致性，它由一组相关的dml（增删改）语句组成，改组的dml语句要么全部成功，要么全部失败。如:转账就要用事务来处理，用以保证数据的一致性。\n\n**事务和锁:**\n> 当执行事务操作时（dml语句），mysql会在表上加锁，防止其他用户修改表的数据，这对用户来说是非常重要的。\n\n**mysql数据库控制台事务的几个重要操作:**\n> start transaction 开始一个事务\n> savepoint 设置保存点\n> rollback to 回退事务\n> rollback 回退全部事务\n> commit 提交事务，所有的操作生效，不能回退\n\n**测试样例:**\n```sql\ncreate table test(\n	id int,\n	name varchar(32)\n);\nstart transaction;(或者set autocommit off)\nsavepoint a;\ninsert into test (100, \'Tom\');\nselect * from test;\nsavepoint b;\ninsert into test (200, \'Jack\');\nselect * from test;\nrollback to b;\nrollback to a;\ncommit;\n```\n\n**细节:**\n> 1. 如果不开始事务，默认情况下，dml操作是自动提交的，不能回滚。\n> 2. 如果开始一个事务，你没有创建保存点，你可以执行rollback，默认就是回退到事务开始的状态。\n> 3. 你也可以在这个事务（还没有提交时），创建多个保存点。\n> 4. 你可以在事务没有提交前，选择回退到哪个保存点。\n> 5. mysql的事务机制需要innodb的存储引擎，myisam不提供事务。\n\n### 事务的隔离级别\n**脏读:**\n> 当一个事务读取另一个事务尚未提交的修改时，产生脏读。\n\n**不可重复读:**\n> 同一查询在同一事务中多次进行，由于其他提交事务所做的**修改或删除**，每次返回不同的结果集，此时发生不可重复读。\n\n**幻读:**\n> 同一查询在同一事务中多次进行，由于其他提交事务所做的**插入**操作，每次返回不同的结果集，此时发生幻读。\n\n##### [四种隔离级别](https://blog.csdn.net/qq_42082542/article/details/123536715)\n\n**查看隔离级别**\n```sql\nselect @@tx_isolation;//查看当前会话的隔离级别\nselect @@global.tx_isolation;//查看系统当前隔离级别\n```\n\n**设置隔离级别**\n```sql\nset session transaction isolation level read uncommitted;\nset global transaction isolation leavl repeatable read;//设置系统隔离级别\n```\n\n\n\n```sql\nalter table 表名 modify column 字段名 类型//修改字段类型\nalter table 表名 modify column 字段名 类型(长度);//修改字段长度\n\n```','mysql','2023-04-25 18:12:12',NULL,9,0,0),(19,11,'python实现sha256加密','sha256加密','\n\n```python\n#给定字符串，输出加密后的十六进制字符串结果\ndef encrypt_sha256(str):  \n    hash_object = hashlib.sha256()  \n    hash_object.update(str.encode())  \n    return hash_object.hexdigest()\n```\n','sha256','2023-04-25 18:17:42',NULL,6,0,0),(20,1,'python一些函数的用法','python一些函数的用法','\n`zfill(int num)`\n```python\n# zfill(int num)\n# 多的就多了，少的就前面补0\nstr = \"this is string example....wow!!!\";\nprint(str.zfill(40));\nprint(str.zfill(50));\n#00000000this is string example....wow!!!\n#000000000000000000this is string example....wow!!!\n```\n\n\n`unhexlify(十六进制数/十六进制数的二进制形式)` <=> `a2b_hex(十六进制数的二进制形式)`\n`b2a_hex(二进制字符串)` <=> `hexlify(二进制字符串)`\n```python\nimport binascii  \nx = 0x424A447B4469664D616E63686573746572636F64657D  \n# x的长度必须是偶数，因为unhexlify是把每两个十六进制数组合成一个字节  \n# 两个16进制的数字对应转化后单个字符的ASCII码 0x42 => \'A\'# 之所以x是十六进制还要hex(x)的原因是为了能够截取x，去掉前面的0x，x原本的类型是数字，就不能用截取操作  \nprint(binascii.unhexlify(hex(x)[2:]))  \n  \nx = \'worker\'  \n# 字符转十六进制的ASCII码，注意返回的是bytes，再decode之后才是ASCII吗  \n# b\'776f726b6572\'  \nprint(binascii.b2a_hex(x.encode()))  \n# b\'776f726b6572\'  \nprint(binascii.hexlify(x.encode()))  \nx = 0x776f726b6572  \n# b\'worker\'  \nprint(binascii.unhexlify(hex(x)[2:]))  \n# b\'worker\'  \nprint(binascii.a2b_hex(hex(x)[2:].encode()))\n```\n\n`os.urandom(int a)`\n> 得到长度为 a 的随机 bytes。\n\n注意：\n将bytes类型转化为hex类型的时候，长度会变为原来的两倍。\n\n例如：\n`os.urandom(16).hex()` 实际得到的是32位的随机十六进制字符串。\n\n对十六进制字符串进行异或的方式：\n`libnum.n2s(int(str1, 16) ^ int(str2, 16))`\n其中 str1 和 str2 是16进制的两个字符串。\n\n十六进制字符串和bytes字符串的互相转换。\n```python\nimport os  \n# 得到16位bytes的字符串\nstr = os.urandom(16)  \nprint(str)  \n# 将bytes字符串转为16进制\nstr = str.hex()  \nprint(str)  \n# 将十六进制转为bytes\nprint(bytes.fromhex(str))\n```','python','2023-04-25 19:40:50',NULL,0,0,0),(21,14,'iot入门介绍','iot入门介绍','\n`RXD`\n串口数据输入\n\n`TXD`\n串口数据输出\n\n`GND`\n信号地线\n\n串行通讯是把数据排成一队，按照排队的先后顺序传输数据  \n并行通讯是每个数据自己组成一队，然后同时传输.\n\n串口服务器提供串口转网络功能，能够将RS-232/485/422串口转换成TCP/IP协议网络接口，实现RS-232/485/422串口与TCP/IP协议网络接口的数据双向透明传输。\n串口服务器就是两个无法直接通信的设备之间的转换器。\n\nGPIO（General Purpose I/O Ports）意思为通用输入/输出端口，','iot','2023-04-25 23:20:16',NULL,0,0,0),(22,14,'docker入门','docker入门','	\n# docker的三大要素\n容器（container），镜像（image），仓库（repository）\n\n容器是用镜像创建的运行实例。\n仓库是用来存放镜像文件的场所。\n\n最大的公共仓库是Docker Hub（https://hub.docker.com/)\n\n国内的公开仓库包括阿里云，网易云等。\n\n\nlinux下docker安装手册\n\nhttps://docs.docker.com/engine/install/centos/\n\n\ndocker version显示版本\ndocker images显示仓库内的镜像文件\n\n`ps -ef | grep docker | grep -v grep`\n\ndocker配置加速\nhttps://blog.csdn.net/weixin_47556601/article/details/123316884\n\n#### 看centos的版本号\n`cat /etc/redhat-release`\n`uname -r','docker','2023-04-25 23:20:49',NULL,0,0,0);
/*!40000 ALTER TABLE `tb_passage` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_passage_insert_trigger` AFTER INSERT ON `tb_passage` FOR EACH ROW begin
    insert into tb_sql_log(id, operation, time,  operation_params) values
    (null, 'insert tb_passage', now(), concat('插入的数据内容是: id = ',new.id, ', author_id = ', new.author_id,
        ', description = ', new.description, ', title = ', new.title, ', content = ', new.content,
        ', type = ', new.type, ', like_num = ', new.like_num, ', visit_num = ', new.visit_num));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_passage_update_trigger` AFTER UPDATE ON `tb_passage` FOR EACH ROW begin
    insert into tb_sql_log(id, operation, time,  operation_params) values
    (null, 'update tb_passage', now(), concat(
        '更新前的数据内容是: id = ',old.id, ', author_id = ', old.author_id,
        ', description = ', old.description, ', title = ', old.title, ', content = ', old.content,
        ', type = ', old.type, ', like_num = ', old.like_num, ', visit_num = ', old.visit_num,
        '|===|更新后的数据内容是: id = ',new.id, ', author_id = ', new.author_id,
        ', description = ', new.description, ', title = ', new.title, ', content = ', new.content,
        ', type = ', new.type, ', like_num = ', new.like_num, ', visit_num = ', new.visit_num));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_passage_delete_trigger` AFTER DELETE ON `tb_passage` FOR EACH ROW begin
    insert into tb_sql_log(id, operation, time,  operation_params) values
    (null, 'delete tb_passage', now(), concat('删除前的数据内容是: id = ',old.id, ', author_id = ', old.author_id,
        ', description = ', old.description, ', title = ', old.title, ', content = ', old.content,
        ', type = ', old.type, ', like_num = ', old.like_num, ', visit_num = ', old.visit_num));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_sql_log`
--

DROP TABLE IF EXISTS `tb_sql_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_sql_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation` text NOT NULL,
  `time` datetime NOT NULL,
  `operation_params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sql_log`
--

LOCK TABLES `tb_sql_log` WRITE;
/*!40000 ALTER TABLE `tb_sql_log` DISABLE KEYS */;
INSERT INTO `tb_sql_log` VALUES (65,'insert tb_comment','2023-04-25 23:21:15','插入的数据内容是: id = 34, passage_id = 14, content = 真好！, commentator_id = 14, commentator_username = justdoooittt, like_num = 0'),(66,'insert tb_user','2023-04-25 23:34:05','插入的数据内容是: id = 15, username = fafafafa, password = e10adc3949ba59abbe56e057f20f883e, type = user'),(67,'update tb_user','2023-04-25 23:35:28','更新后的数据内容是: id = 15, username = fafafafa, password = e10adc3949ba59abbe56e057f20f883e, type = user|===|更新后的数据内容是: id = 15, username = fafafafa, password = e10adc3949ba59abbe56e057f20f883e, type = user'),(68,'update tb_user','2023-04-25 23:36:55','更新后的数据内容是: id = 15, username = fafafafa, password = e10adc3949ba59abbe56e057f20f883e, type = user|===|更新后的数据内容是: id = 15, username = fafafafa, password = e10adc3949ba59abbe56e057f20f883e, type = user'),(69,'update tb_user','2023-04-25 23:36:58','更新后的数据内容是: id = 15, username = fafafafa, password = e10adc3949ba59abbe56e057f20f883e, type = user|===|更新后的数据内容是: id = 15, username = fafafafa, password = e10adc3949ba59abbe56e057f20f883e, type = user'),(70,'update tb_user','2023-04-25 23:39:23','更新后的数据内容是: id = 15, username = fafafafa, password = e10adc3949ba59abbe56e057f20f883e, type = user|===|更新后的数据内容是: id = 15, username = fafafafa, password = e10adc3949ba59abbe56e057f20f883e, type = user'),(46,'update tb_comment','2023-04-25 20:12:42','更新前的数据内容是: id = 30, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 0|===|更新后的数据内容是: id = 30, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 1'),(47,'update tb_comment','2023-04-25 20:12:42','更新前的数据内容是: id = 30, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 1|===|更新后的数据内容是: id = 30, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 2'),(48,'update tb_comment','2023-04-25 20:12:43','更新前的数据内容是: id = 30, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 2|===|更新后的数据内容是: id = 30, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 3'),(49,'update tb_comment','2023-04-25 20:12:43','更新前的数据内容是: id = 30, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 3|===|更新后的数据内容是: id = 30, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 4'),(50,'update tb_comment','2023-04-25 20:12:51','更新前的数据内容是: id = 31, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 0|===|更新后的数据内容是: id = 31, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 1'),(51,'update tb_comment','2023-04-25 20:12:51','更新前的数据内容是: id = 31, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 1|===|更新后的数据内容是: id = 31, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 2'),(52,'update tb_comment','2023-04-25 20:12:52','更新前的数据内容是: id = 31, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 2|===|更新后的数据内容是: id = 31, passage_id = 17, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 3'),(53,'update tb_comment','2023-04-25 20:13:02','更新前的数据内容是: id = 29, passage_id = 19, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 0|===|更新后的数据内容是: id = 29, passage_id = 19, content = 不错, commentator_id = 11, commentator_username = 2068830937, like_num = 1'),(54,'update tb_comment','2023-04-25 20:13:04','更新前的数据内容是: id = 21, passage_id = 19, content = 好好好, commentator_id = 11, commentator_username = 2068830937, like_num = 0|===|更新后的数据内容是: id = 21, passage_id = 19, content = 好好好, commentator_id = 11, commentator_username = 2068830937, like_num = 1'),(55,'update tb_comment','2023-04-25 20:13:04','更新前的数据内容是: id = 22, passage_id = 19, content = 好好好, commentator_id = 11, commentator_username = 2068830937, like_num = 0|===|更新后的数据内容是: id = 22, passage_id = 19, content = 好好好, commentator_id = 11, commentator_username = 2068830937, like_num = 1'),(56,'update tb_comment','2023-04-25 20:13:05','更新前的数据内容是: id = 24, passage_id = 19, content = 1, commentator_id = 11, commentator_username = 2068830937, like_num = 0|===|更新后的数据内容是: id = 24, passage_id = 19, content = 1, commentator_id = 11, commentator_username = 2068830937, like_num = 1'),(57,'insert tb_user','2023-04-25 23:16:42','插入的数据内容是: id = 14, username = justdoooittt, password = e10adc3949ba59abbe56e057f20f883e, type = user'),(58,'update tb_user','2023-04-25 23:18:34','更新后的数据内容是: id = 14, username = justdoooittt, password = e10adc3949ba59abbe56e057f20f883e, type = user|===|更新后的数据内容是: id = 14, username = justdoooittt, password = e10adc3949ba59abbe56e057f20f883e, type = user'),(59,'update tb_user','2023-04-25 23:19:23','更新后的数据内容是: id = 14, username = justdoooittt, password = e10adc3949ba59abbe56e057f20f883e, type = user|===|更新后的数据内容是: id = 14, username = justdoooittt, password = e10adc3949ba59abbe56e057f20f883e, type = user'),(60,'insert tb_passage','2023-04-25 23:20:15','插入的数据内容是: id = 21, author_id = 14, description = iot入门介绍, title = iot入门介绍, content = \n`RXD`\n串口数据输入\n\n`TXD`\n串口数据输出\n\n`GND`\n信号地线\n\n串行通讯是把数据排成一队，按照排队的先后顺序传输数据  \n并行通讯是每个数据自己组成一队，然后同时传输.\n\n串口服务器提供串口转网络功能，能够将RS-232/485/422串口转换成TCP/IP协议网络接口，实现RS-232/485/422串口与TCP/IP协议网络接口的数据双向透明传输。\n串口服务器就是两个无法直接通信的设备之间的转换器。\n\nGPIO（General Purpose I/O Ports）意思为通用输入/输出端口，, type = iot, like_num = 0, visit_num = 0'),(61,'insert tb_passage','2023-04-25 23:20:49','插入的数据内容是: id = 22, author_id = 14, description = docker入门, title = docker入门, content = 	\n# docker的三大要素\n容器（container），镜像（image），仓库（repository）\n\n容器是用镜像创建的运行实例。\n仓库是用来存放镜像文件的场所。\n\n最大的公共仓库是Docker Hub（https://hub.docker.com/)\n\n国内的公开仓库包括阿里云，网易云等。\n\n\nlinux下docker安装手册\n\nhttps://docs.docker.com/engine/install/centos/\n\n\ndocker version显示版本\ndocker images显示仓库内的镜像文件\n\n`ps -ef | grep docker | grep -v grep`\n\ndocker配置加速\nhttps://blog.csdn.net/weixin_47556601/article/details/123316884\n\n#### 看centos的版本号\n`cat /etc/redhat-release`\n`uname -r, type = docker, like_num = 0, visit_num = 0'),(62,'update tb_passage','2023-04-25 23:21:09','更新前的数据内容是: id = 14, author_id = 11, description = shiro的入门介绍, title = Shiro, content = ```text\n官网\nhttps://shiro.apache.org/\n中文指南手册\nhttp://greycode.github.io/shiro/doc/reference.html\nhttps://www.w3cschool.cn/shiro/xgj31if4.html\n```\n\n# 简介\n`shiro` 是 `apache` 的一个开源框架，是一个权限管理的框架，实现用户认证、用户授权。`spring` 中有 `spring security` (原名 `Acegi` )，是一个权限框架，它和 `spring` 依赖过于紧密，没有 `shiro` 使用简单。 `shiro` 不依赖于 `spring` ，`shiro` 不仅可以实现 `web` 应用的权限管理，还可以实现 `c/s` 系统，分布式系统权限管理，`shiro` 属于轻量框架，越来越多企业项目开始使用 `shiro` 。\n\n\n# 坐标\n```xml\n<dependency>  \n  <groupId>org.apache.shiro</groupId>  \n  <artifactId>shiro-core</artifactId>  \n  <version>1.1.0</version>  \n</dependency>  \n<!-- Shiro uses SLF4J for logging.  We\'ll use the \'simple\' binding  \n     in this example app.  See http://www.slf4j.org for more info. -->\n<dependency>  \n  <groupId>org.slf4j</groupId>  \n  <artifactId>slf4j-simple</artifactId>  \n  <version>1.6.1</version>  \n  <scope>test</scope>  \n</dependency>\n```\n\n# 入门案例\n\n```ini\n[users]  \nzhangsan=z3,role1,role2  \nlisi=l4  \n  \n[roles]  \nrole1=user:insert,user:select\n```\n\n```java\npackage com.just;  \n  \nimport org.apache.shiro.SecurityUtils;  \nimport org.apache.shiro.authc.*;  \nimport org.apache.shiro.config.IniSecurityManagerFactory;  \nimport org.apache.shiro.mgt.SecurityManager;  \nimport org.apache.shiro.subject.Subject;  \n  \npublic class ShrioRun {  \n    public static void main(String[] args) {  \n        // 通过ini文件实现认证登录,后期会利用数据库实现认证登录  \n        // 初始化获取SecurityManager  \n        IniSecurityManagerFactory factory = new IniSecurityManagerFactory(\"classpath:shiro.ini\");  \n        SecurityManager securityManager = factory.getInstance();  \n        SecurityUtils.setSecurityManager(securityManager);  \n        // 获取Subject对象  \n        Subject subject = SecurityUtils.getSubject();  \n        // 模拟前端获取token  \n        AuthenticationToken token = new UsernamePasswordToken(\"zhangsan\", \"z3\");  \n        System.out.println(token);  \n        // 完成登  \n        try{  \n            subject.login(token);  \n            System.out.println(\"登录成功\");  \n            // 判断角色  \n            boolean hasRole = subject.hasRole(\"role1\");  \n            System.out.println(\"是否拥有此角色:\" + hasRole);  \n            // 判断权限  \n            boolean permitted1 = subject.isPermitted(\"user:insert\");  \n            System.out.println(\"是否有用户的插入权限:\" + permitted1);  \n            boolean permitted2 = subject.isPermitted(\"user:select\");  \n            System.out.println(\"是否有用户的查找权限:\" + permitted2);  \n            // 也可以用checkPermission方法，此方法没有返回值，没权限抛AuthenticationException  \n//            subject.checkPermission(\"user:delete\");  \n  \n        }catch (UnknownAccountException e){  \n            e.printStackTrace();  \n            System.out.println(\"用户不存在\");  \n        }catch (IncorrectCredentialsException e){  \n            e.printStackTrace();  \n            System.out.println(\"密码错误\");  \n        }catch (AuthenticationException e){  \n            e.printStackTrace();  \n            System.out.println(\"登录失败\");  \n        }  \n    }  \n}\n```, type = shiro, like_num = 0, visit_num = 0|===|更新后的数据内容是: id = 14, author_id = 11, description = shiro的入门介绍, title = Shiro, content = ```text\n官网\nhttps://shiro.apache.org/\n中文指南手册\nhttp://greycode.github.io/shiro/doc/reference.html\nhttps://www.w3cschool.cn/shiro/xgj31if4.html\n```\n\n# 简介\n`shiro` 是 `apache` 的一个开源框架，是一个权限管理的框架，实现用户认证、用户授权。`spring` 中有 `spring security` (原名 `Acegi` )，是一个权限框架，它和 `spring` 依赖过于紧密，没有 `shiro` 使用简单。 `shiro` 不依赖于 `spring` ，`shiro` 不仅可以实现 `web` 应用的权限管理，还可以实现 `c/s` 系统，分布式系统权限管理，`shiro` 属于轻量框架，越来越多企业项目开始使用 `shiro` 。\n\n\n# 坐标\n```xml\n<dependency>  \n  <groupId>org.apache.shiro</groupId>  \n  <artifactId>shiro-core</artifactId>  \n  <version>1.1.0</version>  \n</dependency>  \n<!-- Shiro uses SLF4J for logging.  We\'ll use the \'simple\' binding  \n     in this example app.  See http://www.slf4j.org for more info. -->\n<dependency>  \n  <groupId>org.slf4j</groupId>  \n  <artifactId>slf4j-simple</artifactId>  \n  <version>1.6.1</version>  \n  <scope>test</scope>  \n</dependency>\n```\n\n# 入门案例\n\n```ini\n[users]  \nzhangsan=z3,role1,role2  \nlisi=l4  \n  \n[roles]  \nrole1=user:insert,user:select\n```\n\n```java\npackage com.just;  \n  \nimport org.apache.shiro.SecurityUtils;  \nimport org.apache.shiro.authc.*;  \nimport org.apache.shiro.config.IniSecurityManagerFactory;  \nimport org.apache.shiro.mgt.SecurityManager;  \nimport org.apache.shiro.subject.Subject;  \n  \npublic class ShrioRun {  \n    public static void main(String[] args) {  \n        // 通过ini文件实现认证登录,后期会利用数据库实现认证登录  \n        // 初始化获取SecurityManager  \n        IniSecurityManagerFactory factory = new IniSecurityManagerFactory(\"classpath:shiro.ini\");  \n        SecurityManager securityManager = factory.getInstance();  \n        SecurityUtils.setSecurityManager(securityManager);  \n        // 获取Subject对象  \n        Subject subject = SecurityUtils.getSubject();  \n        // 模拟前端获取token  \n        AuthenticationToken token = new UsernamePasswordToken(\"zhangsan\", \"z3\");  \n        System.out.println(token);  \n        // 完成登  \n        try{  \n            subject.login(token);  \n            System.out.println(\"登录成功\");  \n            // 判断角色  \n            boolean hasRole = subject.hasRole(\"role1\");  \n            System.out.println(\"是否拥有此角色:\" + hasRole);  \n            // 判断权限  \n            boolean permitted1 = subject.isPermitted(\"user:insert\");  \n            System.out.println(\"是否有用户的插入权限:\" + permitted1);  \n            boolean permitted2 = subject.isPermitted(\"user:select\");  \n            System.out.println(\"是否有用户的查找权限:\" + permitted2);  \n            // 也可以用checkPermission方法，此方法没有返回值，没权限抛AuthenticationException  \n//            subject.checkPermission(\"user:delete\");  \n  \n        }catch (UnknownAccountException e){  \n            e.printStackTrace();  \n            System.out.println(\"用户不存在\");  \n        }catch (IncorrectCredentialsException e){  \n            e.printStackTrace();  \n            System.out.println(\"密码错误\");  \n        }catch (AuthenticationException e){  \n            e.printStackTrace();  \n            System.out.println(\"登录失败\");  \n        }  \n    }  \n}\n```, type = shiro, like_num = 1, visit_num = 0'),(63,'update tb_passage','2023-04-25 23:21:10','更新前的数据内容是: id = 14, author_id = 11, description = shiro的入门介绍, title = Shiro, content = ```text\n官网\nhttps://shiro.apache.org/\n中文指南手册\nhttp://greycode.github.io/shiro/doc/reference.html\nhttps://www.w3cschool.cn/shiro/xgj31if4.html\n```\n\n# 简介\n`shiro` 是 `apache` 的一个开源框架，是一个权限管理的框架，实现用户认证、用户授权。`spring` 中有 `spring security` (原名 `Acegi` )，是一个权限框架，它和 `spring` 依赖过于紧密，没有 `shiro` 使用简单。 `shiro` 不依赖于 `spring` ，`shiro` 不仅可以实现 `web` 应用的权限管理，还可以实现 `c/s` 系统，分布式系统权限管理，`shiro` 属于轻量框架，越来越多企业项目开始使用 `shiro` 。\n\n\n# 坐标\n```xml\n<dependency>  \n  <groupId>org.apache.shiro</groupId>  \n  <artifactId>shiro-core</artifactId>  \n  <version>1.1.0</version>  \n</dependency>  \n<!-- Shiro uses SLF4J for logging.  We\'ll use the \'simple\' binding  \n     in this example app.  See http://www.slf4j.org for more info. -->\n<dependency>  \n  <groupId>org.slf4j</groupId>  \n  <artifactId>slf4j-simple</artifactId>  \n  <version>1.6.1</version>  \n  <scope>test</scope>  \n</dependency>\n```\n\n# 入门案例\n\n```ini\n[users]  \nzhangsan=z3,role1,role2  \nlisi=l4  \n  \n[roles]  \nrole1=user:insert,user:select\n```\n\n```java\npackage com.just;  \n  \nimport org.apache.shiro.SecurityUtils;  \nimport org.apache.shiro.authc.*;  \nimport org.apache.shiro.config.IniSecurityManagerFactory;  \nimport org.apache.shiro.mgt.SecurityManager;  \nimport org.apache.shiro.subject.Subject;  \n  \npublic class ShrioRun {  \n    public static void main(String[] args) {  \n        // 通过ini文件实现认证登录,后期会利用数据库实现认证登录  \n        // 初始化获取SecurityManager  \n        IniSecurityManagerFactory factory = new IniSecurityManagerFactory(\"classpath:shiro.ini\");  \n        SecurityManager securityManager = factory.getInstance();  \n        SecurityUtils.setSecurityManager(securityManager);  \n        // 获取Subject对象  \n        Subject subject = SecurityUtils.getSubject();  \n        // 模拟前端获取token  \n        AuthenticationToken token = new UsernamePasswordToken(\"zhangsan\", \"z3\");  \n        System.out.println(token);  \n        // 完成登  \n        try{  \n            subject.login(token);  \n            System.out.println(\"登录成功\");  \n            // 判断角色  \n            boolean hasRole = subject.hasRole(\"role1\");  \n            System.out.println(\"是否拥有此角色:\" + hasRole);  \n            // 判断权限  \n            boolean permitted1 = subject.isPermitted(\"user:insert\");  \n            System.out.println(\"是否有用户的插入权限:\" + permitted1);  \n            boolean permitted2 = subject.isPermitted(\"user:select\");  \n            System.out.println(\"是否有用户的查找权限:\" + permitted2);  \n            // 也可以用checkPermission方法，此方法没有返回值，没权限抛AuthenticationException  \n//            subject.checkPermission(\"user:delete\");  \n  \n        }catch (UnknownAccountException e){  \n            e.printStackTrace();  \n            System.out.println(\"用户不存在\");  \n        }catch (IncorrectCredentialsException e){  \n            e.printStackTrace();  \n            System.out.println(\"密码错误\");  \n        }catch (AuthenticationException e){  \n            e.printStackTrace();  \n            System.out.println(\"登录失败\");  \n        }  \n    }  \n}\n```, type = shiro, like_num = 1, visit_num = 0|===|更新后的数据内容是: id = 14, author_id = 11, description = shiro的入门介绍, title = Shiro, content = ```text\n官网\nhttps://shiro.apache.org/\n中文指南手册\nhttp://greycode.github.io/shiro/doc/reference.html\nhttps://www.w3cschool.cn/shiro/xgj31if4.html\n```\n\n# 简介\n`shiro` 是 `apache` 的一个开源框架，是一个权限管理的框架，实现用户认证、用户授权。`spring` 中有 `spring security` (原名 `Acegi` )，是一个权限框架，它和 `spring` 依赖过于紧密，没有 `shiro` 使用简单。 `shiro` 不依赖于 `spring` ，`shiro` 不仅可以实现 `web` 应用的权限管理，还可以实现 `c/s` 系统，分布式系统权限管理，`shiro` 属于轻量框架，越来越多企业项目开始使用 `shiro` 。\n\n\n# 坐标\n```xml\n<dependency>  \n  <groupId>org.apache.shiro</groupId>  \n  <artifactId>shiro-core</artifactId>  \n  <version>1.1.0</version>  \n</dependency>  \n<!-- Shiro uses SLF4J for logging.  We\'ll use the \'simple\' binding  \n     in this example app.  See http://www.slf4j.org for more info. -->\n<dependency>  \n  <groupId>org.slf4j</groupId>  \n  <artifactId>slf4j-simple</artifactId>  \n  <version>1.6.1</version>  \n  <scope>test</scope>  \n</dependency>\n```\n\n# 入门案例\n\n```ini\n[users]  \nzhangsan=z3,role1,role2  \nlisi=l4  \n  \n[roles]  \nrole1=user:insert,user:select\n```\n\n```java\npackage com.just;  \n  \nimport org.apache.shiro.SecurityUtils;  \nimport org.apache.shiro.authc.*;  \nimport org.apache.shiro.config.IniSecurityManagerFactory;  \nimport org.apache.shiro.mgt.SecurityManager;  \nimport org.apache.shiro.subject.Subject;  \n  \npublic class ShrioRun {  \n    public static void main(String[] args) {  \n        // 通过ini文件实现认证登录,后期会利用数据库实现认证登录  \n        // 初始化获取SecurityManager  \n        IniSecurityManagerFactory factory = new IniSecurityManagerFactory(\"classpath:shiro.ini\");  \n        SecurityManager securityManager = factory.getInstance();  \n        SecurityUtils.setSecurityManager(securityManager);  \n        // 获取Subject对象  \n        Subject subject = SecurityUtils.getSubject();  \n        // 模拟前端获取token  \n        AuthenticationToken token = new UsernamePasswordToken(\"zhangsan\", \"z3\");  \n        System.out.println(token);  \n        // 完成登  \n        try{  \n            subject.login(token);  \n            System.out.println(\"登录成功\");  \n            // 判断角色  \n            boolean hasRole = subject.hasRole(\"role1\");  \n            System.out.println(\"是否拥有此角色:\" + hasRole);  \n            // 判断权限  \n            boolean permitted1 = subject.isPermitted(\"user:insert\");  \n            System.out.println(\"是否有用户的插入权限:\" + permitted1);  \n            boolean permitted2 = subject.isPermitted(\"user:select\");  \n            System.out.println(\"是否有用户的查找权限:\" + permitted2);  \n            // 也可以用checkPermission方法，此方法没有返回值，没权限抛AuthenticationException  \n//            subject.checkPermission(\"user:delete\");  \n  \n        }catch (UnknownAccountException e){  \n            e.printStackTrace();  \n            System.out.println(\"用户不存在\");  \n        }catch (IncorrectCredentialsException e){  \n            e.printStackTrace();  \n            System.out.println(\"密码错误\");  \n        }catch (AuthenticationException e){  \n            e.printStackTrace();  \n            System.out.println(\"登录失败\");  \n        }  \n    }  \n}\n```, type = shiro, like_num = 2, visit_num = 0'),(64,'update tb_passage','2023-04-25 23:21:10','更新前的数据内容是: id = 14, author_id = 11, description = shiro的入门介绍, title = Shiro, content = ```text\n官网\nhttps://shiro.apache.org/\n中文指南手册\nhttp://greycode.github.io/shiro/doc/reference.html\nhttps://www.w3cschool.cn/shiro/xgj31if4.html\n```\n\n# 简介\n`shiro` 是 `apache` 的一个开源框架，是一个权限管理的框架，实现用户认证、用户授权。`spring` 中有 `spring security` (原名 `Acegi` )，是一个权限框架，它和 `spring` 依赖过于紧密，没有 `shiro` 使用简单。 `shiro` 不依赖于 `spring` ，`shiro` 不仅可以实现 `web` 应用的权限管理，还可以实现 `c/s` 系统，分布式系统权限管理，`shiro` 属于轻量框架，越来越多企业项目开始使用 `shiro` 。\n\n\n# 坐标\n```xml\n<dependency>  \n  <groupId>org.apache.shiro</groupId>  \n  <artifactId>shiro-core</artifactId>  \n  <version>1.1.0</version>  \n</dependency>  \n<!-- Shiro uses SLF4J for logging.  We\'ll use the \'simple\' binding  \n     in this example app.  See http://www.slf4j.org for more info. -->\n<dependency>  \n  <groupId>org.slf4j</groupId>  \n  <artifactId>slf4j-simple</artifactId>  \n  <version>1.6.1</version>  \n  <scope>test</scope>  \n</dependency>\n```\n\n# 入门案例\n\n```ini\n[users]  \nzhangsan=z3,role1,role2  \nlisi=l4  \n  \n[roles]  \nrole1=user:insert,user:select\n```\n\n```java\npackage com.just;  \n  \nimport org.apache.shiro.SecurityUtils;  \nimport org.apache.shiro.authc.*;  \nimport org.apache.shiro.config.IniSecurityManagerFactory;  \nimport org.apache.shiro.mgt.SecurityManager;  \nimport org.apache.shiro.subject.Subject;  \n  \npublic class ShrioRun {  \n    public static void main(String[] args) {  \n        // 通过ini文件实现认证登录,后期会利用数据库实现认证登录  \n        // 初始化获取SecurityManager  \n        IniSecurityManagerFactory factory = new IniSecurityManagerFactory(\"classpath:shiro.ini\");  \n        SecurityManager securityManager = factory.getInstance();  \n        SecurityUtils.setSecurityManager(securityManager);  \n        // 获取Subject对象  \n        Subject subject = SecurityUtils.getSubject();  \n        // 模拟前端获取token  \n        AuthenticationToken token = new UsernamePasswordToken(\"zhangsan\", \"z3\");  \n        System.out.println(token);  \n        // 完成登  \n        try{  \n            subject.login(token);  \n            System.out.println(\"登录成功\");  \n            // 判断角色  \n            boolean hasRole = subject.hasRole(\"role1\");  \n            System.out.println(\"是否拥有此角色:\" + hasRole);  \n            // 判断权限  \n            boolean permitted1 = subject.isPermitted(\"user:insert\");  \n            System.out.println(\"是否有用户的插入权限:\" + permitted1);  \n            boolean permitted2 = subject.isPermitted(\"user:select\");  \n            System.out.println(\"是否有用户的查找权限:\" + permitted2);  \n            // 也可以用checkPermission方法，此方法没有返回值，没权限抛AuthenticationException  \n//            subject.checkPermission(\"user:delete\");  \n  \n        }catch (UnknownAccountException e){  \n            e.printStackTrace();  \n            System.out.println(\"用户不存在\");  \n        }catch (IncorrectCredentialsException e){  \n            e.printStackTrace();  \n            System.out.println(\"密码错误\");  \n        }catch (AuthenticationException e){  \n            e.printStackTrace();  \n            System.out.println(\"登录失败\");  \n        }  \n    }  \n}\n```, type = shiro, like_num = 2, visit_num = 0|===|更新后的数据内容是: id = 14, author_id = 11, description = shiro的入门介绍, title = Shiro, content = ```text\n官网\nhttps://shiro.apache.org/\n中文指南手册\nhttp://greycode.github.io/shiro/doc/reference.html\nhttps://www.w3cschool.cn/shiro/xgj31if4.html\n```\n\n# 简介\n`shiro` 是 `apache` 的一个开源框架，是一个权限管理的框架，实现用户认证、用户授权。`spring` 中有 `spring security` (原名 `Acegi` )，是一个权限框架，它和 `spring` 依赖过于紧密，没有 `shiro` 使用简单。 `shiro` 不依赖于 `spring` ，`shiro` 不仅可以实现 `web` 应用的权限管理，还可以实现 `c/s` 系统，分布式系统权限管理，`shiro` 属于轻量框架，越来越多企业项目开始使用 `shiro` 。\n\n\n# 坐标\n```xml\n<dependency>  \n  <groupId>org.apache.shiro</groupId>  \n  <artifactId>shiro-core</artifactId>  \n  <version>1.1.0</version>  \n</dependency>  \n<!-- Shiro uses SLF4J for logging.  We\'ll use the \'simple\' binding  \n     in this example app.  See http://www.slf4j.org for more info. -->\n<dependency>  \n  <groupId>org.slf4j</groupId>  \n  <artifactId>slf4j-simple</artifactId>  \n  <version>1.6.1</version>  \n  <scope>test</scope>  \n</dependency>\n```\n\n# 入门案例\n\n```ini\n[users]  \nzhangsan=z3,role1,role2  \nlisi=l4  \n  \n[roles]  \nrole1=user:insert,user:select\n```\n\n```java\npackage com.just;  \n  \nimport org.apache.shiro.SecurityUtils;  \nimport org.apache.shiro.authc.*;  \nimport org.apache.shiro.config.IniSecurityManagerFactory;  \nimport org.apache.shiro.mgt.SecurityManager;  \nimport org.apache.shiro.subject.Subject;  \n  \npublic class ShrioRun {  \n    public static void main(String[] args) {  \n        // 通过ini文件实现认证登录,后期会利用数据库实现认证登录  \n        // 初始化获取SecurityManager  \n        IniSecurityManagerFactory factory = new IniSecurityManagerFactory(\"classpath:shiro.ini\");  \n        SecurityManager securityManager = factory.getInstance();  \n        SecurityUtils.setSecurityManager(securityManager);  \n        // 获取Subject对象  \n        Subject subject = SecurityUtils.getSubject();  \n        // 模拟前端获取token  \n        AuthenticationToken token = new UsernamePasswordToken(\"zhangsan\", \"z3\");  \n        System.out.println(token);  \n        // 完成登  \n        try{  \n            subject.login(token);  \n            System.out.println(\"登录成功\");  \n            // 判断角色  \n            boolean hasRole = subject.hasRole(\"role1\");  \n            System.out.println(\"是否拥有此角色:\" + hasRole);  \n            // 判断权限  \n            boolean permitted1 = subject.isPermitted(\"user:insert\");  \n            System.out.println(\"是否有用户的插入权限:\" + permitted1);  \n            boolean permitted2 = subject.isPermitted(\"user:select\");  \n            System.out.println(\"是否有用户的查找权限:\" + permitted2);  \n            // 也可以用checkPermission方法，此方法没有返回值，没权限抛AuthenticationException  \n//            subject.checkPermission(\"user:delete\");  \n  \n        }catch (UnknownAccountException e){  \n            e.printStackTrace();  \n            System.out.println(\"用户不存在\");  \n        }catch (IncorrectCredentialsException e){  \n            e.printStackTrace();  \n            System.out.println(\"密码错误\");  \n        }catch (AuthenticationException e){  \n            e.printStackTrace();  \n            System.out.println(\"登录失败\");  \n        }  \n    }  \n}\n```, type = shiro, like_num = 3, visit_num = 0');
/*!40000 ALTER TABLE `tb_sql_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(300) NOT NULL,
  `type` enum('admin','user','visitor') NOT NULL DEFAULT 'user',
  `phone` varchar(20) DEFAULT '',
  `email` varchar(30) DEFAULT '',
  `age` int(11) DEFAULT NULL,
  `sex` varchar(3) DEFAULT '0',
  `location` varchar(100) DEFAULT '',
  `avatar` varchar(1000) DEFAULT '',
  `last_login` datetime DEFAULT NULL,
  `register_time` datetime NOT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `ps` text,
  `intro` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'zhangsan','e10adc3949ba59abbe56e057f20f883e','user','12345678901','111@qq.com',12,'男','武汉','http://pic.imeitou.com/uploads/allimg/210107/3-21010G34P0.jpg',NULL,'2023-04-12 12:21:12',0,NULL,'哈哈哈'),(2,'helloworld','e10adc3949ba59abbe56e057f20f883e','user','','',NULL,'0','','',NULL,'2023-04-25 17:50:57',0,NULL,NULL),(11,'2068830937','e10adc3949ba59abbe56e057f20f883e','admin','','',0,'0','武汉','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202106%2F13%2F20210613235426_7a793.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1685009264&t=94b75a59f6a3718d79dea7c02ac7242f',NULL,'2023-04-25 17:58:25',0,'冲冲冲！','欢迎认识！'),(13,'12345678','e10adc3949ba59abbe56e057f20f883e','user','','',21,'女','广州','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202105%2F07%2F20210507020822_4c172.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1685014950&t=f2cafb35795ecab561b26a965632146c',NULL,'2023-04-25 19:41:36',0,'来玩！','白羊座~'),(14,'justdoooittt','e10adc3949ba59abbe56e057f20f883e','user','1111222233334','20111@qq.com',14,'男','北京','http://pic.imeitou.com/uploads/allimg/210107/3-21010G34925.jpg',NULL,'2023-04-25 23:16:42',0,'开心向前冲！','我就是我！'),(15,'fafafafa','e10adc3949ba59abbe56e057f20f883e','user','1111222233335','111@qq.com',0,'0','湖北','http://pic.imeitou.com/uploads/allimg/210107/3-21010G34R9.jpg',NULL,'2023-04-25 23:34:06',0,'射手座~','来日可期');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_user_insert_trigger` AFTER INSERT ON `tb_user` FOR EACH ROW begin
    insert into tb_sql_log(id, operation, time,  operation_params) values
    (null, 'insert tb_user', now(), concat('插入的数据内容是: id = ',new.id, ', username = ', new.username,', password = ',
        new.password, ', type = ', new.type));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_user_update_trigger` AFTER UPDATE ON `tb_user` FOR EACH ROW begin
    insert into tb_sql_log(id, operation, time,  operation_params) values
    (null, 'update tb_user', now(), concat(
        '更新后的数据内容是: id = ',old.id, ', username = ', old.username,', password = ',
        old.password, ', type = ', old.type,
        '|===|更新后的数据内容是: id = ',new.id, ', username = ', new.username,', password = ',
        new.password, ', type = ', new.type));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_user_delete_trigger` AFTER DELETE ON `tb_user` FOR EACH ROW begin
    insert into tb_sql_log(id, operation, time,  operation_params) values
    (null, 'delete tb_user', now(), concat('删除前的数据内容是: id = ',old.id, ', username = ', old.username,', password = ',
        old.password, ', type = ', old.type));
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-25 23:49:34
