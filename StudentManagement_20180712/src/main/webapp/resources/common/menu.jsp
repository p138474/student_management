<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.5, minimum-scale=1.0, user-scalable=yes">
<link rel="stylesheet" type="text/css" href="resources/css/service/sub.css">
</head>

<body id="sub">

	<div id="wrap">

		<!-- web header -->
		<div id="header" class="for_pc">

			<div class="header_topmenu">
				<div class="wrap">
					<div class="topmenu_logo fl">
						<img src="resources/images/left_logo2.png" alt="이젠컴퓨터">
					</div>
					
					<div class="fr">
						<div class="topmenu_search">
							<form action="#LINK" name="TopSearchForm" id="TopSearchForm"
								method="post">
								<fieldset>
									<legend>전체검색</legend>
									<input type="text" class="inputtext" name="search" id="search"
										autocomplete="off" placeholder="통합검색시 키워드를 입력하세요." title="검색창">
									<button class="btnsearch" type="submit" title="검색">검색</button>
								</fieldset>
							</form>
						</div>
						
						<div class="topmenu_util">
							<ul>
								<li><a href="#">로그인</a></li>
								<li><a href="#">회원가입</a></li>
								<li><a href="#">이젠컴퓨터 바로가기</a></li>
							</ul>
						</div>
						<!-- END topmenu_util -->
						
					</div>
					<!-- END fr -->
					
				</div>
				<!-- END wrap -->
				
			</div>
			<!-- END header_topmenu -->

			<div class="header_mainmenu">
				<div class="wrap">

					<!-- 로고 -->
					<h1 class="logo">
						<a href="index.html"><img src="resources/images/logo.png" alt="이젠컴퓨터" /></a>
					</h1>

					<nav class="gnb" id="gnb">

						<div class="top2mbg">
							<p class="top2mbg_center"></p>
							<div class="top2mbg_wrap"></div>
						</div>
						<ul class="top1menu f_noto clearfix">
							<li>
								<a href="#">HOME</a>
								<div class="top2m"></div>
							</li>

							<li>
								<a href="#">학사관리시스템</a>
								<div class="top2m"></div>
							</li>

							<li>
								<a href="#">JAVA</a>
								<div class="top2m"></div>
							</li>

							<li>
								<a href="#">JS</a>
								<div class="top2m">
									<span class="img"></span>
								</div>
							</li>

							<li>
								<a href="#">커뮤니티</a>
								<div class="top2m">
									<span class="img"></span>
								</div>
							</li>

							<li>
								<a href="#">찾아오시는 길</a>
								<div class="top2m"></div>
							</li>
						</ul>
					</nav>

				</div>
				<!-- END wrap -->
				
			</div>
			<!-- END header_mainmenu -->
			
		</div>
		<!-- END web header -->
	</div>
	<!-- END wrap -->
	
</body>
</html>