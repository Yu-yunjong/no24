<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

��ǳ: 1.0 (2021-05-16 15:36)
passwordsearch�� ó���� ���ִ� ������
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
		out.println("<script> alert(\"�Է��Ͻ� ������ �´� ����ڰ� �������� �ʽ��ϴ�. Ȯ�� �� �ٽ� �õ����ּ���.\"); window.history.go(-1); </script>");
	}
%>	