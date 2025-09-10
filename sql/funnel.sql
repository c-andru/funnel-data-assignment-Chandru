-- Create the database
create database if not exists Funnel_Data;
use Funnel_Data;

-- EVENTS
drop table if exists events;
create table Events (
   session_id varchar(100),
   user_id varchar(100),
   ts datetime,
   event_name enum('Loaded','Interact','Clicks','Purchase'),
   device varchar(50),
   app_id varchar(100)
);

-- MESSAGES
drop table if exists Messages;
create table messages (
   session_id varchar(100),
   ts datetime,
   text text,
   detected_intent varchar(255)
);

-- ORDERS
drop table if exists ORDERS;
create table orders (
   order_id varchar(100) primary key,
   session_id varchar(100),
   created_at datetime,
   canceled_at datetime,
   order_value decimal(10,2)
);

-- PRODUCTS
drop table if exists products;
create table Products (
   product_id varchar(100) primary key,
   title varchar(255),
   price decimal(10,2)
);

-- INVENTORY
drop table if exists INVENTORY;
create table inventory (
   product_id varchar(100),
   in_stock int,
   eta_days int
);

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100000','U1081','2025-08-14 16:25:56','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100000','U1081','2025-08-14 16:27:43','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100000','U1081','2025-08-14 16:29:20','Clicks','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100001','U1003','2025-09-01 21:10:12','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100002','U1027','2025-08-05 20:03:24','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100002','U1027','2025-08-05 20:06:18','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100002','U1027','2025-08-05 20:11:09','Clicks','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100002','U1027','2025-08-05 20:18:43','Purchase','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100003','U1008','2025-08-12 09:31:14','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100004','U1012','2025-08-23 08:15:40','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100004','U1012','2025-08-23 08:17:50','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100004','U1012','2025-08-23 08:21:32','Clicks','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100004','U1012','2025-08-23 08:32:13','Purchase','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100005','U1028','2025-08-12 10:51:37','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100006','U1040','2025-08-25 13:38:47','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100006','U1040','2025-08-25 13:44:16','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100006','U1040','2025-08-25 13:46:31','Clicks','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100007','U1068','2025-08-29 17:05:31','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100007','U1068','2025-08-29 17:09:56','Interact','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100007','U1068','2025-08-29 17:12:28','Clicks','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100008','U1059','2025-08-01 21:22:34','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100009','U1020','2025-09-05 09:17:53','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100010','U1022','2025-08-15 19:42:48','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100011','U1019','2025-08-27 12:25:19','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100012','U1076','2025-08-02 06:41:31','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100012','U1076','2025-08-02 06:44:27','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100013','U1072','2025-09-05 20:44:02','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100013','U1072','2025-09-05 20:44:50','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100013','U1072','2025-09-05 20:46:58','Clicks','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100014','U1069','2025-08-16 11:10:32','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100014','U1069','2025-08-16 11:16:13','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100014','U1069','2025-08-16 11:23:20','Clicks','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100014','U1069','2025-08-16 11:24:41','Purchase','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100015','U1008','2025-08-04 18:33:17','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100015','U1008','2025-08-04 18:35:59','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100015','U1008','2025-08-04 18:38:45','Clicks','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100016','U1052','2025-08-06 00:55:57','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100017','U1006','2025-08-20 21:05:16','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100018','U1068','2025-08-21 19:31:39','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100018','U1068','2025-08-21 19:34:54','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100019','U1030','2025-08-24 21:48:46','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100019','U1030','2025-08-24 21:52:43','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100019','U1030','2025-08-24 21:58:43','Clicks','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100020','U1058','2025-09-04 03:35:16','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100021','U1007','2025-08-16 13:22:33','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100021','U1007','2025-08-16 13:27:03','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100021','U1007','2025-08-16 13:29:06','Clicks','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100022','U1051','2025-08-13 06:51:42','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100022','U1051','2025-08-13 06:52:21','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100022','U1051','2025-08-13 06:58:20','Clicks','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100022','U1051','2025-08-13 07:09:05','Purchase','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100023','U1050','2025-09-01 16:03:46','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100023','U1050','2025-09-01 16:06:45','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100024','U1079','2025-08-27 10:23:22','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100024','U1079','2025-08-27 10:25:30','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100025','U1047','2025-08-22 14:31:19','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100026','U1017','2025-08-06 12:42:21','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100027','U1006','2025-08-21 21:30:05','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100028','U1054','2025-08-04 23:39:55','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100029','U1047','2025-08-07 12:29:05','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100029','U1047','2025-08-07 12:32:02','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100030','U1026','2025-08-06 07:45:47','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100030','U1026','2025-08-06 07:50:43','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100031','U1052','2025-08-17 11:01:26','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100032','U1034','2025-08-06 13:56:25','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100032','U1034','2025-08-06 13:57:19','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100032','U1034','2025-08-06 14:01:11','Clicks','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100033','U1029','2025-09-02 08:59:39','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100033','U1029','2025-09-02 09:01:56','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100034','U1068','2025-08-06 22:22:58','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100035','U1033','2025-08-14 05:17:26','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100035','U1033','2025-08-14 05:21:53','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100035','U1033','2025-08-14 05:27:20','Clicks','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100036','U1068','2025-08-22 06:29:52','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100036','U1068','2025-08-22 06:35:50','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100036','U1068','2025-08-22 06:41:32','Clicks','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100037','U1052','2025-09-04 04:18:24','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100037','U1052','2025-09-04 04:19:36','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100037','U1052','2025-09-04 04:26:19','Clicks','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100038','U1026','2025-08-30 18:48:43','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100039','U1060','2025-08-05 10:47:38','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100039','U1060','2025-08-05 10:53:18','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100040','U1025','2025-08-03 13:50:34','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100040','U1025','2025-08-03 13:54:13','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100041','U1063','2025-08-08 11:55:59','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100042','U1013','2025-08-09 20:55:22','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100043','U1076','2025-08-31 01:47:30','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100044','U1031','2025-08-24 20:35:47','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100044','U1031','2025-08-24 20:38:15','Interact','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100044','U1031','2025-08-24 20:42:30','Clicks','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100044','U1031','2025-08-24 20:48:27','Purchase','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100045','U1026','2025-08-29 16:30:06','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100046','U1073','2025-08-01 14:52:09','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100047','U1053','2025-08-11 23:38:41','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100047','U1053','2025-08-11 23:41:42','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100047','U1053','2025-08-11 23:48:28','Clicks','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100047','U1053','2025-08-11 23:56:26','Purchase','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100048','U1068','2025-08-30 01:36:18','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100048','U1068','2025-08-30 01:36:23','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100049','U1048','2025-08-23 09:45:47','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100049','U1048','2025-08-23 09:49:04','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100050','U1069','2025-08-12 05:14:15','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100051','U1030','2025-09-02 19:58:33','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100051','U1030','2025-09-02 20:00:02','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100052','U1014','2025-08-06 13:56:39','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100052','U1014','2025-08-06 13:59:15','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100053','U1075','2025-09-04 04:17:19','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100054','U1044','2025-08-19 07:44:46','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100054','U1044','2025-08-19 07:50:07','Interact','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100054','U1044','2025-08-19 07:56:59','Clicks','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100055','U1081','2025-08-08 18:14:51','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100055','U1081','2025-08-08 18:20:24','Interact','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100056','U1041','2025-08-14 20:58:29','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100057','U1072','2025-08-02 17:26:16','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100057','U1072','2025-08-02 17:28:27','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100057','U1072','2025-08-02 17:34:18','Clicks','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100057','U1072','2025-08-02 17:39:14','Purchase','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100058','U1060','2025-08-02 04:05:23','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100058','U1060','2025-08-02 04:06:48','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100059','U1045','2025-08-16 05:14:30','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100059','U1045','2025-08-16 05:15:16','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100059','U1045','2025-08-16 05:17:03','Clicks','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100060','U1075','2025-08-10 18:09:48','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100060','U1075','2025-08-10 18:11:59','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100060','U1075','2025-08-10 18:14:16','Clicks','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100060','U1075','2025-08-10 18:14:51','Purchase','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100061','U1060','2025-08-17 20:57:04','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100061','U1060','2025-08-17 20:57:20','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100062','U1008','2025-08-04 22:18:43','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100062','U1008','2025-08-04 22:23:46','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100062','U1008','2025-08-04 22:27:51','Clicks','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100063','U1079','2025-08-19 19:10:21','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100063','U1079','2025-08-19 19:13:40','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100064','U1079','2025-08-06 03:36:55','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100065','U1000','2025-09-03 19:10:32','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100065','U1000','2025-09-03 19:12:34','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100065','U1000','2025-09-03 19:17:18','Clicks','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100066','U1025','2025-08-27 18:27:40','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100066','U1025','2025-08-27 18:29:38','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100066','U1025','2025-08-27 18:31:42','Clicks','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100066','U1025','2025-08-27 18:36:20','Purchase','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100067','U1089','2025-08-25 15:05:32','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100067','U1089','2025-08-25 15:08:37','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100068','U1086','2025-08-14 10:00:11','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100068','U1086','2025-08-14 10:01:41','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100068','U1086','2025-08-14 10:09:39','Clicks','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100068','U1086','2025-08-14 10:19:06','Purchase','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100069','U1088','2025-09-02 11:57:56','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100070','U1040','2025-08-06 23:03:30','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100071','U1000','2025-08-03 23:09:08','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100071','U1000','2025-08-03 23:11:47','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100072','U1036','2025-08-24 20:43:48','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100072','U1036','2025-08-24 20:49:26','Interact','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100073','U1015','2025-09-05 02:54:12','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100073','U1015','2025-09-05 02:59:29','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100073','U1015','2025-09-05 03:06:59','Clicks','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100073','U1015','2025-09-05 03:15:08','Purchase','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100074','U1053','2025-08-14 07:16:43','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100075','U1084','2025-08-23 00:15:55','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100075','U1084','2025-08-23 00:18:16','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100076','U1069','2025-08-16 22:53:52','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100077','U1049','2025-08-03 10:51:10','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100077','U1049','2025-08-03 10:54:55','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100078','U1048','2025-09-01 23:39:25','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100079','U1012','2025-08-26 20:46:38','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100080','U1019','2025-08-14 04:46:26','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100080','U1019','2025-08-14 04:51:51','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100081','U1062','2025-08-04 15:42:57','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100081','U1062','2025-08-04 15:48:55','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100081','U1062','2025-08-04 15:52:42','Clicks','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100081','U1062','2025-08-04 15:54:30','Purchase','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100082','U1047','2025-08-13 04:30:38','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100082','U1047','2025-08-13 04:35:21','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100083','U1079','2025-08-29 15:25:38','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100083','U1079','2025-08-29 15:29:18','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100083','U1079','2025-08-29 15:34:00','Clicks','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100083','U1079','2025-08-29 15:41:57','Purchase','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100084','U1058','2025-08-20 00:12:00','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100085','U1084','2025-08-01 17:26:05','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100085','U1084','2025-08-01 17:31:54','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100086','U1029','2025-09-01 05:42:48','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100086','U1029','2025-09-01 05:45:31','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100087','U1004','2025-08-07 17:06:21','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100087','U1004','2025-08-07 17:08:41','Interact','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100088','U1032','2025-08-17 18:37:54','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100089','U1018','2025-09-05 11:46:25','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100090','U1015','2025-09-02 23:54:06','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100091','U1029','2025-08-31 09:49:27','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100092','U1038','2025-08-08 02:51:07','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100092','U1038','2025-08-08 02:51:26','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100093','U1069','2025-09-05 14:32:57','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100093','U1069','2025-09-05 14:36:38','Interact','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100093','U1069','2025-09-05 14:44:17','Clicks','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100094','U1056','2025-08-06 03:45:23','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100095','U1082','2025-08-20 15:51:58','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100095','U1082','2025-08-20 15:52:52','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100096','U1082','2025-08-17 12:33:58','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100096','U1082','2025-08-17 12:35:48','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100097','U1027','2025-08-08 11:54:47','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100098','U1003','2025-08-18 17:22:57','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100099','U1008','2025-08-18 21:48:21','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100099','U1008','2025-08-18 21:48:49','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100099','U1008','2025-08-18 21:49:35','Clicks','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100100','U1084','2025-09-01 13:32:46','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100101','U1056','2025-08-16 23:17:14','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100101','U1056','2025-08-16 23:17:22','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100101','U1056','2025-08-16 23:22:46','Clicks','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100102','U1012','2025-09-01 22:22:22','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100103','U1027','2025-08-12 10:12:51','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100103','U1027','2025-08-12 10:16:16','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100103','U1027','2025-08-12 10:17:36','Clicks','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100104','U1019','2025-08-05 18:17:04','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100105','U1016','2025-08-28 14:17:44','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100105','U1016','2025-08-28 14:22:51','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100105','U1016','2025-08-28 14:29:46','Clicks','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100106','U1013','2025-08-19 04:14:22','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100106','U1013','2025-08-19 04:16:58','Interact','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100106','U1013','2025-08-19 04:23:52','Clicks','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100107','U1071','2025-09-02 06:25:44','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100108','U1044','2025-08-08 06:54:00','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100108','U1044','2025-08-08 06:57:04','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100108','U1044','2025-08-08 06:57:09','Clicks','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100109','U1041','2025-08-08 21:15:49','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100109','U1041','2025-08-08 21:19:52','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100110','U1056','2025-08-11 19:09:21','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100111','U1076','2025-08-11 06:10:12','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100111','U1076','2025-08-11 06:12:01','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100111','U1076','2025-08-11 06:16:19','Clicks','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100112','U1009','2025-08-03 09:17:08','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100112','U1009','2025-08-03 09:21:06','Interact','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100112','U1009','2025-08-03 09:26:42','Clicks','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100113','U1051','2025-08-09 16:14:48','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100114','U1013','2025-08-29 22:05:05','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100114','U1013','2025-08-29 22:05:30','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100115','U1009','2025-08-26 02:08:13','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100115','U1009','2025-08-26 02:10:35','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100116','U1018','2025-08-09 18:08:27','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100116','U1018','2025-08-09 18:13:31','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100116','U1018','2025-08-09 18:21:00','Clicks','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100117','U1074','2025-08-28 17:40:50','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100117','U1074','2025-08-28 17:45:10','Interact','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100118','U1035','2025-08-25 23:05:25','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100118','U1035','2025-08-25 23:08:53','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100118','U1035','2025-08-25 23:14:46','Clicks','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100119','U1074','2025-08-29 02:01:41','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100120','U1064','2025-08-23 04:53:50','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100120','U1064','2025-08-23 04:56:35','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100120','U1064','2025-08-23 04:58:37','Clicks','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100120','U1064','2025-08-23 05:06:05','Purchase','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100121','U1043','2025-09-01 18:09:55','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100121','U1043','2025-09-01 18:12:01','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100122','U1077','2025-08-05 06:57:24','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100122','U1077','2025-08-05 06:59:22','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100122','U1077','2025-08-05 07:05:30','Clicks','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100123','U1048','2025-09-02 20:44:31','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100124','U1046','2025-08-16 07:51:18','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100124','U1046','2025-08-16 07:52:39','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100125','U1067','2025-08-17 16:21:32','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100126','U1023','2025-08-22 13:55:35','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100126','U1023','2025-08-22 13:58:18','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100127','U1030','2025-08-10 18:02:42','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100127','U1030','2025-08-10 18:07:10','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100127','U1030','2025-08-10 18:11:59','Clicks','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100128','U1061','2025-08-06 07:31:32','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100129','U1020','2025-08-26 06:05:57','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100129','U1020','2025-08-26 06:09:02','Interact','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100130','U1064','2025-08-20 01:54:58','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100131','U1083','2025-08-08 00:18:54','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100131','U1083','2025-08-08 00:22:38','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100132','U1027','2025-09-05 15:17:23','Loaded','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100132','U1027','2025-09-05 15:20:30','Interact','mobile','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100133','U1058','2025-08-25 14:20:35','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100133','U1058','2025-08-25 14:21:15','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100133','U1058','2025-08-25 14:25:00','Clicks','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100133','U1058','2025-08-25 14:31:00','Purchase','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100134','U1008','2025-08-24 03:44:49','Loaded','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100134','U1008','2025-08-24 03:48:12','Interact','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100134','U1008','2025-08-24 03:48:34','Clicks','mobile','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100135','U1042','2025-08-18 10:27:29','Loaded','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100135','U1042','2025-08-18 10:32:40','Interact','mobile','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100136','U1008','2025-08-15 13:53:07','Loaded','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100136','U1008','2025-08-15 13:55:03','Interact','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100136','U1008','2025-08-15 13:59:35','Clicks','desktop','app-0005-qugccoakchacom');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100137','U1069','2025-08-03 02:39:58','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100138','U1015','2025-08-20 18:03:32','Loaded','desktop','app-0012-thebeardstruggle');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100139','U1023','2025-08-25 11:39:24','Loaded','desktop','app-0021-armra');
INSERT INTO events(session_id,user_id,ts,event_name,device,app_id) VALUES ('S100139','U1023','2025-08-25 11:43:41','Interact','desktop','app-0021-armra');


