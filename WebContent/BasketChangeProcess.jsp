<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-26 16:01)

******************************************************** -->

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URISyntaxException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>��ٱ��� ����</title>
		
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">��ٱ��� ����</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="SubMenu.html"></iframe>
		
		<!-- ���� ���� �߰� -->
		<div id="mainbox" >
			<h2><b>�� ��ٱ��� ����</b></h2>
			<table border=0 cellspacing=2 cellpadding=2 >
				<%
				String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
				if(id == null)
					out.println("<tr><td><h3>�α��� �� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.</h3></td></tr>");
				else {
					try{
						// ���޹��� ��
						request.setCharacterEncoding("euc-kr");
						String bno[] = request.getParameterValues("selectBno");
						String bamountArr[] = request.getParameterValues("bamount");
						String bpriceArr[] = request.getParameterValues("bprice");
						int bamount[] = new int[bno.length], bprice[] = new int[bno.length];
						for(int i = 0; i < bno.length; i++) {
							bamount[i] = Integer.parseInt(bamountArr[i]);
							bprice[i] = Integer.parseInt(bpriceArr[i]);
						}
						
						String pno[] = new String[bno.length];
						int nowAmount[] = new int[bno.length];
						DB.loadConnect();
						ResultSet rs;
						int count = 0;	// �ֹ�ó�� �� Ƚ��
						String sql = null;
						String err = "";	// �������� �޽���
						
						for(int i = 0; i < bno.length; i++) {
							rs = null;
							rs = DB.selectBnoBasket(bno[i]);
							if(rs.next()) {
								pno[i] = rs.getString("basket.pno");
								
							}
							
							// ��ǰ �������� ��������
							rs = null;
							rs = DB.selectProductInfo(pno[i]);
							if(rs.next()) {
								nowAmount[i] = rs.getInt("amount");
							}
							
							// ��ٱ��� update
							if(nowAmount[i] < bamount[i]){
								err = "�Ϻ� ��ǰ�� ������ �����մϴ�. <br/>��ǰ�� ��� Ȯ�����ּ���.";
							} else if(bamount[i] < 1) {
								err = "���� �߸� �ԷµǾ����ϴ�. 1�� �̻��� ���� �Է� �����մϴ�. <br/>�̿��� ��ǰ�� ���� ����˴ϴ�.";
							} else {
								count = count + DB.updateBasketAmount(bno[i], bamount[i], bprice[i]);
							}
						}
						if(count >= 1) {
							out.println("<tr><td><h2>" + err + "</br></br>��ٱ����� " + count + "���� ��ǰ ������ ����Ǿ����ϴ�.<h2></td></tr>");
						} else {
							out.println("<tr><td><h2>" + err + "<h2></td></tr>");
						}
						

					} catch(Exception e) {
						out.println("<script> alert(\"������ �߻��߽��ϴ�! �Է°� Ȯ�� �� �ٽ� �õ����ּ���.\"); window.history.go(-1); </script>");
					}
				}%>
			</table>
		 </div>
	</body>
</html>