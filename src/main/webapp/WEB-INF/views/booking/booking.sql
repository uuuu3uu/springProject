show tables;

create table booking2 (
	idx 				int not null,						/* 회원 고유번호 */
	mid 				varchar(20) not null,		/* 회원 아이디  */
	name				varchar(20) not null,		/* 회원 이름 */
	tel					varchar(15) not null,		/* 회원 전화번호 */
	bookingDate datetime not null,			/* 예약날짜/시간 */
	orderDate		datetime default now(),		/* 예약 주문 넣은 날짜 */
	pro1				varchar(20) not null,		/* 1차상품명 */
	pro2				varchar(20)	not null,		/* 2차상품명 */
	price				varchar(20) not null,		/* 가격 */
	customerCheck 	varchar(100),				/* 특이사항 체크 */
	bookingStatus  	int default 1,	
	primary key(idx)
);