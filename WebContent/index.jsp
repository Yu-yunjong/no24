<!-- ******************** 파일 버전 *************************
파일 변경 시 1.0부터 계속 1.1, 1.2, ... 올라가는 식으로 작성해주세요.(파일 변경사항 있을 때, 덮어씌우기 위함.)
!!!!!!!!!!!! 누락하지 않고 변경 부탁드립니다.!!!!!!!!!!!!!

대풍: 1.0 (2021-05-16 13:01)
윤종: 1.0 (2021-05-27 20:31) 이미지 안불러와지는 부분, 상품이름 누락된것 수정, 제품 상세정보 연동

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

  if(document.search.keyword.value==''){ //검색어가 없을 경우  

  alert('검색어를 입력하세요'); //경고창 띄움 

  document.search.keyword.focus(); //다시 검색창으로 돌아감 

  return false; 

  }

  else return true;

 }
 </script>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="common.css">
		<title>메인 화면</title>
	</head>
		<body bgcolor="E7F5EF">
			<iframe id="topMenu" src="topMenu.jsp"></iframe>
  

		<!-- 상단 로고 영역 -->
		<img id="logoimg" src="img/no24.png" width=220 height=90 align="left" />
		<br/>
		
		
		
		<!-- 상단 검색창-->
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
		<!-- 상단박스  -->
		<div id="mainpagebox"><h3>&nbsp;메인</h3></div>
		<!-- 메인 상자 추가 -->

		<div id="mainbox" >
			<h2><b>새로 나온 상품</b></h2>
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
			<td><%=price[0]%> 원</td>
			<td><%=price[1]%> 원</td>
			<td><%=price[2]%> 원</td>
			<td><%=price[3]%> 원</td>
			</tr>
			<tr>
			<td><button type="button" onclick="javascript:location.href='./ProductInfo.jsp?pno=<%= pno[0] %>'">상세보기</button></td>
			<td><button type="button" onclick="javascript:location.href='./ProductInfo.jsp?pno=<%= pno[1] %>'">상세보기</button></td>
			<td><button type="button" onclick="javascript:location.href='./ProductInfo.jsp?pno=<%= pno[2] %>'">상세보기</button></td>
			<td><button type="button" onclick="javascript:location.href='./ProductInfo.jsp?pno=<%= pno[3] %>'">상세보기</button></td>
			</tr>
			</table>
		 </div>

	</body>
</html>