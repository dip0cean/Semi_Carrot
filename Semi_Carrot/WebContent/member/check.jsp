<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 비밀번호 검사 -->
    <!-- 목적지 정보 파라미터 이름 go -->
    
    <%String go = request.getParameter("go");
    %>
    
      
<jsp:include page="/template/header.jsp"></jsp:include>
    
    <div align ="center"style="padding-top:200px;">
    <h2> 비밀번호 를 입력 해 주세요</h2>

    <form action="checks.do"method="get">
    
    <input type="hidden"name="go"value=<%=go %>>
    <input type="password"name="member_pw"required>
    <input type="submit"value="확인">
   
    </form>
    <%if(request.getParameter("error")!=null) { %>
    <!-- 비번이 틀릴경우 메시지 송출 -->
    <h6><font color = "red">저런~!비밀번호가 옳지않아요</font></h6>
    <%} %>
    
    </div>
    
    
    
<jsp:include page="/template/footer.jsp"></jsp:include>