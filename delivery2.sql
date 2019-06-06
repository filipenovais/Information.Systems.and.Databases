# Grupo 50
# Ana Costa 75999
# Filipe Novais 75352
# Joao Brito 75458
# Entrega 2


#1 

drop table if exists region;
drop table if exists element;
drop table if exists series;
drop table if exists study;
drop table if exists equipment;
drop table if exists request;
drop table if exists appointment;
drop table if exists doctor;
drop table if exists patient;


create table patient
   (patient_id  varchar(255),
    name  varchar(255),
    birthday date,
    address varchar(255),
    primary key(patient_id));

create table doctor
   (doctor_id varchar(255),
    name  varchar(255),
    specialty varchar(255),
    primary key(doctor_id));

create table appointment
   (patient_id  varchar(255),
    doctor_id  varchar(255),
    showdate date,
    office varchar(255),
    primary key(patient_id, doctor_id, showdate),
    foreign key(patient_id) references patient(patient_id),
    foreign key(doctor_id) references doctor(doctor_id));

create table request
   (request_number numeric(20),
    patient_id varchar(255),
    doctor_id varchar(255),
    showdate date,
    primary key (request_number),
    foreign key(patient_id, doctor_id, showdate) references appointment(patient_id, doctor_id, showdate));

create table equipment
   (manufacturer varchar(255),
    serial_number numeric(20),
    model varchar(255),
    primary key (manufacturer, serial_number));

create table study
   (request_number numeric(20),
    description varchar(255),
    study_date date,
    doctor_id varchar(255),
    manufacturer varchar(255),
    serial_number numeric(20),
    primary key(request_number, description),
    foreign key(request_number) references request(request_number),
    foreign key(doctor_id) references doctor(doctor_id),
    foreign key(manufacturer,serial_number) references equipment(manufacturer,serial_number));

create table series
   (series_id varchar(255),
    name varchar(255),
    base_url varchar(255),
    request_number numeric(20),
    description varchar(255),
    primary key(series_id),
    foreign key(request_number, description) references study(request_number, description));

create table element
   (series_id varchar(255),
    elem_index numeric(20),
    primary key(series_id, elem_index),
    foreign key(series_id) references series(series_id));

create table region
   (series_id varchar(255),
    elem_index numeric(20),
    x1 numeric(20,2),
    y1 numeric(20,2),
    x2 numeric(20,2),
    y2 numeric(20,2),
    primary key(series_id, elem_index, x1, y1, x2, y2),
    foreign key(series_id, elem_index) references element(series_id, elem_index));


# Inserção de valores na base de dados para teste

insert into patient values ('P001', 'Ana Carloto', '1994-03-12', 'Rua do Carmo');
insert into patient values ('P002', 'Osminda da Graca', '1922-05-10', 'Rua do Coberto');
insert into patient values ('P003', 'Pedro Ribeiro', '1986-02-02', 'Rua do Lixo');
insert into patient values ('P004', 'Humberto Grosso', '1968-10-09', 'Rua do Gato');
insert into patient values ('P005', 'Joaquim Pedrosa', '1952-09-24', 'Rua do Palhaco');
insert into patient values ('P006', 'Joana Bamba', '2008-07-24', 'Rua do Circo');
insert into patient values ('P007', 'Rodrigo Aventura', '2009-01-01', 'Rua do Salto');
insert into patient values ('P008', 'Goliver Alberto', '1979-03-13', 'Rua do Carmo');


insert into doctor values ('D001', 'Pedro Ossoso', 'Ortopedia');
insert into doctor values ('D002', 'Joana Acucar', 'Nutricao');
insert into doctor values ('D003', 'Rogerio Lopes', 'Cirurgiao');
insert into doctor values ('D004', 'Paulo Nolmen', 'Pediatria');
insert into doctor values ('D005', 'Ricardo Raio', 'Radiologia');
insert into doctor values ('D006', 'Professor X', 'Radiologia');
insert into doctor values ('D007', 'Eco Girl', 'Obstetricia');


insert into appointment values ('P001', 'D001', '2016-10-31', 'OO13');
insert into appointment values ('P006', 'D004', '2016-10-31', 'OP01');
insert into appointment values ('P007', 'D004', '2016-10-24', 'OP03');
insert into appointment values ('P002', 'D003', '2016-11-01', 'OC10');
insert into appointment values ('P003', 'D003', '2016-09-14', 'OC06');
insert into appointment values ('P004', 'D002', '2016-09-07', 'ON07');
insert into appointment values ('P005', 'D001', '2016-11-04', 'OO02');
insert into appointment values ('P008', 'D001', '2016-11-05', 'OO02');


insert into request values (1, 'P001', 'D001', '2016-10-31');
insert into request values (2, 'P006', 'D004', '2016-10-31');
insert into request values (3, 'P007', 'D004', '2016-10-24');
insert into request values (4, 'P002', 'D003', '2016-11-01');
insert into request values (5, 'P003', 'D003', '2016-09-14');
insert into request values (6, 'P004', 'D002', '2016-09-07');
insert into request values (7, 'P005', 'D001', '2016-11-04');
insert into request values (8, 'P008', 'D001', '2016-11-05');


insert into equipment values ('Siewomens', 1234, 'Espiral');
insert into equipment values ('Philips', 3194, 'Torbinante');
insert into equipment values ('Garfields', 4847, 'Septro');
insert into equipment values ('Laminas', 9451, 'Cortante');


