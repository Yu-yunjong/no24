<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-27 21:01)

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
		<title>��ǰ �˻�</title>
		<script type="text/javascript">

		 function keyword_check(){
		
		  if(document.search.keyword.value==''){ //�˻�� ���� ���  
		
		  alert('�˻�� �Է��ϼ���'); //���â ��� 
		
		  document.search.keyword.focus(); //�ٽ� �˻�â���� ���ư� 
		
		  return false; 
		
		  }
		
		  else return true;
		
		 }
		 </script>
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<h1 id="logotext">��ǰ �˻�</h1><br/>
		
		<!-- ��� �˻�â-->
		<form name="search" align="center" style="margin-right:150px;" method = "post"  action ="Search.jsp" onsubmit="return keyword_check()">
		<table id="Shtable">
		<tr>
		<td>
		  <input type="text" name="keyword"> 
		</td>
		<td>
		<input type="submit" value="search">
		</td>
		</tr>
		</table>
		</form>  
		
		<!-- ���� ���� �߰� -->
		<form action = "" method ="POST">
			<div id="mainbox2">
				<h2><b>�� ��ǰ�� �˻� ���</b></h2>
				<table border="3" width="1500" >
					<tr bgcolor=#CCCCCC><td><h2>�̹���</h2></td><td><h2>�׷�</h2></td><td><h2>ī�װ�</h2></td><td><h2>��ǰ��</h2></td>
					<td><h2>����/�۰</h2></td><td><h2>�߸���</h2></td><td><h2>����</h2></td><td><h2>��� ����</h2></td><td><h2>������</h2></td></tr>
					<%
					String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
					if(id == null)
						out.println("<script> alert(\"�α��� �� �ٽ� �õ����ּ���.\"); window.history.go(-1); </script>");
					else {
						// �޾ƿ� ��
						request.setCharacterEncoding("euc-kr");
					    
					    String keyword = request.getParameter("keyword");
					    DB.loadConnect();
					    ResultSet rs = DB.Search(keyword);
						int rowsCount = DB.rowsCount(rs);
						
						String pgroup[] = new String[rowsCount], category[] = new String[rowsCount], 
								pname[] = new String[rowsCount], pno[] = new String[rowsCount], 
								author[] = new String[rowsCount], img[] = new String[rowsCount],
								date[] = new String[rowsCount];
						int amount[] = new int[rowsCount], price[] = new int[rowsCount];
						int i = 0;	// �ε���
						while(rs.next()) {
							pno[i] = rs.getString("pno");
							pgroup[i] = rs.getString("pgroup");
							category[i] = rs.getString("category");
							pname[i] = rs.getString("pname");
							author[i] = rs.getString("author");
							img[i] = rs.getString("image");// �ѱ��̹��� �ȶߴ� ���, server.xml���� URIEncording="UTF-8" �߰� �ʿ�
							date[i] = rs.getDate("reldate").toString();
							amount[i] = rs.getInt("amount");
							price[i] = rs.getInt("price");
							i++;
						}
						for(i = 0; i < rowsCount; i++) {
							out.println("<tr><td><img width=\"170\" src=\""+ img[i] +"\"></td>");
							out.println("<td><h3>" + pgroup[i] + "</h3></td>");
							out.println("<td><h3>" + category[i] + "</h3></td>");
							out.println("<td><h3>" + pname[i] + "</h3></td>");
							out.println("<td><h3>" + author[i] + "</h3></td>");
							out.println("<td><h3>" + date[i] + "</h3></td>");
							out.println("<td><h3>" + price[i] + "</h3></td>");
							out.println("<td><h3>" + amount[i] + "</h3></td>");
							out.println("<td><button type=\"button\" onclick=\"javascript:location.href='./ProductInfo.jsp?pno=" + 
							pno[i] + "'\">�󼼺���</button></td></tr>");
						}
						
						} // else�� ��ȣ �ݱ�%>
				</table>
			 </div>
	   </form>
	</body>
</html>