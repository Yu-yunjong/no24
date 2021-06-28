<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-17 18:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>������ - �ű� ��ǰ ���</title>
		
		<!-- Internet Explorer���� <input type="date"> ������ �ذ�(jQuery ���) -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
			// ���� ���� ���ϱ�
			var now = new Date();
			var year = now.getFullYear();
			
			// �󼼼���
			$.datepicker.setDefaults({
		        dateFormat: 'yy-mm-dd',
		        prevText: '���� ��',
		        nextText: '���� ��',
		        changeYear: true,
                changeMonth: true,
                yearRange: '1970:year', // ���� ǥ�õ� ���� ��������, ��, ������ � �������� �������� ����
		        monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
		        monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
		        dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		        dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		        dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		        showMonthAfterYear: true,
		        yearSuffix: '��'
		    });
			
			$( function() {
			    $( "#date" ).datepicker();
			  } );
		</script>
		<!-- ��¥ ���� �� -->
	</head>
	
	<body bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>

		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html" />
		<h1 id="logotext">������ �޴�</h1><br/>
		
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
		%>
		
		<!-- ���� ���� �߰� -->
		<form action = "Admin_AddNewProductProcess.jsp" method ="POST">
			<div id="mainbox" >
				<h2><b>�� ���� ��� > �űԵ��� ���</b></h2>
				<br/><br/><br/>
				<table border=0 cellspacing=0 cellpadding=2 >
					<tr>
						<td>
							�з�: 
						</td>
					 	<td>
							<select name="group" required>
								<option value="none">--- ���� ---</option>
								<%
								String[] list = { "����", "eBook", "�߰���", "����" };
								for(int i = 0; i < list.length; i++) {
									out.println("<option value=\"" + list[i] + "\">" + list[i] + "</option>");
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							ī�װ�: 
						</td>
					 	<td>
							<select name="category" required>
								<option value="none">--- ���� ---</option>
								<option value="none">=== ���� ===</option>
								<%
								String[] bookList = { "���", "�ǰ�/���", "����/�濵", 
										"�ι�/��ȸ", "���б���", "��ȭ", "����Ʈ�뺧", "��Ÿ��", 
										"�Ҽ�", "����", "����", "�ڱ���", "IT �����", "����" };
								for(int i = 0; i < bookList.length; i++) {
									out.println("<option value=\"" + bookList[i] + "\">" + bookList[i] + "</option>");
								}
								
								out.println("<option value=\"none\">=== ���� ===</option>");
								
								String[] cdList = { "����", "Ŭ����", "POP", "ROCK", "����", "OST", "����" };
								for(int i = 0; i < cdList.length; i++) {
									out.println("<option value=\"" + cdList[i] + "\">" + cdList[i] + "</option>");
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							��ǰ��: 
						</td>
					 	<td>
							<input type="text" name="pname" required />
						</td>
					</tr>
					<tr>
						<td>
							����/�۰: 
						</td>
					 	<td>
							<input type="text" name="author" required />
						</td>
					</tr>
					<tr>
						<td>
							������/�߸���: 
						</td>
					 	<td>
							<input type="text" name="date" id="date" required />
						</td>
					</tr>
					<tr>
						<td>
							����: 
						</td>
					 	<td>
							<input type="text" name="price" required />
						</td>
					</tr>
					<tr>
						<td>
							����: 
						</td>
					 	<td>
							<input type="text" name="amount" required />
						</td>
					</tr>
					<tr>
						<td>
							��ǰ �̹���: 
						</td>
					 	<td>
					 		<iframe id="fileupload" src="FileUpload.html"></iframe>
						</td>
					</tr>
					<tr>
						<td colspan=2 align="right">
							<br/><br/><input type = "submit" id="submit-btn" value = "���" style="width:50pt;height:30pt; font-size: 14pt;" >
						</td>
					</tr>
				</table>
			 </div>
	   </form>
	</body>
</html>