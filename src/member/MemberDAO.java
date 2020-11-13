package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String dbUser = "jsp", dbPwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int delete(String id) {
		int result = 0;
		String sql = "delete from member where id = '"+id+"'";
		try {
			con = DriverManager.getConnection(url, dbUser, dbPwd);
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public int update(MemberDTO userInfo) {
		int result = 0;
		String sql = "update member set pwd=?, name=?, addr=?, tel=? where id='"+userInfo.getId()+"'";
		try {
			con = DriverManager.getConnection(url, dbUser, dbPwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, userInfo.getPwd());	ps.setString(2, userInfo.getName()); 
			ps.setString(3, userInfo.getAddr());ps.setString(4, userInfo.getTel());	
			result = ps.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("result:"+result);
		return result;
	}
	public int register(MemberDTO regInfo) {
		String sql = "insert into member(id, pwd, name, addr, tel) values(?,?,?,?,?)";
		int result = 0;
		try {
			con = DriverManager.getConnection(url, dbUser, dbPwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, regInfo.getId());	ps.setString(2, regInfo.getPwd());
			ps.setString(3, regInfo.getName()); ps.setString(4, regInfo.getAddr());
			ps.setString(5, regInfo.getTel());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public MemberDTO userInfo(String id) {
		String sql = "select * from member where id = '"+id+"'";
		MemberDTO user = new MemberDTO();
		try {
			con = DriverManager.getConnection(url, dbUser, dbPwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				user.setId(rs.getString("id"));
				user.setPwd(rs.getString("pwd"));
				user.setName(rs.getString("name"));
				user.setAddr(rs.getString("addr"));
				user.setTel(rs.getString("tel"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return user;
	}
	public int loginChk(String id, String pwd) {
		String sql = "select pwd from member where id = '"+id+"'";
		int result = 2;
		try {
			con = DriverManager.getConnection(url, dbUser, dbPwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {				
				String dbPwd = rs.getString("pwd");
				if(rs == null) { result = 1; }//아이디 없음
				else {
					if(dbPwd.equals(pwd)) result = 0;//로그인 성공
					else result = -1;//비밀번호 다름
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<MemberDTO> memberList(){
		String sql = "select * from member";
		ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
		try {
			con = DriverManager.getConnection(url, dbUser, dbPwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				arr.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}
}
