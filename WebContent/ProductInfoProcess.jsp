<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-23 11:01)

******************************************************** -->

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URISyntaxException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>��ǰ ������-��ٱ���</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">��ǰ ������</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<%
		//String pno = (String) session.getAttribute("pno");
		
		
		// ���޹��� ��
		request.setCharacterEncoding("euc-kr");
		String pno = (String) request.getParameter("pno");
		String amountStr = (String) request.getParameter("amount");
		String priceStr = (String) request.getParameter("price");
		String nowAmountStr = (String) request.getParameter("nowAmount");
		%>
		
		<!-- ���� ���� �߰� -->
		<div id="mainbox" >
			<h2><b>�� ��ٱ��Ͽ� ���</b></h2>
			<table border=0 cellspacing=2 cellpadding=2 >
				<%
				String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
				if(id == null)
					out.println("<tr><td><h3>�α��� �� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.</h3></td></tr>");
				else {
					int amount = 0, price = 0, nowAmount = 0;
					try{
						amount = Integer.parseInt(amountStr);
						price = Integer.parseInt(priceStr);
						nowAmount = Integer.parseInt(nowAmountStr);	// ��� ����
						
						DB.loadConnect();
						// ���� ��ǰ��ȣ ��ȸ
						ResultSet rs = DB.selectQuery("SELECT * FROM nextSerial WHERE serialType='bno';");
						String serial = null;
						while(rs.next()){
							serial = "b" + rs.getString("serial");
						}
						
						if(nowAmount < amount){
							out.println("<tr><td><h3>��� �������� ������ ������ ���� �� �����ϴ�.</h3></td></tr>");
						} else if(nowAmount == 0) {
							out.println("<tr><td><h3>��� �����մϴ�.</h3></td></tr>");
						} else if(amount <= 0){
							out.println("<tr><td><h3>�ּ� 1�� �̻��� �����ؾ� �մϴ�.</h3></td></tr>");
						} else {
							int count = DB.insertBasket(serial, id, pno, amount, price);
							
							if(count == 1){
								DB.updateNextSerial("bno");
								String sql = "SELECT * FROM basket WHERE bno = '" + serial + "'";
								rs = null;	// �ʱ�ȭ
						        rs = DB.selectQuery(sql);
								
								// ��ٱ��Ͽ� ���� �׸��� ���ǿ��� pno ����
								session.removeAttribute("pno");
						        
						        // ȣ��Ǵ� �������� Java ��ü�� �����ϴ� ���: setAttribute()
						        out.println("");
						        request.setAttribute("title", "<center><tr><td><h3>��ٱ��Ͽ� ��ϵǾ����ϴ�.</h3></td></tr><br/>** ��ϵ� ��ǰ **</center>"); 	        
						        request.setAttribute("RS", rs);
						        
						     	// ���ο� ������ ȣ���Ͽ� �����ϱ�
						        request.getRequestDispatcher("listRS.jsp").forward(request, response);
							}
						}
					} catch(Exception e) {
						out.println("<tr><td><h3>���ڸ� �Է� �����մϴ�.</h3></td></tr>");
					}
					
				%>
				<%} // else�� ��ȣ �ݱ�%>
			</table>
		 </div>
	</body>
</html>