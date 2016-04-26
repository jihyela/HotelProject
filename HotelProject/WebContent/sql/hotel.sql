-- 회원정보 테이블
create table customer(
   id varchar2(100) primary key,
   name varchar2(100) not null,
   password varchar2(100) not null,
   email varchar2(100) not null,
   tel number not null
);

insert into customer(id, name, password, email, tel) values ('jihye', '라지혜', '1234', 'lajihye93@naver.com', '01089000843');

select name from customer where id='jihye' and password='1234';

drop table customer;
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


create table qna(
   qna_no number primary key,
   title varchar2(100) not null,
      content clob not null,
      time_posted date not null,
      hits number default 0,
      id varchar2(100) not null,
      constraint fk_qna foreign key(id) references customer(id)
);
create sequence qna_seq;
create table notice(
   notice_no number primary key,
   title varchar2(100) not null,
      content clob not null,
      time_posted date not null,
      hits number default 0,
      id varchar2(100) not null,
      constraint fk_notice foreign key(id) references customer(id)
);
create sequence notice_seq;