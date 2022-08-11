/********************* ���� ���� *************************
���� ���� �� 1.0���� ��� 1.1, 1.2, ... �ö󰡴� ������ �ۼ����ּ���.(���� ������� ���� ��, ������ ����.)
!!!!!!!!!!!! �������� �ʰ� ���� ��Ź�帳�ϴ�.!!!!!!!!!!!!!

��ǳ: 1.0 (2021-05-19)
����: 1.0 (2021-05-26 15:01)

********************************************************/

package no24;

import java.sql.*;

public class DB {
	static  Connection con         = null;
	static  Statement stmt         = null;
	static  ResultSet rs           = null ;

//	static String driver= "org.gjt.mm.mysql.Driver"; // ������ ���� �Ʒ��� ���
	static String driver= "com.mysql.cj.jdbc.Driver";
	static String URL = "jdbc:mysql://localhost:3306/no24";

	public static void loadConnect()  {
		try {
			// ������ �ݴ´�.
			if( stmt != null ) stmt.close();
			if( con != null ) con.close();
		} catch (SQLException ex ) {};  

		// ����̹� �ε�
		try {
			Class.forName(driver);

		} catch ( java.lang.ClassNotFoundException e ) {
			System.err.println("** Driver loaderror in loadConnect: " + e.getMessage() );
			e.printStackTrace();

		}

		try {

			// �����ϱ�
			con  = DriverManager.getConnection(URL, "no24", "onlyroot");

			System.out.println("\n"+URL+"�� �����");


		} catch( SQLException ex ) 
		{

			System.err.println("** connection error in loadConnect(): " + ex.getMessage() );
			ex.printStackTrace();
		}	   

	}

	public static void disconnect()  {
		try {
			// ������ �ݴ´�.
			if( stmt != null ) stmt.close();
			if( con != null ) con.close();
		} catch (SQLException ex ) {};    
	}

	public static ResultSet selectQuery(String sql) { 
		try {
			// Statement ���� 
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); // 2022-08-12 ����(���� �׽�Ʈ �� ������ ���� ���� - ���� ����: Operation not allowed for a result set of type ResultSet.TYPE_FORWARD_ONLY.)


			rs = stmt.executeQuery(sql);  

		} catch( SQLException ex ) 	    {
			System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
		}

