<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-31 19:03)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>������ - ȸ�� Ż��</title>
	</head>
		<body bgcolor="E7F5EF">
		
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>
		
		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html" />
		<h1 id="logotext">������ - ȸ�� Ż��</h1><br/>
		
		<%// ������ ���̵����� �˻�
		int group = 0;
		try {
			group = Integer.parseInt(session.getAttribute("group").toString());// ȸ���׷� ��ȸ
		} catch(Exception e){
			out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���.\"); location.href=\"Admin_UserInfoList.jsp\"; </script>");
		}
		
		if(group != 10) {
			out.println("<script> alert(\"�����ڸ� ��� ������ �������Դϴ�.\"); location.href=\"Admin_UserInfoList.jsp\"; </script>");
		}
		%>
		
		<!-- ���� ���� �߰� -->

		<div id="mainbox" >
			<h2><b>�� ȸ������ > ȸ�� Ż��</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						String id = (String) session.getAttribute("userID");
						
						// ���޹��� ��
						request.setCharacterEncoding("euc-kr");
						String userID = request.getParameter("userID");
						
						if(id == null){
							out.println("<h3>�α��� �� �̿����ּ���.</h3>");
						} else {
							int chk = 0;	// Ż�� ����
							
							DB.deleteBasketForDeleteUser(userID);	// ��ٱ��� ����
							DB.updateOrdersForDeleteUser(userID);	// order���̺��� uid�� null�� ����(�ܷ�Ű ���� �ذ�)
							DB.updateCancelForDeleteUser(userID);	// cancel���̺��� uid�� null�� ����(�ܷ�Ű ���� �ذ�)
							chk = DB.deleteUser(userID);
							
							
							if(chk == 1){
								out.println("<script> alert(\"ȸ�� Ż�� ����\"); location.href=\"Admin_UserInfoList.jsp\"; </script>");
							} else {
								out.println("<h3>ȸ�� Ż�� ó���� �����Ͽ����ϴ�.<br />�����ڿ��� �������ּ���.</h3>");
							}
							
						}
						%>
					</td>
				</tr>
				
			</table>
		 </div>

	</body>
</html>