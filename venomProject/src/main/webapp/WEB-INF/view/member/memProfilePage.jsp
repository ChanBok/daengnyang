<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Nanum+Pen+Script&family=Sunflower:wght@500&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Hi Melody', cursive;
	font-family: 'Nanum Pen Script', cursive;
	font-family: 'Sunflower', sans-serif;
	text-decoration: none;
	color: #34495e;
}

.my_page {
	padding-top: 60px;
	background-image: url("images/profile_bg.jpg");
	background-size: 100% 100%;
	width: 100%;
	height: 900px;
}

.profile_box {
	width: 500px;
	margin: auto;
}

.mem_profile_box {
	border: 5px solid;
	border-collapse: collapse;
	background-color: #fff;
	float: left;
}

.pet_profile_box {
	border: 5px solid;
	border-collapse: collapse;
	background-color: #fff;
	float: right;
}

#text_profile {
	font-size: 150%;
}

#text_box {
	padding: 15px;
	text-align: center;
}

#image_box {
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 0px;
	padding-bottom: 0px;
}

td {
	text-align: center;
	padding: 10px;
}

strong {
	font-size: 110%;
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
	top: calc(50% - 170px);
	width: 300px;
	height: 300px;
	background-color: #fff;
	text-align: left;
	padding-top: 30px;
	padding-left: 20px;
}

#popup_intro {
	text-align: center;
}

#intro {
	text-decoration: underline;
}

.button-3 {
	width: 140px;
	height: 50px;
	border: 2px solid #34495e;
	float: left;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin-left: 30px;
}

.button-3 a {
	font-family: arial;
	font-size: 16px;
	color: #34495e;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
}

.eff-3 {
	width: 140px;
	height: 50px;
	bottom: -50px;
	background: #34495e;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
}

.button-3:hover .eff-3 {
	bottom: 0;
}

.button-3:hover a {
	color: #fff;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function intro() {
		$(".popup_bg").css({
			"display" : "block"
		});
	}
	$(document).ready(function() {
		$(".popup_bg").click(function() {
			$(".popup_bg").css({
				"display" : "none"
			});
		});
	});
</script>
<body>
	<div class="my_page">
		<div class="profile_box">
			<table class="mem_profile_box">
				<tr>
					<td id="text_box" colspan="2"><strong id="text_profile">프로필</strong></td>
				</tr>
				<tr>
					<td><c:if test="${memberDTO.memImage != null }">
							<img width="200" height="200"
								src="member/profile/${memberDTO.memImage.split(',')[0] }" />
							<br />
						</c:if> <c:if test="${memberDTO.memImage == null }">
							<img width="200" height="200" src="images/profile.png" />
						</c:if></td>
				</tr>
				<tr>
					<td><strong>${memberDTO.memName }</strong> , <strong><fmt:formatDate
								value="${memberDTO.memBirth }" pattern="yy.MM.dd" /></strong></td>
				</tr>
				<tr>
					<td>성별 : <c:if test="${memberDTO.memGender == 'M' }">
							<strong>남</strong>
						</c:if> <c:if test="${memberDTO.memGender == 'F' }">
							<strong>여</strong>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>활동지역 : <strong>${memberDTO.memLocation }</strong></td>
				</tr>
				<tr>
					<td>휴대폰 : <strong>${memberDTO.memPhone }</strong></td>
				</tr>
				<tr>
					<td>댕냥이 : <c:if test="${memberDTO.petDn == 'D' }">
							<strong>댕</strong>
						</c:if> <c:if test="${memberDTO.petDn == 'N' }">
							<strong>냥</strong>
						</c:if> <c:if test="${memberDTO.memPetCk == 'N' }">없음</c:if>
					</td>
				</tr>
				<tr>
					<td><a id="intro" onclick="intro()" href="#"><strong>소개</strong></a></td>
				</tr>
				<tr>
					<td id="button_box">
						<div class="button-3">
							<div class="eff-3"></div>
							<a href="profileEditPage"> 프로필 수정 </a>
						</div>
					</td>
				</tr>
			</table>
			<c:if test="${memberDTO.memPetCk == 'Y' }">
				<table class="pet_profile_box">
					<tr>
						<td id="text_box" colspan="2"><strong id="text_profile">댕냥이</strong></td>
					</tr>
					<tr>
						<td id="image_box"><c:if
								test="${memberDTO.petImage != null }">
								<img width="200" height="200"
									src="member/profile/${memberDTO.petImage.split(',')[0] }" />
								<br />
							</c:if> <c:if test="${memberDTO.petImage == null }">
								<img width="200" height="200" src="images/profile.png" />
							</c:if></td>
					</tr>
					<tr>
						<td id="image_box"><c:if
								test="${memberDTO.petImage.split(',')[1] != null }">
								<img width="100" height="100"
									src="member/profile/${memberDTO.petImage.split(',')[1] }" />
								<br />
							</c:if> <c:if test="${memberDTO.petImage.split(',')[1] == null }">
								<img width="100" height="100" src="images/profile.png" />
							</c:if> <c:if test="${memberDTO.petImage.split(',')[2] != null }">
								<img width="100" height="100"
									src="member/profile/${memberDTO.petImage.split(',')[2] }" />
								<br />
							</c:if> <c:if test="${memberDTO.petImage.split(',')[2] == null }">
								<img width="100" height="100" src="images/profile.png" />
							</c:if></td>
					</tr>
					<tr>
						<td><strong>${memberDTO.petName }</strong> , <strong><c:choose>
									<c:when test="${memberDTO.petAge == '0.1' }">1~6 개월</c:when>
									<c:when test="${memberDTO.petAge == '0.2' }">7~12 개월</c:when>
									<c:otherwise>${memberDTO.petAge }살</c:otherwise>
								</c:choose> </strong></td>
					</tr>
					<tr>
						<td>성별 : <c:if test="${memberDTO.petGender == 'M' }">
								<strong>수컷</strong>
							</c:if> <c:if test="${memberDTO.petGender == 'F' }">
								<strong>암컷</strong>
							</c:if>
						</td>
					</tr>
					<tr>
						<td>품종 : <strong>${memberDTO.petKind }</strong></td>
					</tr>
					<tr>
						<td><a id="intro" onclick="intro()" href="#"><strong>소개</strong></a></td>
					</tr>
				</table>
			</c:if>
			<c:if test="${memberDTO.memPetCk == 'N' }">
				<table class="pet_profile_box">
					<tr>
						<td id="text_box" colspan="2"><strong id="text_profile">댕냥이
								미등록</strong></td>
					</tr>
					<tr>
						<td><img width="200" height="200" src="images/profile.png" /></td>
					</tr>
				</table>
			</c:if>
		</div>
	</div>
	<div class="popup_bg">
		<div class="popup">
			<h1 id="popup_intro">소개</h1>
			<li><strong>나 : </strong> <c:if
					test="${memberDTO.memIntro == null}">미등록</c:if> <c:if
					test="${memberDTO.memIntro != null}">${memberDTO.memIntro }</c:if>
			</li>
			<li><strong>댕냥이 : </strong> <c:if
					test="${memberDTO.petIntro == null}">미등록</c:if> <c:if
					test="${memberDTO.petIntro != null}">${memberDTO.petIntro }</c:if>
			</li>
		</div>
	</div>
</body>
</html>