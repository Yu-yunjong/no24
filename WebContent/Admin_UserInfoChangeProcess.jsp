<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-16 13:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>������ - ȸ������ ����</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>     

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html"></img>
		<h1 id="logotext">ȸ������ ����</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="Admin_SubMenu.html"></iframe>
		
		<%
		int group = 0;
		try {
			group = Integer.parseInt(session.getAttribute("group").toString());// ȸ���׷� ��ȸ
		} catch(Exception e){
			out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���.\"); location.href=\"index.jsp\"; </script>");
		}
		
		if(group != 10) {
			out.println("<script> alert(\"�����ڸ� ��� ������ �������Դϴ�.\"); location.href=\"index.jsp\"; </script>");
		}
		
		String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
		
		DB.loadConnect();
		
		// ���޹��� ��
		request.setCharacterEncoding("euc-kr");
		String phone = (String) request.getParameter("phone");
		String email = (String) request.getParameter("email");
		String year = (String) request.getParameter("year");
		String month = (String) request.getParameter("month");
		String day = (String) request.getParameter("day");
		String address = (String) request.getParameter("address");
		String userID = (String) request.getParameter("userID");
		
		// ��¥ ���� Date �������� ��ȯ
		String strDate = year + "-" + month + "-" + day;
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		if(year!=null || month!=null || day!=null){
			date = java.sql.Date.valueOf(strDate);
		}
		%>
		
		<!-- ���� ���� �߰� -->

		<div id="mainbox" >
			<h2><b>�� ȸ�� ���� > ȸ������ ����</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						// �Է��� ����� DB�� ����� ����� ��ġ���� ����
						if(year == null)
							out.println("<h3>�α��� �� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.</h3>");
						else {
							int check = 0;
							// �ּ� ���� ��ĭ�� ��� null�� �����ϵ���
							if(address.equals("")){
								check = DB.updateUserInfo(userID, phone, email, date, null);
							}
							else{
								check = DB.updateUserInfo(userID, phone, email, date, address);
							}
							
							if(check == 1){
								out.println("<script> alert(\"ȸ������ �����.\"); location.href=\"Admin_UserInfoList.jsp\"; </script>");
							}
							else
								out.println("<script> alert(\"���� �߻�! Ȯ���� ��õ��ٶ��ϴ�.\"); location.href=\"Admin_UserInfoList.jsp\"; </script>");
								
						}
						%>
					</td>
				</tr>
			</table>
		 </div>

	</body>
</html>