#c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "D:\mysql\mysql\servis.sql"
drop database if exists serviszaciscenje;
create database serviszaciscenje default character set utf8;
use serviszaciscenje;

create table usluga(
sifra int not null primary key auto_increment,
naziv varchar(50),
cijena decimal(18,2)
);


create table djelatnik(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
telefon varchar(50) not null,
iban varchar(32)
);



create table klijent(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
telefon varchar(50) not null
);


create table ciscenje(
sifra int not null primary key auto_increment,
usluga int not null,
klijent int not null,
cijena decimal(18,2),
djelatnik int not null,
datum_pocetka datetime,
datum_zavrsetka datetime
);

create table ciscenje_usluga(
sifra int not null primary key auto_increment,
ciscenje int not null,
usluga int not null
);

create table ciscenje_djelatnik(
sifra int not null primary key auto_increment,
ciscenje int not null,
djelatnik int not null
);



alter table ciscenje add foreign key (klijent) references klijent(sifra);

alter table ciscenje_usluga add foreign key (ciscenje) references ciscenje(sifra);
alter table ciscenje_usluga add foreign key (usluga) references usluga(sifra);
alter table ciscenje_djelatnik add foreign key (ciscenje) references ciscenje(sifra);
alter table ciscenje_djelatnik add foreign key (djelatnik) references djelatnik(sifra);
