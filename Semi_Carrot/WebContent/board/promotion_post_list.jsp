<%@page import="carrot.bean.dao.PromotionPostDAO"%>
<%@page import="carrot.bean.dto.DetailList2DTO"%>
<%@page import="carrot.bean.dto.BoardDTO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="carrot.bean.dao.MemberDAO"%>
<%@page import="carrot.bean.dto.MemberDTO"%>
<%@page import="carrot.bean.dto.AddrDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.h2_style {
	
}

.detail {
	
}

.product {
	border: 1px solid lightgray;
	float: left;
	width: 220px; 
	margin: 5px;
	margin-right: 13px;
	margin-bottom: 10px;
}

.product_photo>img {
	width: 210px;
	height: 220px;
}

.product_title {
	margin: 5px;
	font-size: 20px;
	margin-left: 15px;
	}

.product_price {
	margin: 5px;
	font-size: 20px;
	margin-left: 15px;
	color: orange;
}
.product_time {
	float:right;
	color:gray;
	font-size:16px;
	font-weight:normal;
}

.post_location {
	font-size: 15px;
	color: #adadad;
	text-align: left;
	margin-left: 15px;
	font-weight: light;
}

.post_post {
	margin-right: 5px;
}
.product_like{
	margin-right:10px;
	text-align:right;
	color:gray;
}

.hideText {
	width:200px;
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
}

.last {
	font-size: 18px;
}
.popular {
	float:right;
	margin-left:10px;
	font-size: 18px;

}
.sort_list {
	margin-right:20px;
}

.hr_style {
	border: 0;
	height: 1px;
	background: lightgray;
}

.move {
	text-decoration: none;
}
</style>

