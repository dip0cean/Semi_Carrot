<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
%>

<!-- Java Script -->
<script type="text/javascript" src="<%=path%>/js/nav.js"></script>

<!-- css -->
<link href="<%=path%>/css/2.nav.css" type="text/css" rel="stylesheet">
<nav>
	<div id="nav-area">
		<div id="menu-area">
			<img src="<%=path%>/img/menu.png" id="nav-icon" onclick="navSwitch();">
		</div>
		<div class="nav-menu">
			<ul>
				<li class="medium-menu"><a href="<%=path%>/board/used_all_post_list.jsp" class="category">동네 중고</a>
				<ul>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=1">디지털	/ 가전</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=2">가구/ 인테리어</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=3">유아동/ 유아도서</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=4">생활/ 가공식품</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=5">스포츠/ 레저</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=6">여성잡화</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=7">여성의류</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=8">남성패션/ 잡화</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=9">게임/ 취미</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=10">뷰티/ 미용</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=11">반려동물</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=12">도서/ 티켓 / 음반</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=13">기타</a></li>
					<li><a href="<%=path%>/board/used_post_list.jsp?board_no=1&used_cate_num=14">삽니다</a></li>
				</ul>
			</li>
			
			<li class="medium-menu"><a href="<%=path%>/board/promotion_all_post_list.jsp" class="category">동네 홍보</a>
				<ul>
					<li><a href="<%=path%>/board/promotion_post_list.jsp?board_no=2&promotion_cate_num=1">중고차 / 오토바이</a></li>
					<li><a href="<%=path%>/board/promotion_post_list.jsp?board_no=2&promotion_cate_num=2">동네 구인구직</a></li>
					<li><a href="<%=path%>/board/promotion_post_list.jsp?board_no=2&promotion_cate_num=3">부동산</a></li>
					<li><a href="<%=path%>/board/promotion_post_list.jsp?board_no=2&promotion_cate_num=4">농수산물</a></li>
					<li><a href="<%=path%>/board/promotion_post_list.jsp?board_no=2&promotion_cate_num=5">지역업체</a></li>
					<li><a href="<%=path%>/board/promotion_post_list.jsp?board_no=2&promotion_cate_num=6">과외 / 클래스 모집</a></li>
					<li><a href="<%=path%>/board/promotion_post_list.jsp?board_no=2&promotion_cate_num=7"> 전시 / 공연</a></li>
					<li><a href=""></a></li>
				</ul></li>
			<li class="medium-menu">
			<a href="<%=path%>/board/used_write.jsp" class="category">판매하기</a></li>
			<li class="medium-menu">
			<a href="<%=path%>/board/promotion_write.jsp" class="category"> 홍보하기</a></li>
			</ul>
		</div>
	</div>
</nav>