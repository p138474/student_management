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
<link rel="stylesheet" type="text/css" href="resources/css/service/sub.css">
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
				<h2 class="f_noto"><span>학생정보관리</span>성적전체조회</h2>
				<div class="cur_loc_align nav">
					<ul class="overH">
						<li class="fl"><img alt="Home" src="resources/images/icon_Hitory_home.png"></li>
						<li class="fl nav_gt">&gt;</li>
						<li class="fl">학사관리시스템</li>
						<li class="fl nav_gt">&gt;</li>
						<li class="fl">성적관리</li>
						<li class="fl nav_gt">&gt;</li>
						<li class="fl"><strong>성적전체조회</strong></li>
					</ul>
				</div>
			</header>
			
			<!-- 본문영역 -->
			<div id = "sub_content">
			
			<!-- 공지사항 목록 -->
			<div class = "list bbs_board">

			<div class = "item">
				<p class= "fr">총 인원 <span class = "cnt">${totalCounts}</span> 명, 페이지 <span>${current_page}</span> / <span>${total_page}</span> </p>
				<table border = "1" width = "100%">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>학사번호</th>
							<th>국어</th>
							<th>수학</th>
							<th>사회</th>
						</tr>
					</thead>
		
					<c:forEach items="${al_sub_scoreData }" var="scoreData">
					<tr>
						<td>${scoreData.getSeq()}</td>
						<td>${scoreData.getName()}</td>
						<td>${scoreData.getStudent_no()}</td>
						<td>${scoreData.getGuk()}</td>
						<td>${scoreData.getMath()}</td>
						<td>${scoreData.getSahee()}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			
			<div class = "paging overH cb">
				<div class = "btn_left fl">
					<a href="student_score_all_dis?paging_gubun=first">
						<img src = "resources/images/default/btn_bbsPaging_end_pre.png" alt = "처음 페이지" title= "처음 페이지"/>
					</a>
					<a href="student_score_all_dis?paging_gubun=previous">
						<img src = "resources/images/default/btn_bbsPaging_pre.png" alt = "이전페이지" title= "이전페이지"/>
					</a>
				</div>
				<div class = "btn_number fl">
					<ul class = "overH">
						<li class = "fl">${current_page}/${total_page} </li>
					</ul>
				</div>
				<div class = "btn_right fl">
					<a href="student_score_all_dis?paging_gubun=next">
						<img src = "resources/images/default/btn_bbsPaging_next.png" alt = "다음페이지" title= "다음페이지" />
					</a>
					<a href="student_score_all_dis?paging_gubun=last">
						<img src = "resources/images/default/btn_bbsPaging_end_next.png" alt = "마지막 페이지" title= "마지막 페이지" />
					</a>
					<select name="recordsPerPage" onchange="on_change(this.value);">
							<option value="5" <c:if test="${pagingInfo.nRecordsPerPage eq 5}">selected</c:if>>5</option>
							<option value="6" <c:if test="${pagingInfo.nRecordsPerPage eq 6}">selected</c:if>>6</option>
							<option value="7" <c:if test="${pagingInfo.nRecordsPerPage eq 7}">selected</c:if>>7</option>
							<option value="8" <c:if test="${pagingInfo.nRecordsPerPage eq 8}">selected</c:if>>8</option>
					</select>
				</div>
			</div>
		
		</div>
		<!-- END 본문영역 -->
			
		</div>
		<!-- //content_area -->
		
		</div>
		
	</div>
	<!-- END wrap -->
	
</div>
<!-- END container -->


</body>
</html>

<script>
	function on_change(selected_value) {
		// alert(selected_value);
		window.location.href = 'student_score_all_dis?recordsPerPage=' +selected_value ;
	}
</script>
