<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member join page</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Nanum+Pen+Script&family=Sunflower:wght@500&display=swap"
	rel="stylesheet">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
<style type="text/css">
* {
	font-family: 'Hi Melody', cursive;
	font-family: 'Nanum Pen Script', cursive;
	font-family: 'Sunflower', sans-serif;
	text-decoration: none;
}

.joinPage {
	padding-top: 50px;
	background-image: url("images/profile_bg.jpg");
	background-size: 100% 100%;
	width: 100%;
	height: 1000px;
}

.joinBox {
	border: 5px solid;
	border-collapse: collapse;
	margin: auto;
	background-color: #fff;
}

#textJoin {
	font-size: 150%;
	color: #34495e;
}

#textBox {
	text-align: center;
	padding: 15px;
}

#submit {
	display: block;
	margin-top: 10px;
}

#me {
	padding: 5px;
	padding-left: 15px;
	font-size: 120%;
	text-align: center;
	background-color: #34495e;
	color: #fff;
}

#notice {
	font-size: 80%;
}

td {
	padding-left: 15px;
	padding-right: 15px;
	padding-bottom: 5px;
	padding-top: 5px;
	color: #34495e;
}
</style>
</head>
<body>
	<div class="joinPage">
		<form action="memJoin" method="post" name="frm"
			enctype="multipart/form-data">
			<table class="joinBox">
				<tr>
					<td id="textBox" colspan="2"><strong id="textJoin">프로필
							수정</strong></td>
				</tr>
				<tr>
					<td id="me"><strong>나</strong></td>
					<td></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${memberDTO.memId }</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${memberDTO.memName }</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><fmt:formatDate value="${memberDTO.memBirth }"
							pattern="yyyy.MM.dd" /></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><c:if test="${memberDTO.memGender == 'M' }">
							<strong>남</strong>
						</c:if> <c:if test="${memberDTO.memGender == 'F' }">
							<strong>여</strong>
						</c:if></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="memPhone" size="20"
						placeholder="${memberDTO.memPhone }" /></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" name="postNum" id="sample4_postcode"
						readonly="readonly" size="20" placeholder="${memberDTO.postNum }" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="memAdd" id="sample4_roadAddress"
						size="20" readonly="readonly" placeholder="${memberDTO.memAdd }" />
						<a href="javascript:sample4_execDaumPostcode();">주소 검색</a></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" name="addDetail" size="20"
						placeholder="DETAIL" /></td>
				</tr>
				<tr>
					<td>프로필 사진</td>
					<td><input type="file" name="memImage" multiple="multiple" /></td>
				</tr>
				<tr>
					<td></td>
					<td id="notice">사진을 다시 선택할 경우<br />기존 사진은 삭제됩니다.
					</td>
				</tr>
				<tr>
					<td>내 소개</td>
					<td><textarea rows="3" cols="25" name="memIntro"
							placeholder="${memberDTO.memIntro }"></textarea></td>
				</tr>
				<c:if test="${memberDTO.memPetCk == 'Y' }">
					<tr>
						<td id="me"><strong>댕냥이</strong></td>
						<td></td>
					</tr>
					<tr>
						<td>댕 AND 냥</td>
						<c:if test="${memberDTO.petDn == 'D' }">
							<td><input type="radio" name="petDn" value="D"
								checked="checked" />댕 <input type="radio" name="petDn"
								value="N" />냥</td>
						</c:if>
						<c:if test="${memberDTO.petDn == 'N' }">
							<td><input type="radio" name="petDn" value="D" />댕 <input
								type="radio" name="petDn" value="N" checked="checked" />냥</td>
						</c:if>
					</tr>
					<tr>
						<td>댕냥이 품종</td>
						<td><input type="text" name="petKind" size="20"
							placeholder="${memberDTO.petKind }" /></td>
					</tr>
					<tr>
						<td>댕냥이 이름</td>
						<td><input type="text" name="petName" size="20"
							placeholder="${memberDTO.petName }" /></td>
					</tr>
					<tr>
						<td>댕냥이 나이</td>
						<td><select name="petAge">
								<optgroup label="1살 이하">
									<option value="0.1">1~6개월</option>
									<option value="0.2">7~12개월</option>
								</optgroup>
								<optgroup label="1살 이상">
									<option value="1">1살</option>
									<option value="2">2살</option>
									<option value="3">3살</option>
									<option value="4">4살</option>
									<option value="5">5살</option>
									<option value="6">6살</option>
									<option value="7">7살</option>
									<option value="8">8살</option>
									<option value="9">9살</option>
									<option value="10">10살 이상</option>
								</optgroup>
						</select></td>
					</tr>
					<tr>
						<td>댕냥이 성별</td>
						<c:if test="${memberDTO.petGender == 'M' }">
							<td><input type="radio" name="petGender" value="M"
								checked="checked" />수컷 <input type="radio" name="petGender"
								value="F" />암컷</td>
						</c:if>
						<c:if test="${memberDTO.petGender == 'F' }">
							<td><input type="radio" name="petGender" value="M" />수컷 <input
								type="radio" name="petGender" value="F" checked="checked" />암컷</td>
						</c:if>
					</tr>
					<tr>
						<td>대냥이 사진</td>
						<td><input type="file" name="petImage" multiple="multiple" /></td>
					</tr>
					<tr>
						<td></td>
						<td id="notice">사진을 다시 선택할 경우<br />기존 사진은 삭제됩니다.
						</td>
					</tr>
					<tr>
						<td>댕냥이 소개</td>
						<td><textarea rows="3" cols="25" name="petIntro"
								placeholder="${memberDTO.petIntro }"></textarea></td>
					</tr>
				</c:if>
				<c:if test="${memberDTO.memPetCk == 'N' }">
					<tr>
						<td colspan="2"><a href="#">댕냥이 등록</a></td>
					</tr>
				</c:if>
				<tr>
					<td id="submit" colspan="2" align="center"><input
						type="submit" value="수정" /> <input type="reset" value="리셋" /> <input
						type="button" value="취소"
						onclick="javascript:location.href='main.sm'" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>