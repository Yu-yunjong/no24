<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<% 
String id=(String) session.getAttribute("pcid");
String newPW=request.getParameter("newPW");
int result = DB.newPW(id ,newPW);
							if(result == 1) {
								System.out.println("변경완료");
					%>
							<script type="text/javascript">
								alert('비밀번호가 변경되었습니다.');
								setTimeout(function() {
									window.location.href = 'login.html';	// 리다이렉트: javascript로 사용
									}, 500);
							</script>
					<%
							}
							else
								out.println("<script> alert(\"비밀번호 변경에 실패하였습니다. 입력한 정보를 확인해주세요.\"); window.history.go(-1); </script>");
						
						%>