<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

대풍: 1.0 (2021-05-16 13:01)
구signup.html 구SignUp.jsp
******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<html>
    <head>
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="common.css">
    <SCRIPT LANGUAGE="JavaScript">

   function Check()
   {
      if (!document.getElementById("id").value)
      {
          alert("아이디를 입력하세요");    
          document.getElementById("id").focus();
          return;
      }

      else if (!document.getElementById("name").value)
      {
          alert("이름을 입력하세요");    
          document.getElementById("name").focus();
          return;
      }

      else if (!document.getElementById("pwd").value)
      {
          alert("비밀번호를 입력하세요");    
          document.getElementById("pwd").focus();
          return;
      }

      else if (!document.getElementById("pwd_confirm").value)
      {
          alert("비밀번호확인을 입력하세요");    
          document.getElementById("pwd_confirm").focus();
          return;
      }

      else if (document.getElementById("pwd").value != 
    	  document.getElementById("pwd_confirm").value)
      {
          alert("비밀번호가 일치하지 않습니다.\n다시 입력해주세요.");    
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
 
	<!-- 상단 메뉴 영역 -->
	<iframe id="topMenu" src="topMenu.jsp"></iframe>

   <!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" href="index.html"></img>
		<h1 id="logotext">회원가입</h1><br/>
	<!-- 메인 상자 추가 -->
		<div id="mainbox1" >
   <form action="signupProcess.jsp" method="post" name="userinput">
    
    <body bgcolor="E7F5EF">
    <br/><br/><br/><br/>
     <table border=1 bgcolor="#58D3F7" align="center">
		<tr>
          <td width=150> 아이디 </td>
          <td>
             <input type=text size=20  id="id" maxlength=16 name=id > 
          </td>
         </tr>	       
          <tr><td width=150>  비밀번호  </td> 
         <td>
            <input type=password id="pwd" size=20 maxlength=16 name=pwd> </td>
        </tr>
        <tr><td width=150>  비밀번호 확인  </td>
          <td>
             <input type=password id="pwd_confirm"size=20  maxlength=16 name=pwd_confirm> </td>
        </tr>
        <tr><td width=150>  이름  </td>
          <td>
             <input type=text id="name"size=20  maxlength=16 name=name> ▶ 실명(한글이름) </td>
        </tr>
      
      <tr>
						<td>
							생년월일: 
						</td>
					 	<td>
							<select name="year">
								<option value="none">년</option>
								<%
								for(int i = 1920; i < 2021; i++) {
									// 생년월일 값 선택
									
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								
								%>
							</select>
							<select name="month">
								<option value="none">월</option>
								<%
								for(int i = 1; i <= 12; i++) {
									// 생년월일 값 선택
									
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								%>
							</select>
							<select name="day">
								<option value="none">일</option>
								<%
								for(int i = 1; i <= 31; i++) {
									// 생년월일 값 선택
									
									out.println("<option value=" + i + ">" + i + "</option>");
								}
								%>
							</select>
						</td>
					</tr>
        <tr><td width=150>  휴대전화  </td>
          <td>
             <input type=text size=5 required="required" name=phone1 value=010>
            - <input type=text size=5 required="required" name=phone2 maxlength=4> 
            - <input type=text size=5 required="required" name=phone3 maxlength=4>  
          </td>
        </tr>
		
		<tr><td width=150>이메일  </td>
          <td>
             <input type=text size=50 name=email></td>
        </tr>
      <tr><td width=150> 주 소  </td>
          <td>
             <input type=text size=50 name=address></td>
      </tr>   
      <tr>  
      <td colspan=2 align="right">
			<input type="button" OnClick="Check()" value="회원가입">
	  </td> 
		</tr>	
		</table>
	
	</form>
	</div>
	</body>
	</html>