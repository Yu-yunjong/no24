<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

��ǳ: 1.0 (2021-05-16 15:36)
idsearch�� ó���� ���ִ� ������
******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
    
<%   
    DB.loadConnect();
    
	String p1 = request.getParameter("phone1");
	String p2 = request.getParameter("phone2");
	String p3 = request.getParameter("phone3");
	String email = request.getParameter("email");
	String phone = p1 + "-" + p2 + "-" + p3;
	ResultSet rs = DB.idSearch(phone, email);
	String ID = null;
	while(rs.next()){
		ID = rs.getString("id");
	}
	
	if(ID != null) {
		out.println("<script> alert(\"ȸ�� ���̵�: " +ID + "\"); window.history.go(-1); </script>");
	} else {
		out.println("<script> alert(\"��ġ�ϴ� ���̵� �����ϴ�.\"); window.history.go(-1); </script>");
	}
	
		%>
		<!-- ���ιڽ� -->
<html>
<head>
<style>
#container{
height:250px;
display:flex;
<!--justify-content:center; -->
align-items:center;
}
#item{
;
width:130px;
}
#inner-container{

padding : 5px;
}
</style>
</head>
<body>
<div id="container">
  <div id='inner-container'>
 <div id='item'><button type="button" class="btn btn-primary active" id="btn" style="width:120pt;height:30pt;background-color: 23CF85;" 
	onclick="document.location.href='login.html'">�α��� �ϱ�</button>
	</div>
	<div id='item'>
 <button type="button" class="btn btn-primary active" id="btn" style="width:120pt;height:30pt;background-color: 23CF85;" 
	onclick="document.location.href='passwordsearch.html'">��й�ȣ ã��</button>	
</div>
</div>
</div>


</body>
</html>    