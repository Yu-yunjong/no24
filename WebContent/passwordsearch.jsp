<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

대풍: 1.0 (2021-05-16 15:36)
passwordsearch의 처리를 해주는 페이지
******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
    
<%   
    DB.loadConnect();
    String id =  (String) request.getParameter("id");
	String p1 = request.getParameter("phone1");
	String p2 = request.getParameter("phone2");
	String p3 = request.getParameter("phone3");
	String email = request.getParameter("email");
	String phone = p1 + "-" + p2 + "-" + p3;
	if(DB.PSCheck(id, phone,email)==0)
	{    session.setAttribute("pcid", id);
		response.sendRedirect("newpsw.html");
	} else{
		out.println("<script> alert(\"입력하신 정보에 맞는 사용자가 존재하지 않습니다. 확인 후 다시 시도해주세요.\"); window.history.go(-1); </script>");
	}
%>	