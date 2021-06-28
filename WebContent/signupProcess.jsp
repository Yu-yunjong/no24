<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

윤종: 1.0 (2021-05-27 00:00) 암호화 기능 추가, 생년월일, 휴대폰 번호 미입력 시 오류처리 추가
대풍: 1.0 (2021-05-16 15:36)
SingUp1의 처리를 해주는 페이지
******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
    
<%   
    DB.loadConnect();
	request.setCharacterEncoding("euc-kr");
    String id = request.getParameter("id");
	String pwd = EncriptPassword.encriptPassword(request.getParameter("pwd"));
	String name = request.getParameter("name");
	String p1 = request.getParameter("phone1");
	String p2 = request.getParameter("phone2");
	String p3 = request.getParameter("phone3");
	String b1 = request.getParameter("year");
	String b2 = request.getParameter("month");
	String b3 = request.getParameter("day");
	String email = request.getParameter("email");
	String address = request.getParameter("address");

	String phone = p1 + "-" + p2 + "-" + p3;
	String birthday = b1 + "-" + b2 + "-" + b3;
	%>

<% 
    
     int check=DB.IDCheck(id);
	if(check==0)  //ID 중복체크
		{
		out.println("<script>alert('중복된 아이디 입니다.'); history.back();</script>");
		}
	else if(p1 == "" || p2 == "" || p3 == "") {
		out.println("<script>alert('휴대폰 번호를 입력해주세요.'); history.back();</script>");
	}
	
	else if(b1.equals("none") || b2.equals("none") || b3.equals("none")) {
		out.println("<script>alert('생년월일을 선택해 주세요.'); history.back();</script>");
	}
	
	else 
	{
	  
		
		int result = DB.InsertUser(id, pwd, name, birthday, phone, email, address);
		if(result==1)
		{
			out.println("<script>alert('회원가입 완료.'); location.href='login.html';</script>");
		}
		
	}
	%>

		

  
  


  

	