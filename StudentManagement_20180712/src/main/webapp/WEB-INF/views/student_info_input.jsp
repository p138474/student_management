<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>정보 등록</title>
<style>
	.error {
		color:red;
		font-style: italic;
		font-weight: bold;
	}
</style>
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
				<h2 class="f_noto"><span>학사관리시스템</span>학생정보등록</h2>
				<div class="cur_loc_align nav">
					<ul class="overH">
						<li class="fl"><img alt="Home" src="resources/images/icon_Hitory_home.png"></li>
						<li class="fl nav_gt">&gt;</li>
						<li class="fl">학사관리시스템</li>
						<li class="fl nav_gt">&gt;</li>
						<li class="fl">학생정보관리</li>
						<li class="fl nav_gt">&gt;</li>
						<li class="fl"><strong>학생정보등록</strong></li>
					</ul>
				</div>
			</header>
			
			<!-- 본문영역 -->
			<div id = "sub_content">
			
			<div class = "list bbs_board">

				<div class = "item">
					<springform:form action="student_info_input_process" modelAttribute= "infoData" method="post" enctype= "multipart/form-data">
					<table border = "1" width = "50%" >
						<thead>
							<tr>
								<th colspan= "2">학사정보 등록</th>
							</tr>
						</thead>
						<tr>
							<td>주민번호</td>
							<td>
								<springform:input path="jumin_no" placeholder="주민번호입력" class= "w_270 fr"  />
								<br />
								<springform:errors cssClass= "error" path= "jumin_no" />
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>
								<springform:input path="name" placeholder="이름 입력" class= "w_270 fr" />
								<br />
								<springform:errors cssClass= "error" path ="name" />
							</td>
						</tr>
						<tr>
							<td>사진</td>
							<td><input type= "file" name = "picture" id = "picture" class= "w_270 fr" /></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>
								<springform:input path= "tel" placeholder="전화번호 입력" class= "w_270 fr" />
								<br />
								<springform:errors cssClass= "error" path= "tel" />
							</td>
						</tr>
						<tr>
							<td colspan ="2"  align="right"><input type = "submit" value ="등록" id = "wCancle" class = "btn_write fr"/></td>
						</tr>
					</table>
					</springform:form>
				</div>

			</div>
		
			</div>
			<!-- END 본문영역 -->	
		
		</div>
		<!-- END content_area -->
		
	</div>
	<!-- END wrap -->
	
</div>
<!-- END container -->


</body>
</html>

<script>
	function on_change(selected_value) {
		// alert(selected_value);
		window.location.href = 'student_info_all_dis?recordsPerPage=' +selected_value ;
	}
</script>
