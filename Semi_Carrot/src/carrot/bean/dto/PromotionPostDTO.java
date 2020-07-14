package carrot.bean.dto;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PromotionPostDTO {
   private long post_no;
   private String post_title;
   private String post_content;
   private long post_price;
   private String post_date;
   private String post_phone;
   private long post_view;
   private long post_like;
   private long promotion_cate_num;
   private long member_no;
   private long member_img_no;
   private long addr_no;
   private long board_no;


	public long getPost_no() {
		return post_no;
	}

	public void setPost_no(long post_no) {
		this.post_no = post_no;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public long getPost_price() {
		return post_price;
	}

	public void setPost_price(long post_price) {
		this.post_price = post_price;
	}

	public String getPost_date() {
		return post_date;
	}

	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}

	public String getPost_phone() {
		return post_phone;
	}

	public void setPost_phone(String post_phone) {
		this.post_phone = post_phone;
	}

	public long getPost_view() {
		return post_view;
	}

	public void setPost_view(long post_view) {
		this.post_view = post_view;
	}

	public long getPost_like() {
		return post_like;
	}

	public void setPost_like(long post_like) {
		this.post_like = post_like;
	}

	public long getPromotion_cate_num() {
		return promotion_cate_num;
	}

	public void setPromotion_cate_num(long promotion_cate_num) {
		this.promotion_cate_num = promotion_cate_num;
	}

	public long getMember_no() {
		return member_no;
	}

	public void setMember_no(long member_no) {
		this.member_no = member_no;
	}

	public long getMember_img_no() {
		return member_img_no;
	}

	public void setMember_img_no(long member_img_no) {
		this.member_img_no = member_img_no;
	}

	public long getAddr_no() {
		return addr_no;
	}

	public void setAddr_no(long addr_no) {
		this.addr_no = addr_no;
	}

	public long getBoard_no() {
		return board_no;
	}

	public void setBoard_no(long board_no) {
		this.board_no = board_no;
	}

	public PromotionPostDTO() {
		super();
	}

	public PromotionPostDTO(ResultSet rs) throws Exception {
		this.setPost_no(rs.getLong("post_no"));
		this.setPost_title(rs.getString("post_title"));
		this.setPost_content(rs.getString("post_content"));
		this.setPost_price(rs.getLong("post_price"));
		this.setPost_date(rs.getString("post_date"));
		this.setPost_phone(rs.getString("post_phone"));
		this.setPost_view(rs.getLong("post_view"));
		this.setPost_like(rs.getLong("post_like"));
		this.setPromotion_cate_num(rs.getLong("promotion_cate_num"));
		this.setMember_no(rs.getLong("member_no"));
		this.setMember_img_no(rs.getLong("member_img_no"));
		this.setAddr_no(rs.getLong("addr_no"));
		this.setBoard_no(rs.getLong("board_no"));
	}

	// 작성시간 관련 메소드 추가
	public String getPromotionPost_time() {
		return post_date.substring(11, 16);
	}

	public String getPromotionPost_day() {
		return post_date.substring(0, 10);
	}
	
	public String getPromotionPost_autotime() {
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		if (getPromotionPost_day().contentEquals(today)) {
			return getPromotionPost_time();
		} else {
			return getPromotionPost_day();
		}
	}

}

