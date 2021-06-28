<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-17 18:01) ���� �׸� ���� �Ϸ�

******************************************************** -->

<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*, java.util.Date" %>
<HTML>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
	</head>

  <BODY bgcolor="E7F5EF">
		<!-- ��� �޴� ���� -->
		<iframe id="topMenu" src="topMenu.jsp"></iframe>
		 
  		<!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html"></img>
		<h1 id="logotext">������ �޴�</h1><br/>
		
		<!-- ����޴� �߰�(iframe) -->
		<iframe id="sideMenuIframe" src="Admin_SubMenu.html"></iframe>
		
		<div id="mainbox" >
 	<%	
 	 	   request.setCharacterEncoding("euc-kr");
 	
 	       ResultSet rs = (ResultSet) request.getAttribute("RS");

 	       
 System.out.print("   >> rs : " + rs + "\n");	       
		   ResultSetMetaData md = rs.getMetaData();
		   int count = md.getColumnCount();
		   String[] columns = new String[count];
		   String[] columnTypes = new String[count];
		   for(int i=0; i<count; i++){
			   columns[i] = md.getColumnLabel(i+1);
			   columnTypes[i] = md.getColumnTypeName(i+1);
System.out.print("   >> clms : " + columns[i] + " " + columnTypes[i]+ "\n");	
     	   }
	  %>
	   <br>
	   <H3 align=center > <% out.print(request.getAttribute("title"));   %> </H3>
	   
	   <table id="selectTable" align=center valign=top border="1" cellpadding="8" cellspacing="0" bordercolor="#999999"> 
       <%
			out.print("<tr bgcolor=#CCCCCC>" );
			for(int i=0; i<columns.length; i++){
				out.print("<th>" + columns[i]  + "</th>" );	
			}
			out.print("</tr>" );

			while(rs.next()) {
				out.print("<tr>" );

				for(int i=0; i<columns.length; i++){

					Object obj= rs.getObject(columns[i]);
 // System.out.print("   >> col value : " + (obj) + "\n");
					if (obj == null)    // null ��ü�̸� null�� ���
						out.print("<td> null </td>");
					else if (columnTypes[i].equals("INTEGER") || columnTypes[i].equals("FLOAT")
			                             || columnTypes[i].equals("DOUBLE") || columnTypes[i].equals("BIGINT") )
						out.print("<td align=right>" + obj + "</td>");	
					else if (columnTypes[i].equals("VARCHAR") && ((String) obj).equals(""))
					     out.print("<td> &nbsp; </td>");	
					else if (columnTypes[i].equals("VARCHAR") )
						out.print("<td align=left>"+ obj + "</td>");	
 			     	else
					     out.print("<td>" + obj + "</td>");	
				}
				out.print("</tr>" );
			}
      %>
	  </table >
	  </div>
  </BODY>
</HTML>