select count(*) from events;


INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0001',1,1);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0002',0,7);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0003',1,4);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0004',1,4);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0005',1,4);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0006',1,1);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0007',1,3);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0008',1,4);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0009',1,1);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0010',0,7);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0011',1,5);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0012',1,7);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0013',1,1);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0014',1,5);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0015',1,4);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0016',0,1);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0017',1,7);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0018',1,4);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0019',1,1);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0020',1,7);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0021',1,3);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0022',1,1);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0023',1,5);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0024',1,3);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0025',1,2);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0026',1,1);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0027',1,4);
INSERT INTO inventory(product_id,in_stock,eta_days) VALUES ('P0028',1,5);

select count(*) from inventory;  


INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100000','2025-08-14 16:26:14','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100000','2025-08-14 16:26:58','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100001','2025-09-01 21:11:20','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100001','2025-09-01 21:12:50','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100001','2025-09-01 21:13:05','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100001','2025-09-01 21:13:40','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100001','2025-09-01 21:14:38','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100002','2025-08-05 20:03:54','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100002','2025-08-05 20:04:57','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100002','2025-08-05 20:05:49','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100002','2025-08-05 20:07:23','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100003','2025-08-12 09:31:39','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100004','2025-08-23 08:16:04','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100004','2025-08-23 08:16:40','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100004','2025-08-23 08:17:26','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100004','2025-08-23 08:18:29','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100005','2025-08-12 10:53:35','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100005','2025-08-12 10:54:24','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100005','2025-08-12 10:55:51','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100007','2025-08-29 17:07:22','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100007','2025-08-29 17:07:51','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100007','2025-08-29 17:08:26','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100007','2025-08-29 17:09:35','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100007','2025-08-29 17:10:39','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100008','2025-08-01 21:23:03','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100008','2025-08-01 21:24:26','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100008','2025-08-01 21:26:19','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100008','2025-08-01 21:26:48','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100009','2025-09-05 09:18:41','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100010','2025-08-15 19:44:07','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100011','2025-08-27 12:26:41','Send me the verification code.','email_verification');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100012','2025-08-02 06:43:29','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100012','2025-08-02 06:43:51','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100013','2025-09-05 20:45:27','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100013','2025-09-05 20:46:49','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100013','2025-09-05 20:47:58','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100014','2025-08-16 11:10:49','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100014','2025-08-16 11:11:33','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100015','2025-08-04 18:34:45','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100015','2025-08-04 18:35:31','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100016','2025-08-06 00:56:57','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100016','2025-08-06 00:58:11','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100017','2025-08-20 21:07:13','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100017','2025-08-20 21:07:59','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100018','2025-08-21 19:32:03','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100018','2025-08-21 19:33:28','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100018','2025-08-21 19:35:06','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100018','2025-08-21 19:35:22','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100019','2025-08-24 21:49:34','Send me the verification code.','email_verification');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100020','2025-09-04 03:37:11','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100020','2025-09-04 03:38:57','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100020','2025-09-04 03:39:36','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100021','2025-08-16 13:22:58','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100021','2025-08-16 13:23:21','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100021','2025-08-16 13:25:02','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100023','2025-09-01 16:04:10','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100024','2025-08-27 10:23:45','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100025','2025-08-22 14:33:04','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100025','2025-08-22 14:35:02','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100025','2025-08-22 14:35:18','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100025','2025-08-22 14:36:43','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100025','2025-08-22 14:38:22','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100026','2025-08-06 12:42:55','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100026','2025-08-06 12:44:27','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100026','2025-08-06 12:45:25','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100026','2025-08-06 12:47:01','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100026','2025-08-06 12:48:20','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100027','2025-08-21 21:30:25','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100027','2025-08-21 21:32:18','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100027','2025-08-21 21:33:06','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100027','2025-08-21 21:34:17','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100028','2025-08-04 23:41:38','Send me the verification code.','email_verification');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100028','2025-08-04 23:43:02','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100029','2025-08-07 12:29:25','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100030','2025-08-06 07:47:21','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100030','2025-08-06 07:48:06','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100030','2025-08-06 07:50:03','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100031','2025-08-17 11:02:33','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100031','2025-08-17 11:04:22','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100032','2025-08-06 13:57:24','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100033','2025-09-02 09:01:32','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100033','2025-09-02 09:03:09','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100033','2025-09-02 09:04:50','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100035','2025-08-14 05:18:46','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100035','2025-08-14 05:20:14','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100035','2025-08-14 05:20:34','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100035','2025-08-14 05:20:49','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100036','2025-08-22 06:31:39','Send me the verification code.','email_verification');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100036','2025-08-22 06:32:58','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100037','2025-09-04 04:19:01','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100037','2025-09-04 04:19:54','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100037','2025-09-04 04:20:09','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100038','2025-08-30 18:49:57','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100038','2025-08-30 18:51:38','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100039','2025-08-05 10:48:04','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100039','2025-08-05 10:49:55','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100039','2025-08-05 10:50:49','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100040','2025-08-03 13:50:58','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100040','2025-08-03 13:52:33','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100040','2025-08-03 13:54:19','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100041','2025-08-08 11:56:14','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100042','2025-08-09 20:57:06','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100042','2025-08-09 20:57:27','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100042','2025-08-09 20:57:57','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100042','2025-08-09 20:59:54','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100042','2025-08-09 21:01:16','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100043','2025-08-31 01:48:49','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100043','2025-08-31 01:50:14','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100043','2025-08-31 01:50:49','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100043','2025-08-31 01:52:04','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100044','2025-08-24 20:37:11','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100044','2025-08-24 20:37:45','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100044','2025-08-24 20:39:28','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100044','2025-08-24 20:40:10','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100044','2025-08-24 20:41:17','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100045','2025-08-29 16:30:23','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100046','2025-08-01 14:53:02','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100048','2025-08-30 01:36:50','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100048','2025-08-30 01:37:28','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100049','2025-08-23 09:46:55','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100049','2025-08-23 09:47:20','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100050','2025-08-12 05:16:09','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100050','2025-08-12 05:16:29','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100050','2025-08-12 05:17:15','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100050','2025-08-12 05:17:32','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100051','2025-09-02 20:00:26','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100051','2025-09-02 20:01:58','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100052','2025-08-06 13:57:42','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100052','2025-08-06 13:59:28','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100053','2025-09-04 04:19:01','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100053','2025-09-04 04:19:31','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100053','2025-09-04 04:20:58','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100054','2025-08-19 07:45:56','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100055','2025-08-08 18:15:40','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100055','2025-08-08 18:17:03','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100055','2025-08-08 18:18:17','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100055','2025-08-08 18:20:05','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100056','2025-08-14 20:59:15','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100057','2025-08-02 17:27:47','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100057','2025-08-02 17:28:37','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100057','2025-08-02 17:29:58','Send me the verification code.','email_verification');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100057','2025-08-02 17:30:23','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100057','2025-08-02 17:31:30','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100058','2025-08-02 04:06:17','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100058','2025-08-02 04:07:19','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100058','2025-08-02 04:08:41','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100058','2025-08-02 04:10:31','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100059','2025-08-16 05:16:22','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100059','2025-08-16 05:17:01','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100059','2025-08-16 05:18:17','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100060','2025-08-10 18:10:40','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100060','2025-08-10 18:11:11','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100060','2025-08-10 18:13:02','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100061','2025-08-17 20:58:20','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100062','2025-08-04 22:19:13','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100062','2025-08-04 22:20:21','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100063','2025-08-19 19:11:30','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100064','2025-08-06 03:37:36','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100064','2025-08-06 03:38:24','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100064','2025-08-06 03:38:59','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100064','2025-08-06 03:40:24','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100065','2025-09-03 19:10:56','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100065','2025-09-03 19:11:44','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100065','2025-09-03 19:13:19','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100066','2025-08-27 18:29:30','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100066','2025-08-27 18:30:21','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100067','2025-08-25 15:06:42','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100067','2025-08-25 15:08:14','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100067','2025-08-25 15:08:40','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100068','2025-08-14 10:01:47','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100068','2025-08-14 10:02:13','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100068','2025-08-14 10:03:20','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100069','2025-09-02 11:59:55','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100069','2025-09-02 12:00:14','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100070','2025-08-06 23:04:36','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100071','2025-08-03 23:10:43','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100071','2025-08-03 23:11:04','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100071','2025-08-03 23:12:29','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100072','2025-08-24 20:45:33','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100072','2025-08-24 20:46:58','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100072','2025-08-24 20:48:05','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100072','2025-08-24 20:48:34','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100073','2025-09-05 02:55:16','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100073','2025-09-05 02:56:47','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100073','2025-09-05 02:57:19','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100074','2025-08-14 07:17:34','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100074','2025-08-14 07:19:04','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100076','2025-08-16 22:55:36','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100078','2025-09-01 23:40:43','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100078','2025-09-01 23:41:14','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100078','2025-09-01 23:42:44','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100079','2025-08-26 20:46:54','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100079','2025-08-26 20:48:01','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100080','2025-08-14 04:47:23','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100080','2025-08-14 04:48:46','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100080','2025-08-14 04:49:41','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100081','2025-08-04 15:44:33','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100081','2025-08-04 15:45:00','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100081','2025-08-04 15:46:43','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100081','2025-08-04 15:47:01','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100082','2025-08-13 04:31:14','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100082','2025-08-13 04:32:47','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100083','2025-08-29 15:26:29','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100083','2025-08-29 15:27:04','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100083','2025-08-29 15:28:03','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100083','2025-08-29 15:28:56','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100084','2025-08-20 00:12:28','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100084','2025-08-20 00:13:56','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100084','2025-08-20 00:14:48','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100084','2025-08-20 00:15:40','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100085','2025-08-01 17:26:26','Send me the verification code.','email_verification');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100085','2025-08-01 17:28:16','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100085','2025-08-01 17:29:07','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100086','2025-09-01 05:44:41','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100086','2025-09-01 05:45:13','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100086','2025-09-01 05:46:48','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100086','2025-09-01 05:47:42','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100087','2025-08-07 17:06:58','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100087','2025-08-07 17:08:53','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100087','2025-08-07 17:09:54','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100087','2025-08-07 17:10:43','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100088','2025-08-17 18:39:08','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100089','2025-09-05 11:47:30','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100089','2025-09-05 11:49:27','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100089','2025-09-05 11:49:53','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100089','2025-09-05 11:50:09','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100090','2025-09-02 23:54:54','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100090','2025-09-02 23:56:54','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100090','2025-09-02 23:57:56','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100091','2025-08-31 09:50:53','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100091','2025-08-31 09:52:26','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100091','2025-08-31 09:52:49','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100091','2025-08-31 09:54:03','Send me the verification code.','email_verification');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100092','2025-08-08 02:51:36','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100092','2025-08-08 02:52:59','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100092','2025-08-08 02:54:12','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100092','2025-08-08 02:56:02','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100093','2025-09-05 14:33:47','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100093','2025-09-05 14:34:49','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100094','2025-08-06 03:46:25','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100095','2025-08-20 15:52:24','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100096','2025-08-17 12:34:21','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100096','2025-08-17 12:35:46','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100097','2025-08-08 11:56:18','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100097','2025-08-08 11:56:51','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100097','2025-08-08 11:58:15','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100097','2025-08-08 11:58:52','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100098','2025-08-18 17:23:42','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100098','2025-08-18 17:23:59','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100098','2025-08-18 17:24:20','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100098','2025-08-18 17:25:28','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100100','2025-09-01 13:33:08','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100100','2025-09-01 13:34:14','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100100','2025-09-01 13:34:42','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100101','2025-08-16 23:18:36','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100101','2025-08-16 23:19:55','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100102','2025-09-01 22:23:47','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100103','2025-08-12 10:14:31','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100104','2025-08-05 18:17:30','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100104','2025-08-05 18:19:20','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100105','2025-08-28 14:18:05','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100105','2025-08-28 14:19:36','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100105','2025-08-28 14:20:04','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100105','2025-08-28 14:20:46','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100105','2025-08-28 14:22:02','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100106','2025-08-19 04:16:15','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100106','2025-08-19 04:17:48','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100107','2025-09-02 06:26:33','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100107','2025-09-02 06:27:22','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100107','2025-09-02 06:28:16','Send me the verification code.','email_verification');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100108','2025-08-08 06:54:42','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100108','2025-08-08 06:55:55','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100108','2025-08-08 06:56:57','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100109','2025-08-08 21:16:38','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100109','2025-08-08 21:17:47','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100110','2025-08-11 19:09:50','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100110','2025-08-11 19:10:19','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100110','2025-08-11 19:12:00','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100110','2025-08-11 19:13:22','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100110','2025-08-11 19:13:42','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100111','2025-08-11 06:10:27','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100111','2025-08-11 06:11:37','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100111','2025-08-11 06:12:40','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100111','2025-08-11 06:13:24','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100111','2025-08-11 06:15:04','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100112','2025-08-03 09:18:14','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100112','2025-08-03 09:19:22','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100113','2025-08-09 16:16:22','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100113','2025-08-09 16:18:05','Send me the verification code.','email_verification');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100113','2025-08-09 16:18:31','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100114','2025-08-29 22:06:55','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100114','2025-08-29 22:07:52','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100115','2025-08-26 02:10:12','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100115','2025-08-26 02:10:45','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100117','2025-08-28 17:42:25','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100117','2025-08-28 17:43:36','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100117','2025-08-28 17:44:47','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100118','2025-08-25 23:07:02','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100118','2025-08-25 23:07:28','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100118','2025-08-25 23:08:47','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100119','2025-08-29 02:02:37','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100120','2025-08-23 04:55:12','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100120','2025-08-23 04:55:47','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100121','2025-09-01 18:10:59','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100121','2025-09-01 18:12:46','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100122','2025-08-05 06:57:49','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100123','2025-09-02 20:46:20','…',NULL);
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100123','2025-09-02 20:47:42','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100123','2025-09-02 20:49:22','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100124','2025-08-16 07:52:35','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100124','2025-08-16 07:53:07','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100124','2025-08-16 07:53:59','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100124','2025-08-16 07:54:26','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100124','2025-08-16 07:55:50','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100125','2025-08-17 16:23:06','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100125','2025-08-17 16:24:09','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100126','2025-08-22 13:56:46','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100126','2025-08-22 13:58:37','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100126','2025-08-22 13:59:49','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100127','2025-08-10 18:04:04','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100127','2025-08-10 18:04:39','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100127','2025-08-10 18:06:36','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100127','2025-08-10 18:07:23','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100128','2025-08-06 07:32:53','Is this cruelty-free?','brand_question');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100128','2025-08-06 07:33:44','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100129','2025-08-26 06:06:40','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100129','2025-08-26 06:07:39','Send me the verification code.','email_verification');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100129','2025-08-26 06:08:47','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100130','2025-08-20 01:56:00','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100130','2025-08-20 01:56:55','Send me the verification code.','email_verification');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100131','2025-08-08 00:20:46','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100131','2025-08-08 00:21:58','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100131','2025-08-08 00:22:23','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100132','2025-09-05 15:18:08','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100132','2025-09-05 15:18:29','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100132','2025-09-05 15:20:05','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100133','2025-08-25 14:22:08','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100133','2025-08-25 14:23:36','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100133','2025-08-25 14:25:16','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100134','2025-08-24 03:45:48','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100134','2025-08-24 03:47:27','What is your return policy?','faq');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100134','2025-08-24 03:49:20','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100135','2025-08-18 10:29:11','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100135','2025-08-18 10:30:55','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100135','2025-08-18 10:31:33','Where is my order?','track_order');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100137','2025-08-03 02:40:37','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100137','2025-08-03 02:42:31','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100137','2025-08-03 02:44:09','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100138','2025-08-20 18:04:36','Looking for options around $50','product_search');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100139','2025-08-25 11:41:12','Does this come in size M?','product_details');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100139','2025-08-25 11:42:22','How does A compare to B?','product_comparison');
INSERT INTO messages(session_id,ts,text,detected_intent) VALUES ('S100139','2025-08-25 11:44:22','Looking for options around $50','product_search');

