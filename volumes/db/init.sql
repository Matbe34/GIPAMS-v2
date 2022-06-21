DROP DATABASE IF EXISTS gipams_db;
CREATE DATABASE gipams_db;
CREATE USER 'WORKFLOW_user'@'%' IDENTIFIED BY 'password';
CREATE USER 'GCS_user'@'%' IDENTIFIED BY 'password';
CREATE USER 'SEARCH_user'@'%' IDENTIFIED BY 'password';
CREATE USER 'PS_user'@'%' IDENTIFIED BY 'password';
GRANT SELECT ON gipams_db.* TO 'WORKFLOW_user'@'%';
GRANT ALL ON gipams_db.* TO 'GCS_user'@'%';
GRANT ALL ON gipams_db.DGKeys TO 'PS_user'@'%';
GRANT ALL ON gipams_db.DTKeys TO 'PS_user'@'%';
GRANT SELECT ON gipams_db.* TO 'SEARCH_user'@'%';

use gipams_db;
create table MPEGFile (
	id bigint NOT NULL AUTO_INCREMENT, 
	name varchar(128) NOT NULL, 
	path varchar(512) NOT NULL, 
	owner varchar(128) NOT NULL, 
	primary key(id));

create table DatasetGroup (
	dg_id int NOT NULL AUTO_INCREMENT, 
	title varchar(128) NOT NULL, 
	type varchar(128), 
	abstract varchar(1024), 
	projectCentre varchar(128), 
	description varchar(1024), 
	path varchar(256) NOT NULL, 
	owner varchar(128) NOT NULL, 
	protection text, 
	hasMetadata bool default false, 
	mpegfile bigint NOT NULL, 
	foreign key (mpegfile) references MPEGFile(id), 
	primary key(dg_id,mpegfile));

create table Dataset (
	dt_id int NOT NULL AUTO_INCREMENT, 
	title varchar(128) NOT NULL, 
	type varchar(128), 
	abstract varchar(1024), 
	projectCentre varchar(1024), 
	description varchar(1024), 
	path varchar(128) NOT NULL, 
	owner varchar(128) NOT NULL, 
	protection text, 
	hasMetadata bool default false, 
	datasetGroup int NOT NULL, 
	mpegfile bigint NOT NULL, 
	foreign key (datasetGroup) references DatasetGroup(dg_id), 
	foreign key (mpegfile) references MPEGFile(id), 
	primary key(dt_id,datasetGroup,mpegfile));

create table AccessUnit (
	au_id int NOT NULL AUTO_INCREMENT, 
	type varchar(128), 
	path varchar(128) NOT NULL, 
	owner varchar(128) NOT NULL, 
	protection text, 
	dt_id int NOT NULL, 
	dg_id int NOT NULL, 
	mpegfile bigint NOT NULL, 
	foreign key (dt_id) references Dataset(dt_id), 
	foreign key (dg_id) references DatasetGroup(dg_id), 
	foreign key (mpegfile) references MPEGFile(id), 
	primary key(au_id,dt_id,dg_id,mpegfile));

create table Block (
	block_id int NOT NULL AUTO_INCREMENT, 
	size int,
	path varchar(128) NOT NULL, 
	owner varchar(128) NOT NULL, 
	au_id int NOT NULL, 
	dt_id int NOT NULL, 
	dg_id int NOT NULL, 
	mpegfile bigint NOT NULL, 
	foreign key (au_id) references AccessUnit(au_id), 
	foreign key (dt_id) references Dataset(dt_id), 
	foreign key (dg_id) references DatasetGroup(dg_id), 
	foreign key (mpegfile) references MPEGFile(id), 
	primary key(block_id,au_id,dt_id,dg_id,mpegfile));

create table DGSample (
	dgs_id int NOT NULL, 
	taxon_id int, 
	title varchar(128), 
	dg_id int NOT NULL, 
	mpegfile bigint NOT NULL, 
	foreign key (dg_id) references DatasetGroup(dg_id), 
	foreign key (mpegfile) references MPEGFile(id));

create table DTSample (
	dts_id int NOT NULL, 
	taxon_id int, 
	title varchar(128), 
	dt_id int NOT NULL, 
	dg_id int NOT NULL, 
	mpegfile bigint NOT NULL, 
	foreign key (dt_id) references Dataset(dt_id), 
	foreign key (dg_id) references Dataset(datasetGroup), 
	foreign key (mpegfile) references MPEGFile(id));

create table DGKeys (
	mpegfile bigint NOT NULL,
	dg_id int NOT NULL,
	name varchar(128) NOT NULL,
	symKey text,
	privKey text,
	pubKey text,
        foreign key (mpegfile) references MPEGFile(id),
	foreign key (dg_id) references DatasetGroup(dg_id),
	primary key (mpegfile, dg_id, name));

create table DTKeys (
	mpegfile bigint NOT NULL,
	dg_id int NOT NULL,
	dt_id int NOT NULL,
	name varchar(128) NOT NULL,
	symKey text,
	privKey text,
	pubKey text,
        foreign key (mpegfile) references MPEGFile(id),
	foreign key (dg_id) references DatasetGroup(dg_id),
	foreign key (dt_id) references Dataset(dt_id),
	primary key (mpegfile, dg_id, dt_id, name));
