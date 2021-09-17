CREATE DATABASE IF NOT EXISTS `notebook`;
USE `notebook`;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
	`user_id` SMALLINT AUTO_INCREMENT,
	`first_name` varchar(20) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`e-mail` varchar(30) UNIQUE NOT NULL,
	PRIMARY KEY (`user_id`)
)ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;

INSERT INTO `users`
VALUES
(1,'Gerhardt','Chomley','gchomley0@ucla.edu'),
(2,'Blane','Pfeuffer','bpfeuffer1@ucoz.com'),
(3,'Teena','Haddrill','thaddrill2@hatena.ne.jp'),
(4,'Dorella','Paulin','dpaulin3@un.org'),
(5,'Louise','Perrinchief','lperrinchief4@marriot'),
(6,'Jesse','Axelbey','jaxelbey5@un.org'),
(7,'Abram','Kezar','akezar6@taobao.com'),
(8,'Tybalt','Surguine','tsurguine7@java.com'),
(9,'Anneliese','Pessold','apessold8@symantec.com'),
(10,'Kinsley','Shone','kshone9@elegantthemes.com');

UNLOCK TABLES;

DROP TABLE IF EXISTS `notes_status`;

CREATE TABLE `notes_status` (
	`note_status_id` SMALLINT AUTO_INCREMENT,
	`note_status` varchar(20) UNIQUE NOT NULL,
	PRIMARY KEY (`note_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `notes_status` WRITE;

INSERT INTO `notes_status` 
VALUES
(1,'Creada'),
(2,'Modificada'),
(3,'Eliminada');

UNLOCK TABLES;

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
	`category_id` SMALLINT AUTO_INCREMENT,
	`note_status` varchar(25) UNIQUE NOT NULL,
	PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `categories`
VALUES
(1,'Estilo de vida'),
(2,'Cine y TV'),
(3,'Tecnología'),
(4,'Redes sociales'),
(5,'Fotografía'),
(6,'Blockchain');

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
	`note_id` SMALLINT AUTO_INCREMENT,
	`user_id` SMALLINT,
	`title` varchar(100),
	`creation_day` datetime,
	`last_modif` datetime,
	`description` text,
	`note_protected` TINYINT NOT NULL,
	`note_status_id` SMALLINT,
	PRIMARY KEY (`note_id`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
	FOREIGN KEY (`note_status_id`) REFERENCES `notes_status`(`note_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `notes`
VALUES
(1,1,'lectus','2021/07/14','2021/03/04','In congue. Etiam justo. Etiam pretium iaculis justo.In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',0,1),
(2,9,'commodo','2021/04/23','2020/11/10','Sed ante. Vivamus tortor. Duis mattis egestas metus.Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et,eros.',0,2),
(3,10,'donec','2021/02/18','2021/02/18','Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.',0,2),
(4,2,'felis ut','2020/10/23','2021/01/25','Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretiumnisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.',1,3),
(5,10,'sed','2020/12/07','2021/06/02','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orciluctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapiensapien non mi. Integer ac neque.Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.',1,2),
(6,8,'justo','2021/07/13','2021/07/02','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapiennon mi. Integer ac neque.Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.',1,2),
(7,1,'eros','2020/09/11','2020/09/11','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',1,2),
(8,9,'maecenas','2021/04/17','2020/10/29','Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.',1,1),
(9,8,'pharetra magna vestibulum','2020/09/17','2021/03/18','Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.',1,3),
(10,10,'ut nunc','2020/12/21','2020/10/21','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.',1,2),
(11,4,'scelerisque quam','2020/12/02','2021/04/18','In congue. Etiam justo. Etiam pretium iaculis justo.',0,2),
(12,7,'blandit mi in','2020/12/21','2021/05/06','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.',0,1),
(13,5,'ut mauris','2021/02/13','2020/08/07','Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.',0,2),
(14,10,'tortor eu','2020/11/09','2021/07/21','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',0,1),
(15,9,'in','2021/02/12','2020/07/05','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',1,1),
(16,9,'nunc rhoncus','2021/06/20','2021/08/01','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',0,3),
(17,9,'dapibus','2020/10/15','2021/09/03','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',1,3),
(18,8,'non','2021/08/08','2021/04/06','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.',0,2),
(19,8,'sit amet diam','2020/11/25','2021/06/13','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',1,3),
(20,5,'integer','2021/03/23','2020/08/01','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',0,3);

DROP TABLE IF EXISTS `notes_categories`;

CREATE TABLE `notes_categories` (
	`note_category_id` SMALLINT AUTO_INCREMENT,
	`note_id` SMALLINT NOT NULL,
	`category_id` SMALLINT NOT NULL,
	PRIMARY KEY (`note_category_id`),
	FOREIGN KEY (`note_id`) REFERENCES `notes`(`note_id`),
	FOREIGN KEY (`category_id`) REFERENCES `categories`(`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `notes_categories`
VALUES
(1,19,2),
(2,4,1),
(3,6,4),
(4,5,1),
(5,5,1),
(6,11,3),
(7,15,1),
(8,3,5),
(9,7,6),
(10,5,5),
(11,19,4),
(12,2,6),
(13,7,1),
(14,6,4),
(15,1,5),
(16,2,4),
(17,15,6),
(18,6,3),
(19,12,4),
(20,5,3),
(21,10,1),
(22,14,3),
(23,7,2),
(24,16,1),
(25,14,4),
(26,5,2),
(27,18,2),
(28,16,2),
(29,4,4),
(30,7,3),
(31,20,2),
(32,11,5),
(33,17,3),
(34,11,5),
(35,4,3),
(36,7,1),
(37,9,4),
(38,3,3),
(39,11,6),
(40,15,1),
(41,10,4),
(42,13,4),
(43,4,5),
(44,10,3);

