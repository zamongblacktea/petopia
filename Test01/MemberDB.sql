/*-----------------------------------------------회원 정보---------------------------------------------------

--일련번호 관리객체
create sequence seq_member_idx



-- 시퀀스 삭제
DROP SEQUENCE seq_member_idx;

--조회용 뷰 삭제
drop view MEMBER_view

--테이블 삭제
drop table member

-- 조회용 뷰 만들기 

create or replace view MEMBER_view
   as
     select 
      mem_idx,mem_name,mem_id,mem_pwd,mem_email,mem_phone,mem_zipcode,mem_addr,mem_ip,mem_grade
    
    from MEMBER;
  
-- MEMBER 테이블 생성   
CREATE TABLE MEMBER (
	mem_idx		number	NOT NULL,
	mem_name    Varchar2(100)	NOT NULL,
	mem_id		Varchar2(100)	NOT NULL,	
	mem_pwd		Varchar2(100)	NOT NULL,
	mem_email	Varchar2(100)	NOT NULL,	
	mem_phone	Varchar2(100)	NOT NULL,
	mem_zipcode Varchar2(100)   NOT NULL ,
	mem_addr	Varchar2(500)	NOT NULL,
	mem_ip		Varchar2(100)	NOT NULL,
	mem_grade	Varchar(100)	NOT NULL,
	mem_business Varchar(200) 	
);




-- pk키 부여
ALTER TABLE member
	ADD CONSTRAINT  pk_member_idx PRIMARY KEY (mem_idx);

-- unique키 부여		
alter table member
	add constraint unique_member_id unique(mem_id);

-- 등급부여		
alter table member
	add constraint ck_member_grade check(mem_grade in('일반','관리자'));
	
--sample data
insert into member values(seq_member_idx.nextVal,'일길동','dlfrlfehd','1234','dlfrlfehd@gmail.com','010-1234-5678','12345','서울시 관악구 봉천동 123','127.1234.07.01.1234','일반','비사업자');
insert into member values(seq_member_idx.nextVal,'관리자','rhksflwk','1234','rhksflwk@gmail.com','010-1111-5678','12333','서울시 관악구 봉천동 1111','127.1234.07.01.1234','관리자','비사업자');						   
insert into member values(seq_member_idx.nextVal,'사업자','owner','1234','owner@gmail.com','010-1451-5221','12333','서울시 관악구 봉천동 1111','127.1234.07.01.1234','일반','사업자');						   


-- 테이블 조회
select * from member

-- 뷰 조회
SELECT * FROM MEMBER_view;



*/

CREATE TABLE room (                                   
	room_idx				number		NOT NULL, 
	acom_idx				number		NOT NULL, 
	mem_idx					number		NOT NULL, 
    room_type  				Varchar2(300),			  
    room_price 				number(10,2) DEFAULT 80000
	room_cap				number		,			  
	room_petType			Varchar2(200)		,     
	room_date				DATE		,             
	contentid				number,                   
	contenttypeid			number,                   
	roomintro				Varchar2(1000),           
	roombathfacility		Varchar2(100) DEFAULT 'N',
	roombath				Varchar2(100) DEFAULT 'N',
	roomhometheater         Varchar2(100) DEFAULT 'N',
	roomaircondition        Varchar2(100) DEFAULT 'N',
	roomtv                  Varchar2(100) DEFAULT 'N',
	roompc                  Varchar2(100) DEFAULT 'N',
	roomcable               Varchar2(100) DEFAULT 'N',
	roominternet            Varchar2(100) DEFAULT 'N',
	roomrefrigerator        Varchar2(100) DEFAULT 'N',
	roomtoiletries          Varchar2(100) DEFAULT 'N',
	roomsofa                Varchar2(100) DEFAULT 'N',
	roomcook                Varchar2(100) DEFAULT 'N',
	roomtable               Varchar2(100) DEFAULT 'N',
	roomhairdryer           Varchar2(100) DEFAULT 'N',
	roomimg1				Varchar2(1000),           
	roomimg1alt             Varchar2(1000),           
	roomimg2                Varchar2(1000),           
	roomimg2alt             Varchar2(1000),           
	roomimg3                Varchar2(1000),           
	roomimg3alt             Varchar2(1000),           
	roomimg4                Varchar2(1000),           
    roomimg4alt             Varchar2(1000),           
  	roomimg5                Varchar2(1000),           
    roomimg5alt             Varchar2(1000)            
);                                                    

