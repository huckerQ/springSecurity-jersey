CREATE TABLE `users` (
	`username` VARCHAR(50) NOT NULL,
	`password` VARCHAR(50) NOT NULL,
	`enabled` TINYINT(1) NOT NULL,
	PRIMARY KEY (`username`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB

CREATE TABLE `authorities` (
	`username` VARCHAR(50) NOT NULL,
	`authority` VARCHAR(50) NOT NULL,
	UNIQUE INDEX `ix_auth_username` (`username`, `authority`),
	CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES ('admin', 'admin', 1);
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES ('user', 'user', 1);

INSERT INTO `authorities` (`username`, `authority`) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO `authorities` (`username`, `authority`) VALUES ('user', 'ROLE_USER');
