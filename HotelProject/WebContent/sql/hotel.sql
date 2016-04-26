-- 회원정보 테이블
create table customer(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   email varchar2(100) not null,
   tel number not null
);
drop table hotel;
-- 객실정보 테이블
create table hotel(
   hotel_no number primary key,
   price number not null,
   info clob not null
);


-- 예약정보 테이블
create table booking(
   book_no number primary key,
   hotel_no number not null,
   id varchar2(100) not null,
   startdate date not null,
   enddate date not null,
   constraint fk_hotel foreign key(hotel_no) references hotel(hotel_no),
   constraint fk_customer foreign key(id) references customer(id)
);
-- 예약정보 시퀀스
create sequence booking_seq;

-- 객실 사진정보 테이블
create table picture(
   picture_no number primary key,
   hotel_no number not null,
   name varchar2(100) not null,
   constraint fk_picture foreign key(hotel_no) references hotel(hotel_no)
);
create sequence picture_seq;