<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-26 19:03)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>ȸ�� Ż��</title>
	</head>
		<body bgcolor="E7F5EF">
		
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>
		
		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html" />
		<h1 id="logotext">ȸ�� Ż��</h1><br/>
		
		
		<!-- ���� ���� �߰� -->

		<div id="mainbox" >
			<h2><b>�� �� ���� > ȸ�� Ż��</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						String id = (String) session.getAttribute("userID");
						
						// ���޹��� ��
						request.setCharacterEncoding("euc-kr");
						String check = (String) request.getParameter("check");
						String PW = EncriptPassword.encriptPassword((String) request.getParameter("pw"));
						
						if(id == null || check == null){
							out.println("<h3>�α��� �� �̿����ּ���.</h3>");
						} else {
							DB.loadConnect();
							ResultSet rs = DB.selectCurrentPW(id);
							
							String dbPW = null;
							while(rs.next()) {
								dbPW = rs.getString("pw");
							}
							int chk = 0;	// Ż�� ����
							
							if(check.equals("Ż�� ���") && dbPW.equals(PW)){
								DB.deleteBasketForDeleteUser(id);	// ��ٱ��� ����
								DB.updateOrdersForDeleteUser(id);	// order���̺��� uid�� null�� ����(�ܷ�Ű ���� �ذ�)
								DB.updateCancelForDeleteUser(id);	// cancel���̺��� uid�� null�� ����(�ܷ�Ű ���� �ذ�)
								chk = DB.deleteUser(id);
							} else{
								out.println("<h3>��й�ȣ Ȥ�� Ȯ�� �޽����� �߸� �Է��Ͽ����ϴ�.</h3>");
							}
							
							if(chk == 1){
								session.invalidate();	// ���� ����
								out.println("<h3>ȸ�� Ż��Ǿ����ϴ�.<br />���ݱ��� �̿��� �ּż� �����մϴ�.</h3>");
							} else {
								out.println("<h3>Ż�� ���� �� �����Ͽ����ϴ�.<br />�����ڿ��� �������ּ���.</h3>");
							}
							
						}
						%>
					</td>
				</tr>
				
			</table>
		 </div>

	</body>
</html>