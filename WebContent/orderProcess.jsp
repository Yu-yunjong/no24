<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-25 22:01)

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
		<title>�ֹ��Ϸ�</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">�ֹ��Ϸ�</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- ���� ���� �߰� -->
		<div id="mainbox" >
			<h2><b>�� �����Ϸ�</b></h2>
			<table border=0 cellspacing=2 cellpadding=2 >
				<%
				String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
				if(id == null)
					out.println("<tr><td><h3>�α��� �� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.</h3></td></tr>");
				else {
					try{
						// ���޹��� ��
						request.setCharacterEncoding("euc-kr");
						String bno[] = request.getParameterValues("selectBno");		// ��ٱ��� ��ȣ
						String omethod = (String) request.getParameter("omethod");	// �������
						String opayment = (String) request.getParameter("opayment");// ī���ȣ or ���¹�ȣ
						String address = (String) request.getParameter("address");	// ����� �ּ�
						String memo = (String) request.getParameter("memo");		// ��۽� �޸�

						String pno[] = new String[bno.length], pname[] = new String[bno.length], bdate[] = new String[bno.length];
						int bamount[] = new int[bno.length], bprice[] = new int[bno.length], btotal[] = new int[bno.length], nowAmount[] = new int[bno.length];
						
						DB.loadConnect();
						ResultSet rs;
						int count = 0;	// �ֹ�ó�� �� Ƚ��
						String sql = null;
						String err = "";	// �������� �޽���
						for(int i = 0; i < bno.length; i++) {
							// ���� �ֹ���ȣ ��ȸ
							rs = null;
							rs = DB.selectQuery("SELECT * FROM nextSerial WHERE serialType='ono';");
							String serial = null;
							if(rs.next()){
								serial = "o" + rs.getString("serial");
							}
							
							// ���� �����ȣ ��ȸ
							rs = null;
							rs = DB.selectQuery("SELECT * FROM nextSerial WHERE serialType='sno';");
							String sno = null;
							if(rs.next()){
								sno = rs.getString("serial");
							}
							
							rs = null;
							rs = DB.selectBnoBasket(bno[i]);
							if(rs.next()) {
								pno[i] = rs.getString("basket.pno");
								pname[i] = rs.getString("pname");
								bdate[i] = rs.getDate("bdate").toString();
								bamount[i] = rs.getInt("bamount");
								bprice[i] = rs.getInt("bprice");
								btotal[i] = rs.getInt("btotal");
							}
							
							// ��ǰ �������� ��������
							rs = null;
							rs = DB.selectProductInfo(pno[i]);
							if(rs.next()) {
								nowAmount[i] = rs.getInt("amount");
							}
							
							// �ֹ�ó��
							if(nowAmount[i] < bamount[i]){
								err = "�Ϻ� ��ǰ�� ������ ������ �����մϴ�. <br/>��ǰ�� ��� Ȯ�����ּ���.";
							} else {
								count = count + DB.insertOrder(serial, pno[i], bno[i], id, bamount[i], 
										bprice[i], omethod, opayment, "�ֹ�", address, sno, memo);
								
								if(count == 1){// �ֹ��� 1������ ���
									DB.deleteBasket(bno[i]);	// ��ٱ��Ͽ��� �ش� ��ǰ ����
									DB.updateNextSerial("ono");	// ���� �ֹ���ȣ�� ������Ʈ
									DB.updateNextSerial("sno");	// ���� ���� ��ȣ�� ������Ʈ
									sql = "SELECT * FROM orders WHERE ono = '" + serial + "'";
									rs = null;	// �ʱ�ȭ

									// ��� ��Ȳ ������Ʈ
									DB.updateProductAmount(pno[i], nowAmount[i] - bamount[i]);
								} else if(count > 1) { // �ֹ��� 1�� �̻��� ���, 2�����ʹ� ���⸦ ����.
									DB.deleteBasket(bno[i]);	// ��ٱ��Ͽ��� �ش� ��ǰ ����
									DB.updateNextSerial("ono");
									DB.updateNextSerial("sno");
									sql = sql + " OR ono = '" + serial + "'";
									rs = null;	// �ʱ�ȭ

									// ��� ��Ȳ ������Ʈ
									DB.updateProductAmount(pno[i], nowAmount[i] - bamount[i]);
								}
							}
						}
						System.out.println(sql);
						rs = DB.selectQuery(sql);
						
						// ��ٱ��Ͽ� ���� �׸��� ���ǿ��� pno ����
						session.removeAttribute("pno");
				        
				        // ȣ��Ǵ� �������� Java ��ü�� �����ϴ� ���: setAttribute()
				        request.setAttribute("title", "<center><tr>" + err +"<td></td><td><h3>�ֹ��Ϸ�.</h3></td></tr><br/>** �ֹ� ó���� ��ǰ **</center>"); 	        
				        request.setAttribute("RS", rs);
				        
				     	// ���ο� ������ ȣ���Ͽ� �����ϱ�
				        request.getRequestDispatcher("listRS.jsp").forward(request, response);
						

					} catch(Exception e) {
						out.println("<script> alert(\"���������� ������� �ʾҽ��ϴ�! �ٽ� �õ����ּ���.\"); window.history.go(-1); </script>");
					}
				}%>
			</table>
		 </div>
	</body>
</html>