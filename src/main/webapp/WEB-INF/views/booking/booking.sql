show tables;

/* ------booking2테이블--------- */
create table booking2 (
	idx 				int not null auto_increment,						/* 예약 고유번호 */
	pIdx 				int not null,				/* 상품 고유번호 */	
	mid 				varchar(20) not null,		/* 회원 아이디  */ -- 공백??...
	name				varchar(20) not null,		/* 회원 이름 */
	tel					varchar(15) not null,		/* 회원 전화번호 */
	bookingStartDate datetime not null,		  /* 예약시작날짜/시간 */
	bookingEndDate datetime not null,		  /* 예약끝날짜/시간 */
	orderDate		datetime default now(),	/* 예약 주문 넣은 날짜 */
	/* pro1				varchar(20) not null,		 1차상품명 */
	/* pro2				varchar(20)	not null,		 2차상품명 */
	/*prodcut			varchar(50) not null,		 상품명 */
	/*price				varchar(20) not null,		 가격 */
	customerCheck 		varchar(500),				/* 특이사항 체크 */
	paymentMethod			varchar(50),				/* 결제수단 (카드결제, 현장결제, 네이버페이, 카카오페이, 회원권 등)*/
	bookingStatus  		int default 1,			/* 예약이행 1)예약신청, 2)예약완료, 3)시술완료, 4)취소 5)노쇼*/
	noShowCnt 				int default 0,
	historyContent text,								/* 시술 기록 이미지 */
	historyMemo text,										/* 시술 기록 메모 */
	historyDate	datetime not null default now(),			/* 시술 기록 날짜 */
	-- 결제방법 추가..
	primary key(idx)
);

insert into booking2 values (default, 8, 'admin', '관리자', '010-7751-1593','2023-02-21 10:00','2023-02-21 12:00',default,'고혈압',default,'','없음',default);

update member2 set birthday='2023-02-17 09:00' where mid='admin';

select * from booking2;
drop table booking2;

update booking2 set paymentStatus = 0 ; -- 미결제
/* ------bookingTime테이블--------- */

create table bookingTime(
	idx		int not null auto_increment primary key,
	bIdx	int not null,	
	bookingTimeBlock int not null, 			/* 예약이 잡힌 시간 블록 */
	bookingDate datetime not null				/* 예약한 날짜 */ 
);




																																		-- selectDate		--9,10,12,... - ${bookingStartTime}				--${useTime}
select count(*) from bookingTime where substring(bookingDate,1,10) = '2023-02-24' and bookingTimeBlock > 13 and bookingTimeBlock <= 15;
select * from bookingTime where substring(bookingDate,1,10) = '2023-02-24' ;

select email from counseling;

select categorySubName from categorySub;


  	select count(*) from booking2 where idx != 0
  	 and bookingStartDate>='2023-02-28' 
  	 and '2023-02-29'>=bookingStartDate
  	;
  	select count(*) from booking2 where idx != 0 and
  	DATEFORMAT(bookingStartDate, "%Y-%m-%d") >='2023-02-28' ;


  	 and bookingStartDate>='2023-02-28' 
  	 and '2023-02-29'>=bookingStartDate
  	;
  	
  	SELECT COUNT(*) FROM booking2 
WHERE idx != 0 
AND date_format(bookingStartDate, '%Y-%m-%d') >= '2023-02-28';


 		select b.*
		from booking2 b where idx != 0
			date_format(b.bookingStartDate, '%Y-%m-%d')>=#{searchStart}]]>  </if> 
  	<if test="searchEnd != ''"> and <![CDATA[#{searchEnd}>=date_format(b.bookingStartDate, '%Y-%m-%d')]]>  </if>
		<if test="orderBy==''">order by b.idx desc</if>
		<if test="orderBy=='down'">
			order by b.bookingStartDate desc
		</if>
		<if test="orderBy=='up'">
			order by b.bookingStartDate
		</if>
		limit #{startIndexNo},#{pageSize}
		;

