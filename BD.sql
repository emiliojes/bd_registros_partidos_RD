CREATE SCHEMA `equipo_del_real_madrid` DEFAULT CHARACTER SET utf8 ;

USE equipo_del_real_madrid;

CREATE TABLE `equipo_del_real_madrid`.`tecnico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cedula` VARCHAR(255) NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido` VARCHAR(255) NOT NULL,
  `edad` DATE NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);

  CREATE TABLE `equipo_del_real_madrid`.`estadio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `ciudad` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

  CREATE TABLE `equipo_del_real_madrid`.`jugadores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido` VARCHAR(255) NOT NULL,
  `cedula` VARCHAR(255) NOT NULL,
  `edad` DATE NOT NULL,
  `peso` VARCHAR(255) NOT NULL,
  `estatura` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `equipos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);

  CREATE TABLE `equipo_del_real_madrid`.`posiciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `codigo` VARCHAR(255) NOT NULL,
  `jugadores_id` INT NOT NULL,
  PRIMARY KEY (`id`));

  CREATE TABLE `equipo_del_real_madrid`.`equipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `grupo` VARCHAR(255) NOT NULL,
  `cod_tecnico` INT NOT NULL,
  PRIMARY KEY (`id`));

  CREATE TABLE `equipo_del_real_madrid`.`albitros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido` VARCHAR(255) NOT NULL,
  `cedula` VARCHAR(255) NOT NULL,
  `edad` DATE NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `partidos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);

  CREATE TABLE `equipo_del_real_madrid`.`partidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `fecha` TIMESTAMP NOT NULL,
  `resultados` VARCHAR(255) NOT NULL,
  `equipos_id` INT NOT NULL,
  `estadios_id` INT NOT NULL,
  PRIMARY KEY (`id`));


  ALTER TABLE `equipo_del_real_madrid`.`posiciones` 
ADD INDEX `posiciones_jugadores_idx` (`jugadores_id` ASC) VISIBLE;
;
ALTER TABLE `equipo_del_real_madrid`.`posiciones` 
ADD CONSTRAINT `posiciones_jugadores`
  FOREIGN KEY (`jugadores_id`)
  REFERENCES `equipo_del_real_madrid`.`jugadores` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


  ALTER TABLE `equipo_del_real_madrid`.`jugadores` 
ADD INDEX `jugadores_equipos_idx` (`equipos_id` ASC) VISIBLE;
;
ALTER TABLE `equipo_del_real_madrid`.`jugadores` 
ADD CONSTRAINT `jugadores_equipos`
  FOREIGN KEY (`equipos_id`)
  REFERENCES `equipo_del_real_madrid`.`equipo` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


  ALTER TABLE `equipo_del_real_madrid`.`equipo` 
ADD INDEX `equipos_tecnico_idx` (`cod_tecnico` ASC) VISIBLE;
;
ALTER TABLE `equipo_del_real_madrid`.`equipo` 
ADD CONSTRAINT `equipos_tecnico`
  FOREIGN KEY (`cod_tecnico`)
  REFERENCES `equipo_del_real_madrid`.`tecnico` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


  ALTER TABLE `equipo_del_real_madrid`.`partidos` 
ADD INDEX `partidos_equipos_idx` (`equipos_id` ASC) VISIBLE;
;
ALTER TABLE `equipo_del_real_madrid`.`partidos` 
ADD CONSTRAINT `partidos_equipos`
  FOREIGN KEY (`equipos_id`)
  REFERENCES `equipo_del_real_madrid`.`equipo` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


  ALTER TABLE `equipo_del_real_madrid`.`partidos` 
ADD INDEX `partidos_estadio_idx` (`estadios_id` ASC) VISIBLE;
;
ALTER TABLE `equipo_del_real_madrid`.`partidos` 
ADD CONSTRAINT `partidos_estadio`
  FOREIGN KEY (`estadios_id`)
  REFERENCES `equipo_del_real_madrid`.`estadio` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


  ALTER TABLE `equipo_del_real_madrid`.`albitros` 
ADD INDEX `arbitros_partidos_idx` (`partidos_id` ASC) VISIBLE;
;
ALTER TABLE `equipo_del_real_madrid`.`albitros` 
ADD CONSTRAINT `arbitros_partidos`
  FOREIGN KEY (`partidos_id`)
  REFERENCES `equipo_del_real_madrid`.`partidos` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
