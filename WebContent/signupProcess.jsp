<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-27 00:00) ��ȣȭ ��� �߰�, �������, �޴��� ��ȣ ���Է� �� ����ó�� �߰�
��ǳ: 1.0 (2021-05-16 15:36)
SingUp1�� ó���� ���ִ� ������
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
	if(check==0)  //ID �ߺ�üũ
		{
		out.println("<script>alert('�ߺ��� ���̵� �Դϴ�.'); history.back();</script>");
		}
	else if(p1 == "" || p2 == "" || p3 == "") {
		out.println("<script>alert('�޴��� ��ȣ�� �Է����ּ���.'); history.back();</script>");
	}
	
	else if(b1.equals("none") || b2.equals("none") || b3.equals("none")) {
		out.println("<script>alert('��������� ������ �ּ���.'); history.back();</script>");
	}
	
	else 
	{
	  
		
		int result = DB.InsertUser(id, pwd, name, birthday, phone, email, address);
		if(result==1)
		{
			out.println("<script>alert('ȸ������ �Ϸ�.'); location.href='login.html';</script>");
		}
		
	}
	%>

		

  
  


  

	