<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

��ǳ: 1.0 (2021-05-16 13:01)
��signup.html ��SignUp.jsp
******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<html>
    <head>
    <title>ȸ������</title>
    <link rel="stylesheet" type="text/css" href="common.css">
    <SCRIPT LANGUAGE="JavaScript">

   function Check()
   {
      if (!document.getElementById("id").value)
      {
          alert("���̵� �Է��ϼ���");    
          document.getElementById("id").focus();
          return;
      }

      else if (!document.getElementById("name").value)
      {
          alert("�̸��� �Է��ϼ���");    
          document.getElementById("name").focus();
          return;
      }

      else if (!document.getElementById("pwd").value)
      {
          alert("��й�ȣ�� �Է��ϼ���");    
          document.getElementById("pwd").focus();
          return;
      }

      else if (!document.getElementById("pwd_confirm").value)
      {
          alert("��й�ȣȮ���� �Է��ϼ���");    
          document.getElementById("pwd_confirm").focus();
          return;
      }

      else if (document.getElementById("pwd").value != 
    	  document.getElementById("pwd_confirm").value)
      {
          alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.\n�ٽ� �Է����ּ���.");    
          document.getElementById("pwd").focus();
          document.getElementById("pwd").select();
          return;
      }
      else
      {
       var form=document.userinput;
  
      form.submit();
      }
   }
</SCRIPT>   
<style>
body,ul,li{
marrgin:0; padding:0; list-style:none;
}
.menu-1{
text-align:right;
}
.menu-1> ul{

display:inline-block;
}
.menu-1 > ul > li {
display:inline-block;
}
</style>
  </head>
 
<body>
 
	<!-- ��� �޴� ���� -->
	<iframe id="topMenu" src="topMenu.jsp"></iframe>

   <!-- ��� �ΰ� ���� -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html"></img>
		<h1 id="logotext">ȸ������</h1><br/>
	<!-- ���� ���� �߰� -->
		<div id="mainbox1" >
   <form action="signupProcess.jsp" method="post" name="userinput">
    
    <body bgcolor="E7F5EF">
    <br/><br/><br/><br/>
     <table border=1 bgcolor="#58D3F7" align="center">
		<tr>
          <td width=150> ���̵� </td>
          <td>
             <input type=text size=20  id="id" maxlength=16 name=id > 
          </td>
         </tr>	       
          <tr><td width=150>  ��й�ȣ  </td> 
         <td>
            <input type=password id="pwd" size=20 maxlength=16 name=pwd> </td>
        </tr>
        <tr><td width=150>  ��й�ȣ Ȯ��  </td>
          <td>
             <input type=password id="pwd_confirm"size=20  maxlength=16 name=pwd_confirm> </td>
        </tr>
        <tr><td width=150>  �̸�  </td>
          <td>
             <input type=text id="name"size=20  maxlength=16 name=name> �� �Ǹ�(�ѱ��̸�) </td>
        </tr>
      
      <tr>
						<td>
							�������: 
						</td>
					 	<td>
							<select name="year">
								<option value="none">��</option>
								<%
								for(int i = 1920; i < 2021; i++) {
									// ������� �� ����
									
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								
								%>
							</select>
							<select name="month">
								<option value="none">��</option>
								<%
								for(int i = 1; i <= 12; i++) {
									// ������� �� ����
									
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								%>
							</select>
							<select name="day">
								<option value="none">��</option>
								<%
								for(int i = 1; i <= 31; i++) {
									// ������� �� ����
									
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								%>
							</select>
						</td>
					</tr>
        <tr><td width=150>  �޴���ȭ  </td>
          <td>
             <input type=text size=5 required="required" name=phone1 value=010>
            - <input type=text size=5 required="required" name=phone2 maxlength=4> 
            - <input type=text size=5 required="required" name=phone3 maxlength=4>  
          </td>
        </tr>
		
		<tr><td width=150>�̸���  </td>
          <td>
             <input type=text size=50 name=email></td>
        </tr>
      <tr><td width=150> �� ��  </td>
          <td>
             <input type=text size=50 name=address></td>
      </tr>   
      <tr>  
      <td colspan=2 align="right">
			<input type="button" OnClick="Check()" value="ȸ������">
	  </td> 
		</tr>	
		</table>
	
	</form>
	</div>
	</body>
	</html>