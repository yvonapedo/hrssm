<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>错误提示</title>
		<style>
			.errorcontent{
				margin-left: 100px;
				width:1000px;
			}
			a{
				text-decoration: none;
				font-size: 16px;
				color:#EE7621;
			}
			
		</style>
	</head>
	<body>
		<table class="errorcontent">
			<tr>
				<td rowspan="2" style="width:350px">
					<img src="img/error.jpg">
				</td>
				<td><center>
						<p><h2>${errMsg }</h2></p>
					</center>
				</td>
			</tr>
			<tr>
				<td>
					<center>
						<a href="${backUrl }">Back to last web page</a>
					</center>
				</td>
			</tr>
		</table>
	</body>
</html>