		return rs;

	}

	public static int updateQuery(String sql) { 
		int count;

		try {
			// Statement ���� 
			stmt = con.createStatement();
			count = stmt.executeUpdate(sql);  
			return count;

		} catch( SQLException ex ) 	    {
			System.err.println("** SQL exec error in updateQuery() : " + ex.getMessage() );
			return 0;
		}
	}
	
	// ��ǳ
	public static int CheckLogin(String ID, String password) {
		
		int count=0;
		String pass=Integer.toString(password.hashCode());
		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "select * from user where id=? and pw=?;" ;
			System.out.println("\n  << for debug >> SQL : " + sql + "\n");
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, ID);
			prStmt.setString(2, pass);

			ResultSet rs = prStmt.executeQuery();  
			while(rs.next()){
				if(ID.equals(rs.getString("id")) && pass.equals(rs.getString("pw"))){
					count=1;
					
				}
				
				}
		
		} catch( SQLException ex ) {             
			System.err.println("error: " + ex.getMessage() );
		}
		return count;
	}
		// �Է��� ����� DB�� ����� ����� ��ġ���� ����
		public static int IDCheck(String ID)  {
			int check=1;
			
			
			try {                      
				// SQL ���ǹ��� �����Ѵ�.
				String sql = "select * from user where id=?;" ;
				System.out.println("\n  << for debug >> SQL : " + sql + "\n");
				PreparedStatement prStmt = con.prepareStatement(sql);

				prStmt.setString(1, ID);
				
	   
				ResultSet rs = prStmt.executeQuery();  
				while(rs.next()){
					if(ID.equals(rs.getString("id"))){
						check=0;
						
					}
					
					}
			
			} catch( SQLException ex ) {             
				System.err.println("error: " + ex.getMessage() );
			}
			return check;
		}
		
		
		public static int InsertUser(String id, String pwd, String name, String birthday,String phone ,String email,String address) {
			// ȸ������
			int count;
			
			String SQL = "insert into user(id, pw, uname, birthday, phone, email, address) values (?, ?, ?, ?, ?, ?,?)";
			
			try {
				// 1) PreparedStatement ��ü ����, SQL �߰�
				PreparedStatement pst = con.prepareStatement(SQL);
				
				// 2) ? �Ű������� �� ����
				pst.setString(1, id);
				pst.setString(2, pwd);
				pst.setString(3, name);
				pst.setString(4, birthday);
				pst.setString(5,phone);
				pst.setString(6,email);
				pst.setString(7, address);
				
				count = pst.executeUpdate();
			} catch(SQLException ex) {
				System.err.println("** SQL exec error in updateQuery() : " + ex.getMessage() );
				return 0;
			}
			return count;
		}
		
		public static ResultSet idSearch(String phone,String email) {
			
			String sql = "SELECT id FROM user WHERE phone = '" + phone + "' and email = '" + email + "';";
			System.out.println("   >> SQL : " + sql + "\n");

			return selectQuery(sql);
		}
		public static int PSCheck(String ID,String phone,String email)  {
			int check=1;
			
			
			try {                      
				// SQL ���ǹ��� �����Ѵ�.
				String sql = "select * from user where id=? and phone=? and email=?;" ;
				System.out.println("\n  << for debug >> SQL : " + sql + "\n");
				PreparedStatement prStmt = con.prepareStatement(sql);

				prStmt.setString(1, ID);
				prStmt.setString(2,phone);
				prStmt.setString(3, email);
	   
				ResultSet rs = prStmt.executeQuery();  
				while(rs.next()){
					if(ID.equals(rs.getString("id"))&&phone.equals(rs.getString("phone"))&&email.equals(rs.getString("email"))){
						check=0;
						
					}
					
					}
			
			} catch( SQLException ex ) {             
				System.err.println("error: " + ex.getMessage() );
			}
			return check;
		}
		public static int newPW(String id, String pw) {
			// �н����� ����
			int rpw=pw.hashCode();
			String sql = "UPDATE user SET pw = '" + rpw + "' WHERE id = '" + id + "';";
			return updateQuery(sql);
		}
		public static ResultSet reldatetop4() {
	     	// �ֱٹ߸��ϼ� 4���� 
	     	String sql = "select pno,image,pname,category,author,price from product order by reldate desc limit 4;";
	     	System.out.println("   >> SQL : " + sql + "\n");
	 		   
	     	return selectQuery(sql);
	    }
		
		public static ResultSet Search(String keyword) {
			// Ű���� �˻�
			String sql = "SELECT * FROM product WHERE pname LIKE '%"+ keyword + "%';";
			System.out.println("   >> SQL : " + sql + "\n");

			return selectQuery(sql);
		}


	// ����
	public static ResultSet selectCurrentPW(String id) {
		// ���� ��й�ȣ ��ȸ
		String sql = "SELECT pw FROM user WHERE id = '" + id + "';";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}
	
	public static int changeAdminPW(String id, String pw) {
		// �н����� ����
		String sql = "UPDATE user SET pw = '" + pw + "' WHERE id = '" + id + "';";
		return updateQuery(sql);
	}
	
	public static ResultSet selectUserInfo(String id) {
		// ����� ���̵�� ���� ��ȸ
		String sql = "SELECT uname, phone, birthday, email, address, regdate, lastlogin FROM user WHERE id = '" + id + "';";
		System.out.println("   >> SQL : " + sql + "\n");
		
		return selectQuery(sql);
	}
	
	public static int updateUserInfo(String id, String phone, String email, Date birthday, String address) {
		// ȸ������ ����
		int count;
		
		String SQL = "UPDATE user SET  phone=?, birthday=?, email=?, address=? WHERE id=?;";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			PreparedStatement pst = con.prepareStatement(SQL);
			
			// 2) ? �Ű������� �� ����
			pst.setString(1, phone);
			pst.setDate(2, birthday);
			pst.setString(3, email);
			pst.setString(4, address);
			pst.setString(5, id);
			
			count = pst.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in updateUserInfo() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	public static int insertProductInfo(String pno, String group, String category, String pname, String author, int amount, int price, Date date, String img) {
		// ��ǰ �߰�
		int count;
		
		String SQL = "INSERT INTO product VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			System.out.println(pno + " " + group + " " + category + " " + pname + " " + author + " " +
			amount + " " + price + " " + date + " "+ img);
			PreparedStatement pst = con.prepareStatement(SQL);
			
			// 2) ? �Ű������� �� ����
			pst.setString(1, pno);
			pst.setString(2, group);
			pst.setString(3, category);
			pst.setString(4, pname);
			pst.setString(5, author);
			pst.setInt(6, amount);
			pst.setInt(7, price);
			pst.setDate(8, date);
			pst.setString(9, img);
			
			count = pst.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in insertProductInfo() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	public static int updateNextSerial(String serialType) {
		// ���� �ø���� ������Ʈ(+1)
		int count;
		
		String SQL = "UPDATE nextSerial SET serial=serial+1 WHERE serialType='" + serialType + "';";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			Statement st = con.createStatement();
			
			count = st.executeUpdate(SQL);
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in updateNextSerial() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	public static int checkUserGroup(String ID) {
		int group = 0;
		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "select * from user where id=?;" ;
			System.out.println("\n  << for debug >> SQL : " + sql + "\n");
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, ID);

			ResultSet rs = prStmt.executeQuery();  
			
			// �׷� ��ȣ ��ȸ
			while(rs.next()){
				group = rs.getInt("ugroup");
			}
		
		} catch( SQLException ex ) {             
			System.err.println("error: " + ex.getMessage() );
		}
		return group;
	}
	
	public static int updateLastLogin(String id) {
		// �ֱ� �α��� ��¥ ����
				int count;
				
				String SQL = "UPDATE user SET lastlogin=current_timestamp() WHERE id='" + id + "';";
				
				try {
					// 1) PreparedStatement ��ü ����, SQL �߰�
					Statement st = con.createStatement();
					
					count = st.executeUpdate(SQL);
				} catch(SQLException ex) {
					System.err.println("** SQL exec error in updateLastLogin() : " + ex.getMessage() );
					return 0;
				}
				return count;
	}
	
	public static int deleteUser(String id) {
		// ȸ�� Ż��
		int count;
		
		String SQL = "DELETE FROM user WHERE id='" + id + "';";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			Statement st = con.createStatement();
			
			count = st.executeUpdate(SQL);
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in deleteUser() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	public static int insertUsedBook(String reqno, String uid, String category, String rname, String author, int amount, int price, Date reldate, String image) {
		// �߰��� ��Ͽ�û
		int count;
		
		String SQL = "INSERT INTO request VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, current_timestamp(), ?, ?);";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			PreparedStatement pst = con.prepareStatement(SQL);
			
			// 2) ? �Ű������� �� ����
			pst.setString(1, reqno);
			pst.setString(2, uid);
			pst.setString(3, "�߰���");
			pst.setString(4, category);
			pst.setString(5, rname);
			pst.setString(6, author);
			pst.setInt(7, amount);
			pst.setInt(8, price);
			pst.setDate(9, reldate);
			pst.setString(10, image);
			pst.setString(11, "��Ͽ�û");
			pst.setString(12, null);

			
			count = pst.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in insertUsedBook() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	// ȸ�����̵�� ��ٱ��� ��ȸ
	public static ResultSet selectBasket(String ID) {
		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "SELECT bno, basket.pno, pname, bdate, bamount, bprice, btotal FROM basket, product WHERE uid = ? AND basket.pno = product.pno;" ;
			System.out.println("\n  << for debug >> SQL : " + sql + "\n");
			PreparedStatement prStmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); // 2022-08-12 ����(���� �׽�Ʈ �� ������ ���� ���� - ���� ����: Operation not allowed for a result set of type ResultSet.TYPE_FORWARD_ONLY.)

			prStmt.setString(1, ID);

			rs = prStmt.executeQuery();  
		
		} catch( SQLException ex ) {             
			System.err.println("error: " + ex.getMessage() );
		}
		return rs;
	}
	
	// ��ǰ���̵�� ������ ��ȸ
	public static ResultSet selectProductInfo(String pno) {
		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "SELECT * FROM product WHERE pno = ?;" ;
			System.out.println("\n  << for debug >> SQL : " + sql + "\n");
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, pno);

			rs = prStmt.executeQuery();
		
		} catch( SQLException ex ) {             
			System.err.println("error: " + ex.getMessage() );
		}
		return rs;
	}
	
	// ��ٱ��Ͽ� �߰�
	public static int insertBasket(String bno, String uid, String pno, int bamount, int bprice) {
		int count;
		
		String SQL = "INSERT INTO basket VALUES(?, ?, ?, current_timestamp(), ?, ?, ?);";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			PreparedStatement pst = con.prepareStatement(SQL);
			
			// 2) ? �Ű������� �� ����
			pst.setString(1, bno);
			pst.setString(2, uid);
			pst.setString(3, pno);
			pst.setInt(4, bamount);
			pst.setInt(5, bprice);
			pst.setInt(6, bamount * bprice);

			
			count = pst.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in insertUsedBook() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	// ��ǰ ��� ���� ����
	public static int updateProductAmount(String pno, int amount) {
		int count;
		
		String SQL = "UPDATE product SET amount=" + amount + " WHERE pno='" + pno + "';";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			Statement st = con.createStatement();
			
			count = st.executeUpdate(SQL);
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in updateProductAmount() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	// DB�� �� ���� ���(table ������)
	public static int rowsCount(ResultSet rs) {
		int rowCount = 0;
		try {
			rs.last();	// Ŀ���� �� ������ �̵�
			rowCount = rs.getRow();	// ���� Ŀ���� Row Index ���� ����
			rs.beforeFirst();	// �ڿ��� �ٽ� ����ؾ� �ϹǷ� Ŀ���� �� ������ �̵�
			//System.out.println(rowCount);
		} catch (SQLException e1) {
			System.out.println("�� ���� ��� ����!");
			e1.printStackTrace();
		}
		return rowCount;
	}
	
	// ��ٱ��Ϲ�ȣ�� ��ٱ��� �׸� ��ȸ
	public static ResultSet selectBnoBasket(String bno) {
		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "SELECT bno, basket.pno, pname, bdate, bamount, bprice, btotal FROM basket, product WHERE bno = ? AND basket.pno = product.pno;" ;
			System.out.println("\n  << for debug >> SQL : " + sql + "\n");
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, bno);

			rs = prStmt.executeQuery();  
		
		} catch( SQLException ex ) {             
			System.err.println("error: " + ex.getMessage() );
		}
		return rs;
	}
	
	// ��ǰ �ֹ�
	public static int insertOrder(String ono, String pno, String bno, String uid, int oamount, int price, String omethod, String opayment, String ostatus, String oaddress, String sno, String memo) {
		int count;
		
		String SQL = "INSERT INTO orders(ono, pno, bno, uid, otime, oamount, price, omethod, opayment, ostatus, oaddress, sno, memo) "
				+ "VALUES(?, ?, ?, ?, current_timestamp(), ?, ?, ?, ?, ?, ?, ?, ?);";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			PreparedStatement pst = con.prepareStatement(SQL);
			
			// 2) ? �Ű������� �� ����
			pst.setString(1, ono);
			pst.setString(2, pno);
			pst.setString(3, bno);
			pst.setString(4, uid);
			pst.setInt(5, oamount);
			pst.setInt(6, price);
			pst.setString(7, omethod);
			pst.setString(8, opayment);
			pst.setString(9, ostatus);
			pst.setString(10, oaddress);
			pst.setString(11, sno);
			pst.setString(12, memo);

			
			count = pst.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in insertOrder() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	public static int deleteBasket(String bno) {
		// ȸ�� Ż�� �� ��ٱ��� ����
		int count;
		
		String SQL = "DELETE FROM basket WHERE bno='" + bno + "';";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			Statement st = con.createStatement();
			
			count = st.executeUpdate(SQL);
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in deleteBasket() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	// ��ٱ��� ���� ����
	public static int updateBasketAmount(String bno, int bamount, int bprice) {
		int count;
		
		String SQL = "UPDATE basket SET bamount=" + bamount + ", btotal=" + bamount*bprice +" WHERE bno='" + bno + "';";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			Statement st = con.createStatement();
			
			count = st.executeUpdate(SQL);
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in updateBasketAmount() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	// ����� ���� ��, ��ٱ��� ������ ����
	public static int deleteBasketForDeleteUser(String uid) {
		int count;
		
		String SQL = "DELETE FROM basket WHERE uid='" + uid + "';";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			Statement st = con.createStatement();
			
			count = st.executeUpdate(SQL);
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in deleteBasketDeleteUser() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
		
	// ����� ���� ��, �ܷ�Ű ���� �߻��ϹǷ�, orders ���̺��� uid�� null�� ����
	public static int updateOrdersForDeleteUser(String uid) {
		int count;
		
		String SQL = "UPDATE orders SET uid=null WHERE uid='" + uid + "';";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			Statement st = con.createStatement();
			
			count = st.executeUpdate(SQL);
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in updateOrderForDeleteUser() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	// ����� ���� ��, �ܷ�Ű ���� �߻��ϹǷ�, orders ���̺��� uid�� null�� ����
	public static int updateCancelForDeleteUser(String uid) {
		int count;
		
		String SQL = "UPDATE cancel SET uid=null WHERE uid='" + uid + "';";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			Statement st = con.createStatement();
			
			count = st.executeUpdate(SQL);
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in updateCancelForDeleteUser() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	// ��ǰ ���̺� ��ü ��ȸ
	public static ResultSet selectAllProduct() {
		String sql = "SELECT * FROM product;";
		System.out.println("   >> SQL : " + sql + "\n");
		
		return selectQuery(sql);
	}
	
	// ����� ID�� orders ���̺� ��ȸ
	public static ResultSet selectUidOrders(String id) {
		String sql = "SELECT * FROM orders, product WHERE orders.pno = product.pno AND uid = '" + id + "';";
		System.out.println("   >> SQL : " + sql + "\n");
		
		return selectQuery(sql);
	}
	
	// ����� ID�� ono�� orders ���̺� ��ȸ �� �� ������ ��ȯ(�ش� �ֹ��� ������ �ֹ��� �´��� Ȯ��)
	public static int selectUidWithOnoOrders(String id, String ono) {
		String sql = "SELECT * FROM orders WHERE uid = '" + id + "' AND ono = '" + ono + "';";
		System.out.println("   >> SQL : " + sql + "\n");
		rs = selectQuery(sql);
		
		return DB.rowsCount(rs);
	}
	
	// ono�� �ֹ����� Ȯ��
	public static ResultSet selectOnoOrders(String ono) {
		String sql = "SELECT * FROM orders WHERE ono = '" + ono + "';";
		System.out.println("   >> SQL : " + sql + "\n");
		
		return selectQuery(sql);
	}
	
	// ���� �ۼ� �� ������Ʈ
	public static int updateReview(String ono, int score, String review) {
		int count;
		
		String SQL = "UPDATE orders SET score=" + score + ", reviewContent='" + review + "' WHERE ono='" + ono + "';";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			Statement st = con.createStatement();
			
			count = st.executeUpdate(SQL);
		} catch(SQLException ex) {
			System.err.println("** SQL exec error updateReview() : " + ex.getMessage() );
			return 0;
		}
		return count;
		}
	
	// �ֹ� ���
	public static int insertCancel(String ono) {
		int count;
		
		String SQL = "INSERT INTO cancel(ono, pno, bno, uid, otime, oamount, price, omethod, opayment, ostatus, oaddress, sno, memo, score, reviewContent) "
				+ "SELECT * FROM orders WHERE ono = ?;";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			PreparedStatement pst = con.prepareStatement(SQL);
			
			// 2) ? �Ű������� �� ����
			pst.setString(1, ono);

			
			count = pst.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in insertCancel() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	// �ֹ� ��� ���� �Է�
	public static int updateWhyCancel(String ono, String whyCancel) {
		int count;
		
		String SQL = "UPDATE cancel SET whycancel=? WHERE ono = ?;";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			PreparedStatement pst = con.prepareStatement(SQL);
			
			// 2) ? �Ű������� �� ����
			pst.setString(1, whyCancel);
			pst.setString(2, ono);

			
			count = pst.executeUpdate();
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in updateWhyCancel() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	// �ֹ� ��� �� �ֹ����̺��� ����
	public static int deleteOrders(String ono) {
		int count;
		
		String SQL = "DELETE FROM orders WHERE ono='" + ono + "';";
		
		try {
			// 1) PreparedStatement ��ü ����, SQL �߰�
			Statement st = con.createStatement();
			
			count = st.executeUpdate(SQL);
		} catch(SQLException ex) {
			System.err.println("** SQL exec error in deleteOrders() : " + ex.getMessage() );
			return 0;
		}
		return count;
	}
	
	// uid�� �߰��� ��Ͽ�û���� Ȯ��
	public static ResultSet selectRequestUid(String uid) {
		String sql = "SELECT * FROM request WHERE uid = '" + uid + "';";
		System.out.println("   >> SQL : " + sql + "\n");
		
		return selectQuery(sql);
	}
	
	// pno�� ���� ��ȸ
	public static ResultSet selectReviewPno(String pno) {
		String sql = "SELECT uid, score, reviewContent FROM orders WHERE pno = '" + pno + "' AND orders.score;";
		System.out.println("   >> SQL : " + sql + "\n");
		
		return selectQuery(sql);
	}
	
	// �߰��� ��Ͽ�û ���̺� ��ü ��ȸ
	public static ResultSet selectAllRequest() {
		String sql = "SELECT * FROM request;";
		System.out.println("   >> SQL : " + sql + "\n");
		
		return selectQuery(sql);
	}
	
	// �ֹ� ���̺� ��ü ��ȸ
	public static ResultSet selectAllOrders() {
		String sql = "SELECT * FROM orders, product WHERE orders.pno = product.pno;";
		System.out.println("   >> SQL : " + sql + "\n");
		
		return selectQuery(sql);
	}
	
	// ���� ��ü ��ȸ
	public static ResultSet selectAllOrdersForReviewNotNull() {
		String sql = "SELECT * FROM orders, product WHERE orders.pno = product.pno AND orders.score;";
		System.out.println("   >> SQL : " + sql + "\n");
		
		return selectQuery(sql);
	}
	
	// ����� ���̺� ��ü ��ȸ
	public static ResultSet selectAllUser() {
		String sql = "SELECT * FROM user;";
		System.out.println("   >> SQL : " + sql + "\n");
		
		return selectQuery(sql);
	}
	
	// ����� ID�� orders ���̺� ���� �ִ°͸� ��ȸ
	public static ResultSet selectUidOrdersReview(String id) {
		String sql = "SELECT * FROM orders, product WHERE orders.pno = product.pno AND score != 0 AND uid = '" + id + "';";
		System.out.println("   >> SQL : " + sql + "\n");
		
		return selectQuery(sql);
	}
}
