<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Successful</title>
		<style>
			.errorcontent{
				margin-left: 100px;
				width:1000px;
			}
			a{
				text-decoration: none;
				/*font: "宋体";*/
				font-size: 16px;
				color:#EE7621;
			}
			img{
				width:300px; height: 300px;
			}
		</style>
	</head>
	<body>
		<table class="errorcontent">
			<tr>
				<td rowspan="2" style="width:350px">
					<img src="../../hrm_img/success.png">
				</td>
				<td><center>
						<p><h2>${promptMsg }</h2></p>
					</center>
				</td>
			</tr>
			<tr>
				<td>
					<center>
						<a href="${backUrl }">O K</a>
					</center>
				</td>
			</tr>
		</table>
	</body>
</html>
