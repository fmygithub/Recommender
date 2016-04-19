DROP TABLE IF EXISTS attention CASCADE ;

CREATE TABLE attention (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY(user_id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;