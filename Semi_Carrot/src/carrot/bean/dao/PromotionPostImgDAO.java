package carrot.bean.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import carrot.bean.dto.PromotionPostImgDTO;
import carrot.bean.dto.UsedPostImgDTO;

public class PromotionPostImgDAO {
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

	public Connection getConnection() throws SQLException {
		return src.getConnection();
	}

	// 시퀀스 생성 메소드
	public int getSequence() throws SQLException {
		Connection con = getConnection();

		String sql = "SELECT post_img_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int req = rs.getInt(1);

		con.close();
		return req;
	}

	// 저장 메소드 (중고거래 게시글)
	public void save(PromotionPostImgDTO updto) throws Exception {
		Connection con = getConnection();

		String sql = "INSERT INTO promotion_post_img VALUES(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, updto.getPost_img_no());
		ps.setLong(2, updto.getPost_no());
		ps.setString(3, updto.getPost_img_name());
		ps.setString(4, updto.getPost_img_type());
		ps.setLong(5, updto.getPost_img_size());
		ps.execute();

		con.close();
	}

	// 이미지 단일조회 메소드
	public PromotionPostImgDTO get(long post_img_no) throws SQLException {
		Connection con = getConnection();
		String sql = "SELECT * FROM promotion_post_img WHERE post_img_no=? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, post_img_no);
		ResultSet rs = ps.executeQuery();

		PromotionPostImgDTO ppidto;
		if (rs.next()) {
			ppidto = new PromotionPostImgDTO(rs);
		} else {
			ppidto = null;
		}
		con.close();
		return ppidto;
	}
	
	//게시글 첨부파일 조회
	public List<PromotionPostImgDTO>getList(long post_no)throws Exception{
		Connection con = getConnection();
		String sql = "SELECT * FROM promotion_post_img WHERE post_no = ? ORDER BY post_img_no ASC";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, post_no);
		ResultSet rs = ps.executeQuery();
		List<PromotionPostImgDTO> list = new ArrayList<>();
		while (rs.next()) {
			PromotionPostImgDTO ppidto = new PromotionPostImgDTO(rs);
			list.add(ppidto);
		}
		con.close();
		return list;
	}


	// 회원 게시글 이미지 조회
	public PromotionPostImgDTO getMember(long post_no) throws SQLException {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM PROMOTION_POST_IMG WHERE POST_NO = ? ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setLong(1, post_no);
		
		ResultSet rs = ps.executeQuery();

		PromotionPostImgDTO pidto;
		
		if (rs.next()) {
			pidto = new PromotionPostImgDTO(rs);
		} else {
			pidto = null;
		}
		con.close();
		return pidto;
	}
	//이미지 DB 삭제
	public void deletePromotionPostImg(long post_no) throws Exception {
		Connection con = getConnection();

		String sql = "DELETE promotion_post_IMG WHERE post_NO = ?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setLong(1, post_no);

		ps.execute();

		con.close();
	}
}
