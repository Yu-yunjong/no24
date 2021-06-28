<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

대풍: 1.0 (2021-05-16 15:36)
idsearch의 처리를 해주는 페이지
******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
    
<%   
    DB.loadConnect();
    
	String p1 = request.getParameter("phone1");
	String p2 = request.getParameter("phone2");
	String p3 = request.getParameter("phone3");
	String email = request.getParameter("email");
	String phone = p1 + "-" + p2 + "-" + p3;
	ResultSet rs = DB.idSearch(phone, email);
	String ID = null;
	while(rs.next()){
		ID = rs.getString("id");
	}
	
	if(ID != null) {
		out.println("<script> alert(\"회원 아이디: " +ID + "\"); window.history.go(-1); </script>");
	} else {
		out.println("<script> alert(\"일치하는 아이디가 없습니다.\"); window.history.go(-1); </script>");
	}
	
		%>
		<!-- 메인박스 -->
<html>
<head>
<style>
#container{
height:250px;
display:flex;
<!--justify-content:center; -->
align-items:center;
}
#item{
;
width:130px;
}
#inner-container{

padding : 5px;
}
</style>
</head>
<body>
<div id="container">
  <div id='inner-container'>
 <div id='item'><button type="button" class="btn btn-primary active" id="btn" style="width:120pt;height:30pt;background-color: 23CF85;" 
	onclick="document.location.href='login.html'">로그인 하기</button>
	</div>
	<div id='item'>
 <button type="button" class="btn btn-primary active" id="btn" style="width:120pt;height:30pt;background-color: 23CF85;" 
	onclick="document.location.href='passwordsearch.html'">비밀번호 찾기</button>	
</div>
</div>
</div>


</body>
</html>    