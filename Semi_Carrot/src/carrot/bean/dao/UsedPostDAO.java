package carrot.bean.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import carrot.bean.dto.UsedPostDTO;

public class UsedPostDAO {
	
	private static DataSource src;
	static {
		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception{
		return src.getConnection();
	}
	
	//단일조회
	public UsedPostDTO get(long post_no)throws Exception{
		Connection con=getConnection();
		
		String sql="Select*from used_post where post_no=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setLong(1, post_no);
		ResultSet rs=ps.executeQuery();
		
		UsedPostDTO updto = rs.next() ? new UsedPostDTO(rs) : null;
		
		con.close();
		
		return updto;
	}
}