package carrot.bean.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import carrot.bean.dto.PromotionPostDTO;
import carrot.bean.dto.UsedPostDTO;

public class PromotionPostDAO {

	private static DataSource src;

	static {
		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {
		return src.getConnection();
	}
	
	// 단일조회
	public PromotionPostDTO get(long post_no) throws Exception {
		Connection con = getConnection();

		String sql = "Select*from promotion_post where post_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, post_no);
		ResultSet rs = ps.executeQuery();

		PromotionPostDTO ppdto = rs.next() ? new PromotionPostDTO(rs) : null;

		con.close();

		return ppdto;
	}
	
	// 조회수 증가
		public void plusViewCount(long post_no, long member_no) throws Exception {
			Connection con = getConnection();

			String sql = "update promotion_post set post_view = post_view+1 where post_no=? and member_no != ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, post_no);
			ps.setLong(2, member_no);
			ps.execute();

			con.close();
		}
}
