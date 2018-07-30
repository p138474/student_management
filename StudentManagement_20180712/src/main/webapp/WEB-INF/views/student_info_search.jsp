<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>전체조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.5, minimum-scale=1.0, user-scalable=yes">
<link rel="stylesheet" type="text/css" href="/resources/css/service/sub.css">
<script src= "https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body id ="sub">
<jsp:include page="/resources/common/menu.jsp"></jsp:include>
<div id="container">
	<div class="wrap overH">
	
		<!-- aside_layout -->
		<aside id="side" class="for_pc">
			<div class="sidemenu" id = "sidemenu">
				<div class="sidemenu_title f_noto">학사관리시스템</div>
				<ul class="sidemenu_list">
					<li class="dept01">
						<a>성적관리</a>
						<ul>
							<li class="dept02"><a href= "student_score_input">성적등록</a></li>
	                        <li class="dept02"><a href= "student_score_all_dis">성적전체조회</a></li>
						</ul>
					</li>
					<li class="dept01">
						<a>학생정보관리</a>
						<ul>
							<li class="dept02"><a href= "student_info_input">학생정보등록</a></li>
							<li class="dept02"><a href= "student_info_all_dis">전체조회</a></li>
							<li class="dept02"><a href= "student_info_search">이름으로검색</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</aside>
		<!-- //aside_layout -->
		
		<!-- content_area -->
		<div id="content_area" class="overH">
			<header class="sub_title">
				<h2 class="f_noto"><span>학사관리시스템</span>이름으로 검색</h2>
				<div class="cur_loc_align nav">
					<ul class="overH">
						<li class="fl"><img alt="Home" src="/resources/images/icon_Hitory_home.png"></li>
						<li class="fl nav_gt">&gt;</li>
						<li class="fl">학사관리시스템</li>
						<li class="fl nav_gt">&gt;</li>
						<li class="fl">학생정보관리</li>
						<li class="fl nav_gt">&gt;</li>
						<li class="fl"><strong>이름으로 검색</strong></li>
					</ul>
				</div>
			</header>
		
			
			<!-- 본문영역 -->
			<div id = "sub_content">
			
			<!-- 공지사항 목록 -->
			<div class = "list bbs_board">
				<div class = "bbs_search">
				<form name = "fSearch" method = "post" action = "student_info_search">
					<select name = "">
						<option>게시제목</option>
						<option selected>작성자</option>
					</select>
					<input type = "text" name = "name" id = "name" title = "검색내용입력" />
					<input type = "submit" name = "search" id = "search1" value = "검색" title = "검색" class = "btn_search" />
				</form>	
				</div>			
				
				<div class = "item"  id= "show1">
					<table border = "1" width = "100%" >
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>사진</th>
								<th>주민번호</th>
								<th>학사번호</th>
								<th>전화번호</th>
								<th>날짜 / 시간</th>
							</tr>
						</thead>
			
						<c:forEach items="${al_info_data }" var="infoData">
						<tr>
							<td>${infoData.getSeq()}</td>
							<td>${infoData.getName()}</td>
							<td><img src = "show_image/${infoData.getJumin_no()}"  class = "picture" /></td>
							<td>${infoData.getJumin_no()}</td>
							<td>${infoData.getStudent_no()}</td>
							<td>${infoData.getTel()}</td>
							<td><fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value="${infoData.getCreated_date()}" /></td>
						</tr>
						</c:forEach>
						
					</table>
				</div>
				<!-- END div id= "show1" -->
				
			</div>
			<!-- END div list bbs_board -->
			
			</div>
			<!-- END 본문영역 -->
		
		</div>
	</div>
	<!-- END wrap -->
	
</div>
<!-- END container -->


</body>
</html>

