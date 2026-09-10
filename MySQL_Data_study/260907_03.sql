# bit, bytes??
# bit = 컴퓨터 취급 최소한의 연산처리 단위 - 0, 1
# byte = bit 8 = 1 byte = 2^8 = 256

# 데이터 단위에 대한 이해(코랩에 대충 써놓음)

CREATE TABLE mytable (
	id TINYINT UNSIGNED # UNSIGNED 부호사용 X, 음의 정수 영역 X -> 양의 정수
);

# 실습용 테이블 제작
CREATE DATABASE IF NOT EXISTS customer_db;
SHOW DATABASES;
USE customer_db;

# 스키마
# NULL = 결측값
# 0, NOT, none => 값이 결여되어있는 상태 (언제라도 값이 들어올 수 있다는 전제조건)
# 모두 NOT NULL로 정의해야 하는가? -> NO! 비필수 정보는 NULL이 허락된다
CREATE TABLE IF NOT EXISTS customer(
	no INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    age INT,
    phone VARCHAR(20),
    email VARCHAR(30)NOT NULL,
    address VARCHAR(50)
);

# Table 내 컬럼 속성 변경
ALTER TABLE customer MODIFY COLUMN 
name VARCHAR(30) NOT NULL;
# Table 내 컬럼명 + 속성변경
ALTER TABLE customer CHANGE COLUMN 
name user_name VARCHAR(20) NOT NULL;
# 여러 컬럼을 한번에 바꾸기
ALTER TABLE customer
CHANGE COLUMN age user_age INT,
CHANGE COLUMN phone user_phone VARCHAR(30) NOT NULL;

# 가독성을 위해서 들여쓰기를 하는 것도 좋다.
#  
ALTER TABLE customer
	MODIFY email VARCHAR(40) NOT NULL,
	CHANGE address user_address VARCHAR(40);


DESC customer;

