//DB ���� ��ü
//DB������ �ҷ����ų� ������ ������ 
package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			//String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC&useSSL=false";
			String dbURL = "jdbc:mysql://192.168.43.203:4406/bbs?serverTimezone=UTC&useSSL=false";
			String dbID="root";
			String dbPassword = "dltmdgns1!";
			//Class.forName("com.mysql.jdbc.Driver");//mysql ����̹��� ã�� db���� ���̺귯��
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			
		} catch(Exception e) {
			e.printStackTrace();//�������� ���
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USERS WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			
			rs = pstmt.executeQuery();
			
			
            
			if(rs.next()) {
				
				if(rs.getString(1).equals(userPassword)) 
					return 1; //�α��� ����
				else 
					return 0; //��й�ȣ �� ��ġ
			}
			return -1; //�Է��� ���̵�  DB�� ������������
		} catch(Exception e){
			e.printStackTrace();
		}
		return -2; //db ����
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USERS VALUES(?,?,?,?,?)";
		
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();

		}
		return -1;//DB����
	}
	public void userDel(String userID) {
		String sql = "delete from users where userID = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userID);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	////
	public User getUserInfo(String userID) {
		String SQL = "SELECT * FROM USERS WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserGender(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				return user;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int InfoUpdate(String userID, String userPassword, String userName, String userGender, String userEmail) {
		String SQL = "UPDATE USERS SET userPassword=?, userName=?, userGender=?, userEmail=? WHERE userID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1,userPassword);
			pstmt.setString(2,userName);
			pstmt.setString(3,userGender);
			pstmt.setString(4,userEmail);
			pstmt.setString(5, userID);
			System.out.println("�̸� : "+userName);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//DB����
	}

//////
	public ArrayList<User> getList(){//��� User������ �迭�� ����
		String SQL = "SELECT * FROM USERS ORDER BY userID ASC";
		ArrayList<User> list = new ArrayList<User>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserGender(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				list.add(user);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

}//UserDAO end
	
