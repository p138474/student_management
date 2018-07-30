<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>학사관리시스템_HOME</title>
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
							<li class="dept02"><a href= "student_info_input">정보등록</a></li>
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
				<h2 class="f_noto"><span>이젠컴퓨터</span>공지사항</h2>
				<div class="cur_loc_align nav">
					<ul class="overH">
						<li class="fl"><img alt="Home" src="resources/images/icon_Hitory_home.png"></li>
						<li class="fl nav_gt">&gt;</li>
						<li class="fl">커뮤니티</li>
						<li class="fl nav_gt">&gt;</li>
						<li class="fl"><strong>공지사항</strong></li>
					</ul>
				</div>
			</header>
		</div>
		<!-- //content_area -->
		
	</div>
	<!-- END wrap -->
	
</div>
<!-- END container -->


</body>
</html>
