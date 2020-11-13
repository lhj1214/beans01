package members;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp", pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<MemberDTO> memberList(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			String sql = "select * from member";
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				//out.print()는 사용 불가
				MemberDTO d = new MemberDTO();
				d.setId(rs.getString("id"));
				d.setPwd(rs.getString("Pwd"));
				d.setName(rs.getString("name"));
				d.setAddr(rs.getString("addr"));
				d.setTel(rs.getString("tel"));
				list.add(d);//한명에 대한 정보 저장
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
