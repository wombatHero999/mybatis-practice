# MyBatis 실습문제
## 1. 프로젝트에 MyBatis 연결 및 저장된 SQL문 실행.
##### 목표 : MyBatis연결과정에 대한 이해도 체크
##### 상세설명
- sql폴더의 Table Script를 활용하여 계정 및 테이블을 생성
- mybatis에 필요한 의존성(jar)파일들을 프로젝트에 추가한다.
- mybatis-config의 설정정보를 구성한다.
- SqlSessionTemplate클래스에서 mybatis-config의 설정정보를 읽어, SqlSessionFactory를 생성할 수 있도록 소스코드를 구현한다.(서버 실행시 최초 1회 만 생성되도록 구현)
- index.jsp에서 사용자 전체 조회 버튼을 눌렀을 때 조회 결과에 전체 사용자 정보가 표시될 수 있도록 다음 흐름을 구현.
  1. SelectAllMemberServlet에서 Service의 selectAllMember()호출 
  2. Service에서 DAO의 selectAllMember메서드 작성 후 호출 
  3. DAO에서 member-mapper.xml의 select태그 중 id값이 selectAllMember를 찾아서 호출
  4. SelectAllMemberServlet에서는 얻어온 List<Member>데이터를 JSON형식으로 변환하여 반환(GSON 라이브러리 사용)

## 2. SQL쿼리문 완성과 ResultMap을 이용한 데이터 조회
##### 목표 : SQL문 작성방법에 대한 이해, ResultMap사용방법에 대한 이해도 체크
##### 상세설명
- index.jsp의 2. id기반 검색, 3. 회원 등록, 4. 회원 이름 기반 검색 기능을 순서에 맞춰서 구현
- 각 기능을 Servlet -> Service -> Dao-> Mapper.xml의 흐름으로 요청이 전달되도록 구현할 것
- member-mapper.xml에서 2번 기능의 sql, 3번 기능의 sql , 4번 기능의 sql을 작성
- sql작성시 주석을 참고하여 작성할 것.
- 아이디, 이름기반 검색시 서블릿은 GSON을 활용하여 Member, List<Member>를 JSON으로 변경할 것
- 회원등록 완료시 메인 페이지로 리다이렉트 시킬 것 repsonse.sendRedirect("/")

## 3. 동적 SQL구현과 ResultMap을 이용한 데이터 조회
##### 목표 : MyBatis의 동적 SQL문 구현과 복잡한 쿼리문의 데이터 매핑에 대한 이해도 체크
##### 상세설명
- index2.jsp에서 전체 게시글 불러오기(SelctAllBoardServlet)기능의 sql과
  선택한 게시글의 상세보기 기능을 완성
- 각 기능을 Servlet -> Service -> Dao-> Mapper.xml의 흐름으로 요청이 전달되도록 구현할 것
- board-mapper.xml을 참고하여 조건에 맞는 쿼리문을 작성
- 전체 게시글 조회및 검색 기능은 request scope에 List<Board> 데이터를 넣고, 게시글 상세보기는 Board
데이터를 GSON을 이용하여 JSON으로 변경하여 비동기방식으로 반환










