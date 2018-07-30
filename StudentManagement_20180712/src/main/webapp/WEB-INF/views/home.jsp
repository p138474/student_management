<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="ko"> <!--<![endif]-->
<!--[if !IE]><html lang="ko"><![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.5, minimum-scale=1.0, user-scalable=yes">
  <title>이젠컴퓨터</title>
  <link rel="stylesheet" type="text/css" href="resources/css/service/sub.css">

  <!--[if lt IE 9]>
    <script type="js/service_common/html5shiv.js"></script>
    <script src="js/service_common/respond.proxy"></script>
  	<script src="js/service_common/IE9.js"></script>
    <script src="http://vjs.zencdn.net/c/video.js"></script>
    <script src="http://vjs.zencdn.net/ie8/1.1.0/videojs-ie8.min.js"></script>
    <link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
  <![endif]-->

</head>
<body id="sub">

<div id="wrap">
<div class="skipContent">
  <h2>바로가기 모음</h2>
  <a href="#container">본문 바로가기</a>
  <a href="#gnb">메인메뉴 바로가기</a>
</div>

<!-- web header -->
<div id="header" class="for_pc">

  <div class="header_topmenu">
  	<div class="wrap">
  		<div class="topmenu_logo fl">
  			<img src="images/left_logo2.png" alt="이젠컴퓨터">
  		</div>
  		<div class="fr">
  			<div class="topmenu_search">
  				<form action="#LINK" name="TopSearchForm" id="TopSearchForm" method="post">
  					<fieldset>
  						<legend>전체검색</legend>
  						<input type="text" class="inputtext" name="search" id="search" autocomplete="off" placeholder="통합검색시 키워드를 입력하세요." title="검색창">
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
  		</div>
  	</div>
  </div>

  <div class="header_mainmenu">
  	<div class="wrap">

  		<!-- 로고 -->
  		<h1 class="logo">
  			<a href="index.html"><img src="images/logo.png" alt="이젠컴퓨터"/></a>
  		</h1>

      <nav class="gnb" id="gnb">

        <div class="top2mbg">
          <p class="top2mbg_center"></p>
          <div class="top2mbg_wrap">
          </div>
        </div>
        <ul class="top1menu f_noto clearfix">
          <li>
            <a href="#">이젠컴퓨터</a>
              <div class="top2m">
              </div>
          </li>

          <li>
            <a href="#">JAVA</a>
              <div class="top2m">
              </div>
          </li>

          <li>
            <a href="#">JS</a>
              <div class="top2m">
              </div>
          </li>

          <li>
            <a href="#">DB</a>
              <div class="top2m">
                <span class="img"></span>
              </div>
          </li>

          <li>
            <a href="#">인공지능</a>
              <div class="top2m">
                <span class="img"></span>
              </div>
          </li>

          <li>
            <a href="#">커뮤니티</a>
              <div class="top2m">
              </div>
          </li>

        </ul>
      </nav>

  	</div>
  </div>

</div>
<!-- //web header end -->

<!-- body_layout -->
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
                    <li class="dept02"><a href= "#">성적등록</a></li>
                    <li class="dept02"><a>성적전체조회</a></li>
                  </ul>
                </li>
                  <li class="dept01">
                      <a>학생정보관리</a>
                      <ul>
                        <li class="dept02"><a>정보등록</a></li>
                        <li class="dept02"><a>전체조회</a></li>
                        <li class="dept02"><a>이름으로검색</a></li>
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
				<li class="fl"><img alt="Home" src="images/icon_Hitory_home.png"></li>
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

</div>
<!-- //body_layout -->

<!-- footer -->
<div class="section fp-auto-height">
<div id="footer">

  <h2 class="skip">사이트정보</h2>

  <div class="footer_banner">
    <ul class="wrap">
      
    </ul>
  </div>

  <div class="footer_info">
    <div class="wrap p_t_30px p_b_30px">
      <div class="foot_sns">
        <a href="#" target="_blank" class="foot_facebook" title="새 창">페이스북</a>
        <a href="#" target="_blank" class="foot_blog" title="새 창">블로그</a>
      </div>
      <div class="foot_familysite">
        <select class="familysite_select" title="관련 사이트 바로가기 선택">
          
        </select> <a href="#none" id="familysite_select_btn" class="familysite_select_btn">이동</a>
        <script type="text/javascript">
          $(document).ready(function(e) {
            $('#familysite_select_btn').click(function(e) {
              var tmpURL = $('select.familysite_select').val();
              if (!tmpURL) {
                alert("관련사이트를 선택해주세요!");
                $('select.familysite_select').focus();
              } else {
                window.open("http://" + tmpURL, '_blank');
              }
            });
          });

        </script>
      </div>
      <div class="foot_util">
        <a href="#" target="_blank" title="새 창"><span>개인정보처리방침</span></a> <span class="util_bar">|</span>
        <a href="#" target="_blank" title="새 창"><span>이용약관</span></a>
      </div>
      <div class="foot_address">
      </div>
    </div>
  </div>

  <div class="footer_logo">
    <div class="wrap">
      
    </div>
  </div>
</div>
</div>
<!-- //footer end -->

</div>
<!-- wrap end -->


</body>
</html>
