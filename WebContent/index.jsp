<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

��ǳ: 1.0 (2021-05-16 13:01)
����: 1.0 (2021-05-27 20:31) �̹��� �Ⱥҷ������� �κ�, ��ǰ�̸� �����Ȱ� ����, ��ǰ ������ ����

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*, java.text.*"%>
    <%
   
    DB.loadConnect();
    ResultSet rs = DB.reldatetop4();
    String[] pno=new String[4];
    String[] image=new String[4];
    String[] pname=new String[4];
    String[] category=new String[4];
    String[] author=new String[4];
    String[] price=new String[4];
    int i=0;
    while(rs.next())
    {
    	pno[i]=rs.getString("pno");
    	image[i]=rs.getString("image");
    	pname[i]=rs.getString("pname");
    	category[i]=rs.getString("category");
    	author[i]=rs.getString("author");
    	price[i]=rs.getString("price");
    	i++;
    }
   	%>
<!DOCTYPE html>
<html>
	<head>
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
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>���� ȭ��</title>
	</head>
		<body bgcolor="E7F5EF">
			<iframe id="topMenu" src="topMenu.jsp"></iframe>
  

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<br/>
		
		
		
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
		<!-- ��ܹڽ�  -->
		<div id="mainpagebox"><h3>&nbsp;����</h3></div>
		<!-- ���� ���� �߰� -->

		<div id="mainbox" >
			<h2><b>���� ���� ��ǰ</b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 width="1000" >
			<tr>
			<td><img width="160" src="<%=image[0] %>"></td>
			<td><img width="160" src="<%=image[1] %>"></td>
			<td><img width="160" src="<%=image[2] %>"></td>
			<td><img width="160" src="<%=image[3] %>"></td>
			</tr>
			<tr>
			<td><h4><%=pname[0]%></h4></td>
			<td><h4><%=pname[1]%></h4></td>
			<td><h4><%=pname[2]%></h4></td>
			<td><h4><%=pname[3]%></h4></td>
			</tr>
			<tr>
			<td><%=category[0]%></td>
			<td><%=category[1]%></td>
			<td><%=category[2]%></td>
			<td><%=category[3]%></td>
			</tr>
			<tr>
			<td><%=author[0]%></td>
			<td><%=author[1]%></td>
			<td><%=author[2]%></td>
			<td><%=author[3]%></td>
			</tr>
			<tr>
			<td><%=price[0]%> ��</td>
			<td><%=price[1]%> ��</td>
			<td><%=price[2]%> ��</td>
			<td><%=price[3]%> ��</td>
			</tr>
			<tr>
			<td><button type="button" onclick="javascript:location.href='./ProductInfo.jsp?pno=<%= pno[0] %>'">�󼼺���</button></td>
			<td><button type="button" onclick="javascript:location.href='./ProductInfo.jsp?pno=<%= pno[1] %>'">�󼼺���</button></td>
			<td><button type="button" onclick="javascript:location.href='./ProductInfo.jsp?pno=<%= pno[2] %>'">�󼼺���</button></td>
			<td><button type="button" onclick="javascript:location.href='./ProductInfo.jsp?pno=<%= pno[3] %>'">�󼼺���</button></td>
			</tr>
			</table>
		 </div>

	</body>
</html>