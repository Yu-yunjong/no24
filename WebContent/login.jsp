<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

��ǳ: 1.1 (2021-05-16 15:36)
����: 1.0 (2021-05-27 17:00)

******************************************************** -->
<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,no24.*"  %>
<HTML>
  <HEAD><TITLE>�α��� ó��</TITLE></HEAD>
  
  <BODY>
    <%  
    DB.loadConnect();
    String ID = request.getParameter("id");
    String password = request.getParameter("password");
    System.out.println(ID);
    int chkLogin = DB.CheckLogin(ID, password);
    
	int group = DB.checkUserGroup(ID);	// �׷���̵�
    if(ID=="" || password=="") {
    	out.println("<script>alert('���̵� or ��й�ȣ�� �Է����ּ���.'); location.href='login.html';</script>");
	}
    else if(chkLogin == 1)
    {
		if(group == 1) {// ȸ��
			session.setAttribute("group", 1);
		} else if(group == 10) {	// ������
			session.setAttribute("group", 10);
		}
		session.setAttribute("userID", ID); 
		response.sendRedirect("index.jsp"); //���� ��������
    } else if(chkLogin == 0){
    	out.println("<script>alert('�α��� ����. ���̵�� ��й�ȣ�� Ȯ�����ּ���.'); location.href='login.html';</script>");
    }
    
    %>
  
  </BODY>
</HTML>