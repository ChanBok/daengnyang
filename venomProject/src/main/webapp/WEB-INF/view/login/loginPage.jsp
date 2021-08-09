<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
<style type="text/css">
*{
	text-decoration: none;
	list-style: none;
}
.loginPage {
	padding-top: 260px;
	background-image: url("images/login_bg03.png");
	background-size: 100% 100%;
	width: 100%;
	height: 718px;
}
.loginBox {
	border-collapse: collapse;
	border: 5px solid;
	margin: auto;
	background-color: #fff;
}
#text_login {
	font-size: 150%;
	padding: 10px;
}
#find_text {
	padding: 10px;
}
tr {
	text-align: center;
}
td {
	padding-left: 15px;
}

</style>
</head>
<body>
<div class="loginPage">	
	<form action="login" method="post" name="frm">
		<table class="loginBox">
			<tr>
				<td id="text_login" colspan="3"><strong>LOGIN</strong></td>
			</tr>
			<tr>
				<td colspan="3">아이디저장<input type="checkbox" name="rememberId" value="Y">  
				자동로그인<input type="checkbox" name="autoLogin" value="Y"></td>
			</tr>
			<tr>
				<td><strong>ID</strong></td>
				<td><input type="text" name="userId" placeholder="user ID"/>
				</td>
				<td rowspan="2"><input type="image" src="images/loginButton.png"
					width="100" height="90" alt="login" /></td>
			</tr>
			<tr>
				<td><strong>PW</strong></td>
				<td><input type="password" name="userPw" placeholder="user password" />
				</td>
			</tr>
			<tr>
				<td id="find_text" colspan="3"><a href="search/idFind"><strong>아이디 찾기</strong></a> | <a
					href="search/findPassword"><strong>비밀번호 찾기</strong></a></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>