insert into study values (1, 'X-ray perna direita', '2016-11-02', 'D002', 'Philips', 3194);
insert into study values (7, 'X-ray pulmões', '2016-11-07', 'D005', 'Philips', 3194);
insert into study values (4, 'Ecografia', '2016-11-05', 'D001', 'Laminas', 9451);
insert into study values (5, 'X-ray braco esquerdo', '2016-11-08', 'D006', 'Philips', 3194);
insert into study values (5, 'X-ray braco direito', '2016-11-08', 'D006', 'Philips', 3194);
insert into study values (5, 'X-ray perna direita', '2016-11-09', 'D006', 'Philips', 3194);
insert into study values (8, 'X-ray braco direito', '2016-11-09', 'D005', 'Philips', 3194);
insert into study values (8, 'X-ray braco esquerdo', '2016-11-09', 'D005', 'Philips', 3194);
insert into study values (8, 'X-ray perna direita', '2016-11-10', 'D005', 'Philips', 3194);
insert into study values (5, 'X-ray perna esquerda', '2016-11-09', 'D006', 'Siewomens', 1234);


insert into series values ('S1', 'raios xizes1', 'raiox1', 1, 'X-ray perna direita');
insert into series values ('S2', 'raios xizes2', 'raiox2', 7, 'X-ray pulmoes');
insert into series values ('S3', 'ecografos1', 'eco1', 4, 'Ecografia');
insert into series values ('S4', 'raios xizes4', 'raiox4', 5, 'X-ray braco esquerdo');
insert into series values ('S5', 'raios xizes5', 'raiox5', 5, 'X-ray braco direito');
insert into series values ('S6', 'raios xizes6', 'raiox6', 5, 'X-ray perna direita');
insert into series values ('S7', 'raios xizes7', 'raiox7', 8, 'X-ray braco direito');
insert into series values ('S8', 'raios xizes8', 'raiox8', 8, 'X-ray braco esquerdo');
insert into series values ('S9', 'raios xizes9', 'raiox9', 8, 'X-ray perna direita');
insert into series values ('S10', 'raios xizes10', 'raiox10', 5, 'X-ray perna esquerda');


insert into element values ('S1', 1);
insert into element values ('S1', 2);
insert into element values ('S1', 3);
insert into element values ('S2', 1);
insert into element values ('S2', 2);
insert into element values ('S2', 3);
insert into element values ('S3', 1);
insert into element values ('S3', 2);
insert into element values ('S4', 1);
insert into element values ('S4', 2);
insert into element values ('S5', 1);
insert into element values ('S6', 1);
insert into element values ('S7', 1);
insert into element values ('S8', 1);
insert into element values ('S9', 1);
insert into element values ('S10', 1);


insert into region values ('S1', 1 , 10, 20, 12, 22);
insert into region values ('S1', 1 , 52, 28, 98, 35);
insert into region values ('S1', 2 , 15, 10, 19, 17);
insert into region values ('S1', 2 , 42, 23, 52, 29);
insert into region values ('S1', 2 , 33, 65, 36, 75);
insert into region values ('S1', 3 , 21, 42, 45, 49);
insert into region values ('S1', 3 , 82, 85, 86, 99);
insert into region values ('S2', 1 , 12, 35, 16, 38);
insert into region values ('S2', 2 , 36, 62, 56, 77);
insert into region values ('S2', 2 , 45, 15, 56, 46);
insert into region values ('S2', 3 , 36, 44, 97, 49);
insert into region values ('S2', 3 , 12, 65, 32, 69);	
insert into region values ('S3', 1 , 75, 75, 88, 79);
insert into region values ('S3', 2 , 36, 66, 44, 88);
insert into region values ('S3', 2 , 69, 77, 77, 94);
insert into region values ('S3', 2 , 45, 44, 55, 53);
insert into region values ('S4', 1 , 31, 12, 65, 18);
insert into region values ('S4', 2 , 16, 82, 26, 92);
insert into region values ('S4', 2 , 55, 31, 69, 46);
insert into region values ('S5', 1 , 55, 31, 69, 46);
insert into region values ('S6', 1 , 55, 31, 69, 46);
insert into region values ('S7', 1 , 55, 31, 69, 46);
insert into region values ('S8', 1 , 55, 31, 69, 46);
insert into region values ('S9', 1 , 55, 31, 69, 46);
insert into region values ('S10', 1 , 55, 31, 69, 46);

#2
select doctor.name from doctor, study where doctor.doctor_id = study.doctor_id and study.description like '%X-ray%' and manufacturer='Philips' and datediff(current_date, study_date)<7 group by  doctor.name having count(doctor.name) >= all(select count(doctor.name) from doctor, study where doctor.doctor_id = study.doctor_id and study.description like '%X-ray%' and manufacturer='Philips' and datediff(current_date, study_date)<7 group by  doctor.name);

#3
drop trigger if exists trigger_study;

delimiter $$
create trigger trigger_study before insert on study
for each row
begin
	if exists (select doctor_id from request where request_number=new.request_number and doctor_id=new.doctor_id) then
		call wrong_doctor_id();
	end if;

	if exists (select datediff(new.study_date, showdate) from request where request.request_number=new.request_number and datediff(new.study_date, showdate)<=0) then
		call wrong_date();
	end if;
	
	
end$$
delimiter ;


#4
drop function if exists overlap;

delimiter $$
create function overlap (region1 varchar(255), region2 varchar(255))
returns int
begin
	return exists (select * from region as r1, region as r2 where r1.series_id=region1 and r2.series_id=region2 and r1.x1 < r2.x2 and r1.x2 > r2.x1 and r1.y1 < r2.y2 and r1.y2 > r2.y1);
end$$
delimiter ;