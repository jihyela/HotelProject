create table customer(
	id varchar2(100) primary key,
	password varchar2(100) not null,
	email varchar2(100) not null,
	tel number not null
);
drop table hotel;
create table hotel(
	hotel_no number primary key,
	price number not null,
	info clob not null
);

create sequence hotel_seq;

create table booking(
   book_no number primary key,
   hotel_no number not null,
   id varchar2(100) not null,   
   startdate date not null,
   enddate date not null,
   constraint fk_hotel foreign key(hotel_no) references hotel(hotel_no),
   constraint fk_customer foreign key(id) references customer(id)
);
create sequence booking_seq;
create table picture(
	picture_no number primary key,
	hotel_no number not null,
	name varchar2(100) not null,
	constraint fk_picture foreign key(hotel_no) references hotel(hotel_no)
);
create sequence picture_seq;
123