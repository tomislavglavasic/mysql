#c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "C:\Users\hatzi\Downloads\serviszaciscenje.sql"
drop database if exists serviszaciscenje;
create database serviszaciscenje default character set utf8;
use serviszaciscenje;

create table usluga(
sifra int not null primary key auto_increment,
naziv varchar(50)not null,
cijena decimal(18,2)
);


create table djelatnik(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
telefon varchar(50) not null,
iban varchar(32),
nadredeni int
);



create table klijent(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
telefon varchar(50) not null
);


create table ciscenje(
usluga int not null,
klijent int not null,
djelatnik int not null,
cijena decimal(18,2),
datum_pocetka datetime,
datum_svrsetka datetime
);


alter table ciscenje add foreign key (usluga) references usluga(sifra);
alter table ciscenje add foreign key (klijent) references klijent(sifra);
alter table ciscenje add foreign key (djelatnik) references djelatnik(sifra);
alter table djelatnik add foreign key (nadredeni) references djelatnik(sifra);