<%
	PromotionPostDAO ppdao = new PromotionPostDAO();
	MemberDAO mdao = new MemberDAO();
	List<DetailList2DTO> list = ppdao.getList();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<article style="padding-top: 200px;">
	<div align="left">
		<h2 style="font-size: 30px; margin: 15px;">
			<span style="color:orange">동네홍보</span> 상품목록
		</h2>
		<div class="sort_list" align="right">
			<div class="popular"><a href="">인기순</a></div>

			<div class="last"><a href="">최신순</a></div>
		</div>
		<br>
	</div>
	<div align="left">
		<div class="box">

			<div class=detail>

				<%
					for (DetailList2DTO dldto : list) {
				%>
				<div class="product">
					<div class="product_photo">
						<img src="../img/math.png">
					</div>
					<div class="product_title">
						<div class="hideText">
						<a class="move" href="promotion_post_content.jsp?post_no=<%=dldto.getPost_no()%>">					
							<font color="black"><%=dldto.getPost_title()%>
							</a>
						</div>
					</div>
					<div class="post_location">
						<img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAiCAYAAABIiGl0AAAAAXNSR0IArs4c6QAAA6xJREFUWAm1l01IVFEUx51xNAtxIcEENuQIrqTxO8OEmj5IAncVUS2E2kS0axO4C5KiFi0lXIh9QBC1kKgwclNGjaNOSUEapVRiUSHoTOo4/c743vjem/vGp8xcuHPu+Z//Of9778y9740rz0EbGxsrjsViQait9JpEIuF1uVzbGCfo0/jT2GGwx6WlpQN+vz+Gn7G5MkXD4fAOil6C047dlImrxxCfg9tVUFBwtbq6ekbHrVYpzAoLo9FoJ+QL9AJrkkN/3u12d9bW1l5hMsvWnDTh4eHh8uXl5fvMutFK3qD/jLxTDQ0Nv4z5JuHR0VH/4uLiKwjy/WWtseJPLKTZKO7Wq4dCoa1LS0tP8bMqKvURrcT0TU1NbRZfWkqYWXVrhJVI9j+bZmZmbuplk1s9NDR0GNEnOpgrKz8ydBrZ8rBHRHCur0MsCvc1Pazl1GF301PbqOFpBh3Z4Rv0oIvVBgBG01hqYKCwsPBMIBD4bAxHIpGKhYWFbrB9RtxuzDEr9yB6zI5gwV/U19cfYLvktjI1mQh19rOI5wSCpqDC4bgelaXvUcRMEGJzAO0qUZ2oxdrx53XMzsI9KMJldgQDPsgPYtLgK4fCoeigMmgA2R2fCG83YMohxCFlQAHCDSlgE8Tkytx8yDZmbHCKMxIMQSdcJueWFU8Y8pRDiA3KgAJ0yJ1wJMwqGrlSWxQ6Jkg4wjWBamfCzQzfqmOrqGwNXo/c56uoeaTFejSuOWjxmNx7KXiHwYIlpnIr4I1xVo9TPF8nyFgwiYFV6LidhZfgJaFXv6vvUeCEHVmBy7UZ0fAAds3rUq+BcD8X0SFZcR5XWJcecGhFqEnrjkW12rfEJoV5PRlgJg+1QM4MGqG6uroHKWEZsNXnCfzNmWpe3iL1z9LjJmGuux+AF3MlTO1rrDb1FExutS5GQB5tj3Q/WxbRSElJyWVjPZOwBLxe70mI8sKXrTaZn59/pLKy8p+xYJqwz+eLFhUVtUH6aCRuZMwC/tBba2pqvlnz04SFUFVV9Zsj1krSd2vCOvwYNdo4sx9UOUphIfJ9f8XsRXxclbgGNiuiHNOXdjxbYUlgtuMINzN8Y1dAgU+BtTDxfkUsBWUUFhYFfmKCTKAvlWU/kDfPJo7mO3vKSiR5V69Fkrg8DPj32IHtwE2+FhvzmFivx+M5xz/ENV8sJM+xsC4yMjKyKx6P32YC8rdE2iz9HKu8m/QcfqxbWOry7N2CkRfznZzR0/yIvjBeV/sPFdozA8TD8zUAAAAASUVORK5CYII="
							width="15" height="17" alt="위치 아이콘"> <%=dldto.getAddr_state()%> <%=dldto.getAddr_city()%> <%=dldto.getAddr_base()%>
					</div>
					<div class="product_info">
						<div class="product_price">
						<%long price = dldto.getPost_price(); 
              				 String commaNum = NumberFormat.getInstance().format(price);
               			%>
						<%=commaNum%>원
							<div class="product_time">
								<%=dldto.getPost_autotime()%>							
							</div>
						</div>
						<hr class="hr_style">
						<div class="product_like">
							<img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAjhJREFUWAnFl1uPKUEUhbdCxF2Iu7h78f9/ixdexANeSNxCkJnz1ZwSRncrM0OvhK6ufVmrdiu1O/DxD/INq9VKFouFbDYbOR6PEggEJBKJSDqdlkKhIKFQ6FvE1+3pdJL5fC7EHw4HIXU4HJZEIiHZbFZSqdRdXOBaAEHj8VjW6/Wdo5kIBoNSLBalVCppYcxDNJvNNPn5fDaud9dkMimNRkMvxhgvAna7nQyHQ2EVNmBV3W5Xu45GI10tmziq1+v1JBaLaXctANLBYKDLbZPE+MTjcT3cbrdmyurKY+n3+/pRKiImk8nT5MRB/Cw5cfyu4ARqv9/LcrnUN+/8ghNuxcBhI7xcC5xwK7aMX4BbsfX8AtzKa9++Whjcij8WvwC3Yk/6BbiV+TPxQwTcKpPJ+MGtOeFWHBB+PAY44VYctZxu7waccOuzIJ/Pv7UKrB5OoAUopfQ5/a4q0BPAeRHAgG4nl8vpyVd+wQGXwZeM/3f1el2i0aix/fmV3HBc40YAZel0Oq4933Xgs2M6IXKb0pv4GwFM0ny22+1Lv2ccf3Pl195qtW56QZPvTgAG9mez2fwTEZCTy6kjhstRAAba6FqtxvBXIAe53OAqgADeASqVilvsw3liyeEFTwEElstl/fFK4mSzjXsogOSshBcRW+BrWzkrARBXq1UrEZDjawtrAUYEpXXDs+TkeUoAAZTWScRPyMnn/JqLxQPm+U6nU+2FIDPnEeZourycOlofTF4LeODqav4EUxqvNxGf2nsAAAAASUVORK5CYII="
								width="16" height="16" alt="상품 상태 아이콘">
							<%=dldto.getPost_like()%>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>

</article>


<jsp:include page="/template/footer.jsp"></jsp:include>
