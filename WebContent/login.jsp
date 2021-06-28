<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

대풍: 1.1 (2021-05-16 15:36)
윤종: 1.0 (2021-05-27 17:00)

******************************************************** -->
<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,no24.*"  %>
<HTML>
  <HEAD><TITLE>로그인 처리</TITLE></HEAD>
  
  <BODY>
    <%  
    DB.loadConnect();
    String ID = request.getParameter("id");
    String password = request.getParameter("password");
    System.out.println(ID);
    int chkLogin = DB.CheckLogin(ID, password);
    
	int group = DB.checkUserGroup(ID);	// 그룹아이디
    if(ID=="" || password=="") {
    	out.println("<script>alert('아이디 or 비밀번호를 입력해주세요.'); location.href='login.html';</script>");
	}
    else if(chkLogin == 1)
    {
		if(group == 1) {// 회원
			session.setAttribute("group", 1);
		} else if(group == 10) {	// 관리자
			session.setAttribute("group", 10);
		}
		session.setAttribute("userID", ID); 
		response.sendRedirect("index.jsp"); //메인 페이지로
    } else if(chkLogin == 0){
    	out.println("<script>alert('로그인 실패. 아이디와 비밀번호를 확인해주세요.'); location.href='login.html';</script>");
    }
    
    %>
  
  </BODY>
</HTML>