<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<% 
String id=(String) session.getAttribute("pcid");
String newPW=request.getParameter("newPW");
int result = DB.newPW(id ,newPW);
							if(result == 1) {
								System.out.println("����Ϸ�");
					%>
							<script type="text/javascript">
								alert('��й�ȣ�� ����Ǿ����ϴ�.');
								setTimeout(function() {
									window.location.href = 'login.html';	// �����̷�Ʈ: javascript�� ���
									}, 500);
							</script>
					<%
							}
							else
								out.println("<script> alert(\"��й�ȣ ���濡 �����Ͽ����ϴ�. �Է��� ������ Ȯ�����ּ���.\"); window.history.go(-1); </script>");
						
						%>