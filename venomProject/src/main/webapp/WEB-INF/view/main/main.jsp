<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="style.css">
<meta charset="utf-8">
<title>main page</title>
<style type="text/css">
* {
	font-family: 'Noto Sans KR', sans-serif;
	list-style: none;
	text-decoration: none;
	border-collapse: collapse;
	margin: 0px;
	padding: 0px;
	color: #000;
}

.wrap {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 900px;
	background-color: #000;
}

.intro_bg {
	background-image: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ) , url("images/intro_bg04.png");
	background-size: 100% 718px;
	width: 100%;
	height: 718px;
}

.header {
	display: flex;
	width: 1280px;
	margin: auto;
	height: 86px;
}

.search_area {
	width: 300px;
	height: 40px;
	background: rgba(0.0 .0 .0 .5);
	border-radius: 5px;
	margin-top: 24px;
}

.search_area form input {
	border: none;
	background: rgba(0, 0, 0, 0.0);
	width: 250px;
	height: 40px;
	color: #fff;
	padding-left: 15px;
}

#search_btn {
	width: 50px;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
}

.nav {
	display: flex;
	justify-content: flex-end;
	line-height: 86px;
	width: calc(1280px - 300px);
}

.nav li {
	margin-left: 84px;
}

.nav li:hover {
	background-color: rgba(0, 0, 0, 0.5);
	transition: 0.7s;
}

.nav li a {
	color: #fff;
}

.intro_text {
	width: 100%;
 	margin-top: 160px;
	text-align: center;
}

.intro_text h1, .intro_text h4 {
	color: #fff;
}

h1 {
	font-size: 78px;
	font-weight: lighter;;
}

h4 {
	font-size: 20px;
	font-weight: lighter;
}

.amount {
	position: relative;
	top: -85px;
	display: flex;
	width: 1280px;
	margin: auto;
	background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)) , url("images/menu_bg01.png");
	background-size: 1280px 170px;
}

.amount li {
	flex: 1;
	height: 142px;
	/* background-color: skyblue; */
}

.amount li div {
	text-align: center;
	/* background: green; */
/* 	margin-top: 37px; */
	height: 142px;
	line-height: 130px;
}

.amount li:not(:last-child) div {
	border-right: 1px solid gray;
}

.amount li div a {
	color: #fff;
	font-size: 300%;
	font-weight: bolder;
}

#po {
	position: relative;
	top: -70px;
	font-size: 40px;
	margin: auto;
	color: #fff;
	width: 200px;
	height: 100px;
	background-color: #000;
	text-align: center;
	line-height: 100px
}

#po:hover {
	background: url("images/moon.png");
	background-size: 190px 110px;
	transition: 5s;
	cursor: pointer;
}

.popup_bg {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
}

.popup {
	position: absolute;
	left: calc(50% - 150px);
	top: calc(50% - 250px);
	width: 300px;
	height: 500px;
	background-color: #fff;
	text-align: left;
	padding-top: 30px;
	padding-left: 20px;
}

.popup li {
	list-style-type: square;
}

.amount li div:hover {
	background: rgba(0, 0, 0, 0.5);
	transition: 0.7s;
}

#notice {
	text-align: center;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
      $(document).ready(function(){
        $("#po").click(function(){
          $(".popup_bg").css({
            "display" : "block"
          });
        });
        $(".popup_bg").click(function(){
          $(".popup_bg").css({
            "display" : "none"
          });
        });
      });
    </script>
</head>
<body>
	<div class="wrap">
		<div class="intro_bg">
			<div class="header">
				<div class="search_area">
					<form action="search" name="frm" method="get">
						<input type="search" placeholder="search"><input id="search_btn" type="submit" value="검색">
					</form>
				</div>
				<c:if test="${empty authinfo}">
				<ul class="nav">
					<li><a href="loginPage">로그인</a></li>
					<li><a href="memJoinPage">회원가입</a></li>
					<li><a href="#">#</a></li>
					<li><a href="#">#</a></li>
					<li><a href="#">#</a></li>
				</ul>
				</c:if>
				<c:if test="${!empty authinfo}">
				<ul class="nav">
					<li><a href="profilePage">프로필</a></li>
					<li><a href="memChattingPage">채팅</a></li>
					<li><a href="memListPage">리스트</a></li>
					<li><a href="login/logout">로그아웃</a></li>
					<li><a href="#">#</a></li>
				</ul>
				</c:if>
			</div>
			<div class="intro_text">
				<h1>
					댕냥팅
				</h1>
				<h4>
					1000만 반려동물 시대!!!<br/>
					당신의 댕냥이에게 친구들을 만들어주세요~
				</h4>
			</div>
		</div>
		<ul class="amount">
			<li><div>
					<a href="#" target="_blank">스토리<br>
					</a>
				</div></li>
			<li><div>
					<a href="#" target="_blank">매칭<br>
					</a>
				</div></li>
			<li><div>
					<a href="#" target="_blank">#<br>
					</a>
				</div></li>
			<li><div>
					<a href="#" target="_blank">#</a>
				</div></li>
		</ul>
		<div id="po">Notice</div>
	</div>
	<div class="popup_bg">
		<div class="popup">
			<h1 id="notice">Notice</h1>
			<li>개발자 : 이찬복 , 문송이</li>
			<li>개선 해야할 사항이 있다면 연락주세요.<br>(010-3265-7411)
			</li>
			<li>미완성 페이지 항시 업데이트.</li>
			<li>나가려면 배경 클릭.</li>
		</div>
	</div>
</body>
</html>