select count(*) from messages;

INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O247400','S100002','2025-08-05 20:18:43',NULL,49.64);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O283886','S100004','2025-08-23 08:32:13',NULL,89.44);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O200942','S100014','2025-08-16 11:24:41','2025-08-16 14:22:41',109.69);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O241180','S100022','2025-08-13 07:09:05',NULL,42.44);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O261069','S100044','2025-08-24 20:48:27',NULL,85.8);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O216728','S100047','2025-08-11 23:56:26',NULL,112.63);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O299374','S100057','2025-08-02 17:39:14',NULL,59.14);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O201607','S100060','2025-08-10 18:14:51',NULL,100.91);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O261433','S100066','2025-08-27 18:36:20',NULL,72.74);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O287835','S100068','2025-08-14 10:19:06','2025-08-14 10:48:06',66.02);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O236208','S100073','2025-09-05 03:15:08',NULL,77.17);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O207355','S100081','2025-08-04 15:54:30',NULL,147.49);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O255615','S100083','2025-08-29 15:41:57',NULL,56.05);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O237079','S100120','2025-08-23 05:06:05',NULL,63.57);
INSERT INTO orders(order_id,session_id,created_at,canceled_at,order_value) VALUES ('O268614','S100133','2025-08-25 14:31:00',NULL,52.08);
 
 select count(*) from orders; 
 
 
 INSERT INTO products(product_id,title,price) VALUES ('P0001','Product 1',38.98);
