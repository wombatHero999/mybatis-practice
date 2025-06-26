# MyBatis 실습문제
## 1. 프로젝트에 MyBatis 연결 및 저장된 SQL문 실행.
##### 목표 : MyBatis연결과정에 대한 이해도 체크
##### 상세설명
- sql폴더의 Table Script를 활용하여 계정 및 테이블을 생성 후 MyBatis로 연동한다.
- mybatis에 필요한 의존성(jar)파일을 프로젝트에 추가한다.
- mybatis-config의 설정정보를 구성한다.
- SqlSessionTemplate클래스에서 mybatis-config의 설정정보를 읽어, SqlSessionFactory를 생성할 수 있도록 소스코드를 구현한다.
- SqlSessionFactory 생성시 "MyBatis연동 성공"문자를 출력
- index.jsp에서 사용자 전체 조회 버튼을 눌렀을 때 xxx
- MemberService와 MemberDao의 코드를 완성시켜 member-mapper.xml의 selectAllMember
메서드를 

## 2. SQL쿼리문 완성과 ResultMap을 이용한 데이터 조회
##### 목표 : SQL문 작성방법에 대한 이해, ResultMap사용방법에 대한 이해도 체크
##### 상세설명
- member-mapper.xml의 1번~4번 sql문 작성. 

## 3. 동적 SQL구현과 ResultMap을 이용한 데이터 조회
##### 목표 : MyBatis의 동적 SQL문 구현과 복잡한 쿼리문의 데이터 매핑에 대한 이해도 체크
##### 상세설명
- board-mapper.xml의 1번~4번 sql문 작성. 
##### 조건 
-반환형은 지정된 반환형을 사용하여 조회할것.


