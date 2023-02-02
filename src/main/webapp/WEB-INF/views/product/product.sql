show tables;

create table product(
	idx				int not null auto_increment,	/* 상품 고유번호 */
	pro1			varchar(20) not null,					/* 1차상품명 */
	pro2 			varchar(20) not null,					/* 2차상품명 */
	useTime		varchar(10) not null,					/* 사용시간 */
	price 		int not null									/* 가격 */
);