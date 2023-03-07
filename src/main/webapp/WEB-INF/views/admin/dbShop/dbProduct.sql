show tables;

/* 대분류 */
create table categoryMain (
	categoryMainCode  char(1) not null,	     /* 대분류코드(A,B,C,... => 영문 대문자 1자 */
  categoryMainName  varchar(20) not null,  /* 대분류명(회사명 => 눈썹/피부/왁싱... */
	primary key(categoryMainCode),
  unique key(categoryMainName)	
);

/* 중분류 */
create table categorysub (
	categoryMainCode   	 char(1) not null,      /* 대분류코드를 외래키로 지정 */
  categorySubCode   char(2) not null,	    /* 중분류코드(01,02,03,... => 숫자(문자형식) 2자 */
  categorySubName   varchar(20) not null, 	/* 중분류명(제품분류명=> 전자제품/의류/신발류/차종.. */
  primary key(categorySubCode),
  /* unique key(categoryMiddleName) */
  foreign key(categoryMainCode) references categoryMain(categoryMainCode)
);

drop table categorysub;

/* 세분류(상품 테이블) */
create table dbProduct (
  idx   						int  not  null,           /* 상품 고유번호 */
  categoryMainCode  char(1) not null,       	/* 1차메뉴코드를 외래키지정 */
  categorySubCode   char(3) not null, 			  /* 2차메뉴코드를 외래키로 지정 */
  productCode  			varchar(20)  not null,  	/* 상품고유코드(대분류코드+중코드+고유번호)  예) A01 */
  
  detail       			varchar(100)  not null, 	/* 상품의 간단설명(초기화면출력에 필요) */
  mainPrice  				int not null,           	/* 상품의 기본가격 */
  
  fSName    				text  not null, 	/* 상품의 기본사진(여러장) */
  
 	
  useTime    int not null,            /* 시술 시간 */
  primary key(idx, productCode),
  foreign key(categoryMainCode) references categoryMain(categoryMainCode),
  foreign key(categorySubCode) references categorySub(categorySubCode)
);
--content    text   not null,               	/* 상품의 상세설명 - ckeditor를 이용한 이미지처리 */
drop table dbProduct;

/* 상품 옵션 */
create table dbOption (
  idx     		 int not null auto_increment,  /* 옵션 고유번호 */
  productIdx 	 int not null,              	 /* product테이블(상품)의 고유번호 - 외래키 지정 */
  optionName 	 varchar(50) not null,      	 /* 옵션 이름 */
  optionPrice  int not null default 0,  	 	 /* 옵션 가격 */
  primary key(idx),
  foreign key(productIdx) references dbProduct(idx)
);

drop table dbOption;

show tables;
select product.*, main.categoryMainName, sub.categorySubName from dbProduct product, categoryMain main, categorySub sub;
  		
