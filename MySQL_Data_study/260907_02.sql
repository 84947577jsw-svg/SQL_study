# DB : 데이터를 관리할 수 있는 가장 큰 카테고리
## 대문자 사용이유 : 예약어 | 명령어 : 업데이트시, 사람이 작성한것인지, 자동으로 된것인지 구분을 위해

CREATE DATABASE dbname; 

SHOW DATABASES; # 현재 만들어놓은 DB를 모두 출력

USE dbname;

CREATE TABLE mytable (
	id INT,
    name VARCHAR(50),
	PRIMARY KEY(id)
); # 테이블 생성 

CREATE TABLE mytable (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
); # 위와 같음(PK를 정의하는 방법은 2가지)/AUTO_INCREMENT제외

# 현재 생성된 테이블이 어떤 규칙으로 정의되어 있는가alter
DESC mytable;

# 현재 생성된 테이블 안에서 값 조회
SELECT * FROM mytable;

# 완전히 테이블 삭제
DROP DATABASE dbname;













