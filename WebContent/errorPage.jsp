<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-24 14:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>���� ������</title>
	</head>
		<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>    

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left"/>
		<h1 id="logotext">���� �߻�</h1><br/>
		
		<!-- ���� ���� �߰� -->
		<div id="mainbox" >
			<h2><b></b></h2>
			<br/><br/><br/>
			<table border=0 cellspacing=0 cellpadding=2 >
				<tr>
					<td>
						<h2>ó���� ������ �߻��߽��ϴ�.</h2>
						�����ڿ��� ������ �ּ���..<BR>
						�������ϳ� �����ϰڽ��ϴ�.
						<HR>
						<%= exception%>
						<HR>
					</td>
				</tr>
			</table>
		 </div>
	</body>
</html>