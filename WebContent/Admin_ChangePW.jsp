<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.1 (2021-05-16 15:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>������-��й�ȣ ����</title>
	</head>
	<body>
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
		
			// ���޹��� ��
			request.setCharacterEncoding("euc-kr");
			String newPW = (String) request.getParameter("newPW");
			String currentPW = EncriptPassword.encriptPassword((String) request.getParameter("nowPW"));
			
			DB.loadConnect();
			
			// DB���� ���� ������ ��� ��ȸ
			String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
			
			ResultSet rs = DB.selectCurrentPW(id);
			String inputPW = null;
			while(rs.next()){
				inputPW = rs.getString("pw");
			}
			
			// ���� �����ϸ� ���� �߻��ϵ���
			if(id == null){
		%>
				<script type="text/javascript">
					alert('�α��� �� �ٽ� �õ����ּ���.');
					setTimeout(function() {
						window.location.href = 'Admin_ChangePW.html';	// �����̷�Ʈ: javascript�� ���
						}, 500);
				</script>
		<%
			}
			else{
					System.out.println("current: " + currentPW);
					System.out.println("db pw: " + inputPW);
					if(currentPW.equals(inputPW)){
						if(newPW.equals("")){
							System.out.println("��й�ȣ�� ��� �ֽ��ϴ�.");
					%>
							<script type="text/javascript">
								alert('�Է��Ͻ� ��й�ȣ�� �����Դϴ�. Ȯ�� �� �ٽ� �������ּ���.');
								// �����Լ� ���� �ٷ� �����ϸ� ���â �����ʰ� �Ѿ.. �̰Ŷ��� 2�ð� �Ѱ� �����ѵ� �Ѥ�
								setTimeout(function() {
									window.location.href = 'Admin_ChangePW.html';	// �����̷�Ʈ: javascript�� ���
									}, 500);
							</script>
					<%
								//response.sendRedirect("Admin_ChangePW.html");// �����̷�Ʈ: Java�ڵ�� ���
						}
						else{
							int result = DB.changeAdminPW(id ,EncriptPassword.encriptPassword(newPW));
							if(result == 1) {
								System.out.println("����Ϸ�");
					%>
							<script type="text/javascript">
								alert('��й�ȣ�� ����Ǿ����ϴ�.');
								// �����Լ� ���� �ٷ� �����ϸ� ���â �����ʰ� �Ѿ.. �̰Ŷ��� 2�ð� �Ѱ� �����ѵ� �Ѥ�
								setTimeout(function() {
									window.location.href = 'Admin_ChangePW.html';	// �����̷�Ʈ: javascript�� ���
									}, 500);
							</script>
					<%
								//response.sendRedirect("Admin_ChangePW.html");// �����̷�Ʈ: Java�ڵ�� ���
							}
							else
								System.out.println("�������");
						}
					}
					else {
						System.out.println("���� ��й�ȣ�� �߸� �ԷµǾ����ϴ�.");
				%>
						<script type="text/javascript">
							alert('��й�ȣ ���� ����!\n���� ��й�ȣ�� �߸� �ԷµǾ����ϴ�.');
							// �����Լ� ���� �ٷ� �����ϸ� ���â �����ʰ� �Ѿ.. �̰Ŷ��� 2�ð� �Ѱ� �����ѵ� �Ѥ�
							setTimeout(function() {
								window.location.href = 'Admin_ChangePW.html';	// �����̷�Ʈ: javascript�� ���
								}, 500);
						</script>
				<%
						//response.sendRedirect("Admin_ChangePW.html");// �����̷�Ʈ: Java�ڵ�� ���
				}
			}
			
			
		%>
	</body>
</html>