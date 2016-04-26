package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class CustomerDAO {
	private static CustomerDAO cdao = new CustomerDAO();
	private DataSource dataSource;
	private CustomerDAO() {
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static CustomerDAO getInstance(){
		return cdao;
	}
	public Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close(); 
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		closeAll(pstmt,con);
	}
	
	//login
	public CustomerVO login(String id, String password) throws SQLException{
		CustomerVO cvo = null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = getConnection();
			String sql = "select name, email, tel from customer where id=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cvo = new CustomerVO(id, rs.getString(1), password, rs.getString(2), rs.getString(3));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return cvo;
	}
}
