<!-- ******************** ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

����: 1.0 (2021-05-16 13:01)

******************************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="no24.*, java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�� ���� - ��й�ȣ ����</title>
	</head>
	<body>
		<%
			// ���޹��� ��
			request.setCharacterEncoding("euc-kr");
			String newPW = EncriptPassword.encriptPassword((String) request.getParameter("newPW"));
			String currentPW = EncriptPassword.encriptPassword((String) request.getParameter("nowPW"));
			
			DB.loadConnect();
			
			// ���̵� ����(�α����� ���̵� �о������ �����ؾ���.)
			String id = (String) session.getAttribute("userID");	// ���̵� �Է� or �α����� ���̵� ��ȸ�ؼ� �ֱ�
			
			ResultSet rs = DB.selectCurrentPW(id);
			String inputPW = null;
			while(rs.next()){
				inputPW = rs.getString("pw");
			}
			
			// ���� �����ϸ� ���� �߻��ϵ���
			if(newPW.equals(EncriptPassword.encriptPassword(null))){
		%>
				<script type="text/javascript">
					alert('�α��� �� �ٽ� �õ����ּ���.');
					setTimeout(function() {
						window.location.href = 'ChangePW.html';	// �����̷�Ʈ: javascript�� ���
						}, 500);
				</script>
		<%
			}
			else{
					if(inputPW.equals(currentPW)){
						if(newPW.equals("")){
							System.out.println("��й�ȣ�� ��� �ֽ��ϴ�.");
					%>
							<script type="text/javascript">
								alert('�Է��Ͻ� ��й�ȣ�� �����Դϴ�. Ȯ�� �� �ٽ� �������ּ���.');
								setTimeout(function() {
									window.location.href = 'ChangePW.html';	// �����̷�Ʈ: javascript�� ���
									}, 500);
							</script>
					<%
						}
						else{
							int result = DB.changeAdminPW(id ,newPW);
							if(result == 1) {
								System.out.println("����Ϸ�");
					%>
							<script type="text/javascript">
								alert('��й�ȣ�� ����Ǿ����ϴ�.');
								setTimeout(function() {
									window.location.href = 'ChangePW.html';	// �����̷�Ʈ: javascript�� ���
									}, 500);
							</script>
					<%
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
							setTimeout(function() {
								window.location.href = 'ChangePW.html';	// �����̷�Ʈ: javascript�� ���
								}, 500);
						</script>
				<%
				}
			}
			
			
		%>
	</body>
</html>