INSERT INTO products(product_id,title,price) VALUES ('P0002','Product 2',33.39);
INSERT INTO products(product_id,title,price) VALUES ('P0003','Product 3',77.04);
INSERT INTO products(product_id,title,price) VALUES ('P0004','Product 4',35.83);
INSERT INTO products(product_id,title,price) VALUES ('P0005','Product 5',44.08);
INSERT INTO products(product_id,title,price) VALUES ('P0006','Product 6',64.46);
INSERT INTO products(product_id,title,price) VALUES ('P0007','Product 7',27.4);
INSERT INTO products(product_id,title,price) VALUES ('P0008','Product 8',20.16);
INSERT INTO products(product_id,title,price) VALUES ('P0009','Product 9',53.22);
INSERT INTO products(product_id,title,price) VALUES ('P0010','Product 10',54.02);
INSERT INTO products(product_id,title,price) VALUES ('P0011','Product 11',63.42);
INSERT INTO products(product_id,title,price) VALUES ('P0012','Product 12',59.28);
INSERT INTO products(product_id,title,price) VALUES ('P0013','Product 13',55.13);
INSERT INTO products(product_id,title,price) VALUES ('P0014','Product 14',36.92);
INSERT INTO products(product_id,title,price) VALUES ('P0015','Product 15',54.08);
INSERT INTO products(product_id,title,price) VALUES ('P0016','Product 16',54.28);
INSERT INTO products(product_id,title,price) VALUES ('P0017','Product 17',36.3);
INSERT INTO products(product_id,title,price) VALUES ('P0018','Product 18',83.24);
INSERT INTO products(product_id,title,price) VALUES ('P0019','Product 19',57.75);
INSERT INTO products(product_id,title,price) VALUES ('P0020','Product 20',31.78);
INSERT INTO products(product_id,title,price) VALUES ('P0021','Product 21',63.91);
INSERT INTO products(product_id,title,price) VALUES ('P0022','Product 22',67.0);
INSERT INTO products(product_id,title,price) VALUES ('P0023','Product 23',57.0);
INSERT INTO products(product_id,title,price) VALUES ('P0024','Product 24',44.85);
INSERT INTO products(product_id,title,price) VALUES ('P0025','Product 25',35.68);
INSERT INTO products(product_id,title,price) VALUES ('P0026','Product 26',48.5);
INSERT INTO products(product_id,title,price) VALUES ('P0027','Product 27',55.77);
INSERT INTO products(product_id,title,price) VALUES ('P0028','Product 28',49.81);

select count(*) from products; 

-- Funnel conversion by device
WITH step_users AS (
    SELECT device, event_name, COUNT(DISTINCT user_id) AS users
    FROM events
    WHERE event_name IN ('Loaded','Interact','Clicks','Purchase')
    GROUP BY device, event_name
),
ordered_steps AS (
    SELECT device,
           CASE event_name
                WHEN 'Loaded'   THEN 1
                WHEN 'Interact' THEN 2
                WHEN 'Clicks'   THEN 3
                WHEN 'Purchase' THEN 4
           END AS step_order,
           event_name AS step,
           users
    FROM step_users
),
calc AS (
    SELECT device, step_order, step, users,
           ROUND(100.0 * users / MAX(users) OVER (PARTITION BY device ORDER BY step_order ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 2) AS conv_from_start_pct,
           ROUND(100.0 * users / LAG(users) OVER (PARTITION BY device ORDER BY step_order), 2) AS conv_from_prev_pct
    FROM ordered_steps
)
SELECT step, users, conv_from_prev_pct, conv_from_start_pct, device
FROM calc
ORDER BY device, step_order;



