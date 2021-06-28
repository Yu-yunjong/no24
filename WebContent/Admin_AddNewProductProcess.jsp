<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-17 18:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>������ - ��ǰ ���</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>     

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html"></img>
		<h1 id="logotext">������ �޴�</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="Admin_SubMenu.html"></iframe>
		
		<%
		String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
		DB.loadConnect();// DB ����
		
		// ���޹��� ��
		request.setCharacterEncoding("euc-kr");
		String group = (String) request.getParameter("group");
		String category = (String) request.getParameter("category");
		String pname = (String) request.getParameter("pname");
		String author = (String) request.getParameter("author");
		String strDate = (String) request.getParameter("date");
		String strPrice = (String) request.getParameter("price");
		String strAmount = (String) request.getParameter("amount");
		
		String imgName = (String) session.getAttribute("imgName");
		%>
		
		<!-- ���� ���� �߰� -->

		<div id="mainbox" >
			<h2><b>�� ��ǰ ��� > �ű� ��ǰ ���</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<%
						// ���� ��ǰ��ȣ ��ȸ
						ResultSet rs = DB.selectQuery("SELECT * FROM nextSerial WHERE serialType='pno';");
						String serial = null;
						while(rs.next()){
							serial = "p" + rs.getString("serial");
						}
						
						// �Է��� ����� DB�� ����� ����� ��ġ���� ����
						if(group == null)
							out.println("<h3>�����ڸ� ���� ������ �������Դϴ�. �α��� �� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.</h3>");
						else {
							// ��¥ ���� Date �������� ��ȯ(+ ����ó��)
							// ����, ������ int�� ĳ����(�Էµ� ���� ���ڰ� �ƴ� ��� ����ó��)
							Date date = null;
							int amount = 0;
							int price = 0;
							try {
								date = java.sql.Date.valueOf(strDate);
								amount = Integer.parseInt(strAmount);
								price = Integer.parseInt(strPrice);
								
								if(imgName == null)
									out.println("<h3>�̹��� ������ ÷�� ��, �ٽ� ��ǰ�� ������ּ���.</h3>");
								else if(group.equals("none") || category.equals("none"))
									out.println("<h3>�׷� or ī�װ� ���� ��, �ٽ� ��ǰ�� ������ּ���.</h3>");
								else {
									int count = 0;
									String imgRoute = "img/" + imgName;	// �̹��� ��� �Է�
									count = DB.insertProductInfo(serial, group, category, pname, author, amount, price, date, imgRoute);
									
									if(count == 1){
										DB.updateNextSerial("pno");
										String sql = "SELECT * FROM product WHERE pno = '" + serial + "'";
										rs = null;	// �ʱ�ȭ
								        rs = DB.selectQuery(sql);
										
										// ���� �̸� ����
										session.removeAttribute("imgName");
								        
								        // ȣ��Ǵ� �������� Java ��ü�� �����ϴ� ���: setAttribute()
								        out.println("<h3>�Է��� ��ǰ�� ��ϵǾ����ϴ�.</h3>");
								        request.setAttribute("title", "** ��ϵ� ��ǰ **"); 	        
								        request.setAttribute("RS", rs);
								        
								     	// ���ο� ������ ȣ���Ͽ� �����ϱ�
								        request.getRequestDispatcher("Admin_listRS.jsp").forward(request, response);
									}
								}
							} catch(java.lang.NumberFormatException e) {
								out.println("<h3>'����'�̳� '����'�� �߸��� ���� �Է��� �߸��Ǿ����ϴ�. (���ڸ� �Է� ����)<br/>Ȯ�� �� �ٽ� ������ּ���.</h3>");
							} catch(java.lang.IllegalArgumentException e) {
								out.println("<h3>��¥�� �߸��� ���� �Է��� �߸��Ǿ����ϴ�.<br/>Ȯ�� �� �ٽ� ������ּ���.</h3>");
							} catch(Exception e) {
								e.printStackTrace();
								out.println("<h3>��Ÿ ������ �߻��߽��ϴ�.<br/>Ȯ�� �� �ٽ� ������ּ���.</h3>");
							}
						}
						%>
					</td>
				</tr>
			</table>
		 </div>

	</body>
</html>