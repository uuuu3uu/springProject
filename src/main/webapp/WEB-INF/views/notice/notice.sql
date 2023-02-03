show tables;

create table notice (
	idx int  not null auto_increment,		/* 게시글의 고유번호 */
	name 		 varchar(20) 	not null, 		/* 게시글 올린 사람의 이름 */
	title		 varchar(100) 	not null, 		/* 게시글의 글 제목 */
	content  text not null,								/* 글 내용 */
	wDate 	 datetime default now(),			/* 글 쓴 날짜 */
	
	downNum  int 		 default 0,						/* 파일 다운로드 횟수 */
	readNum	 int default 0,								/* 글 조회수 */
	mid 		 varchar(20) not null,				/* 회원 아이디(내가 올린 게시글 전체 조회 시에 사용) */
	
	primary key (idx)											/* 기본키 : 자료실의 고유번호 */
);

drop table notice;
select * from notice order by idx desc;

select *,(select name from member where mid=b.mid) as name ,(select tel from member where mid=b.mid) as tel
						 ,(select pro1 from product where idx=b.pIdx) as pro1
						 ,(select pro2 from product where idx=b.pIdx) as pro2
						 ,(select bookingDate from booking where idx=b.pIdx) as bookingDate
						 from booking b where mid like '이' order by bookingDate desc limit 0, 10;
