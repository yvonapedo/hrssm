<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="jspresource.jsp" %>
<!DOCTYPE html>
<html>
<head>
       <style type="text/css">
        body {
            background-image: url(../res/img/bg1.jpg);
            background-repeat: no-repeat;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-attachment: fixed;
            postion: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        table {
            /*background: #ffffff;*/
            padding: 10px;
            /*border: #cccccc solid 1px;*/

        }

        tr {
            height: 60px;
        }
        img{margin-bottom: 20px;
            margin-top: 80px;
            -webkit-box-shadow: 5px -4px 10px 3px rgba(93, 93, 93, 0.87);
            -moz-box-shadow: 5px -4px 10px 3px rgba(93, 93, 93, 0.87);
            box-shadow: 5px -4px 10px 3px rgba(93, 93, 93, 0.87);
        }
    </style>
    <!-- end of page css-->
    <meta charset="utf-8">
    <title>Register member</title>
</head>
<body style=" background-image:url(../res/img/bg1.jpg); ">
<!-- begin to edit form -->
<form action="../user/login" style="  display: flex;">
    <div style=" height: 100vh; background-color: #eeeeeeef; padding:30px 30px 0px 30px; width: 500px; border-right: #2d3b91 10px solid;
                display: flex;">

        <div style="margin-left: 50px; margin-top: 50px;">
            <table>
                <tr>
                    <td colspan="2">
                        <h1 style="color: #2D3B91; font-weight: 800; font-size: 25px; margin-bottom: 50px">WELCOME TO OUR COMPANY </h1>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h2 style="color: #2D3B91;">Login </h2>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px;"><label class="layui-form-label">Username</label></td>


                    <c:if test="${loginuser==null}">
                        <td><input type="text" class="layui-input" style="width: 300px" name="username"
                                  ></td>
                    </c:if>
                </tr>
                <tr>
                    <td><label class="layui-form-label">Password</label></td>
                    <td><input type="password" class="layui-input" style="width: 300px" name="password"
                              ></td>
                </tr>

                <tr><td></td>
                    <td style="text-align: center;">
                        <input type="submit" class="layui-btn layui-btn-normal" name="login" value="Login">
                        <input type="button" class="layui-btn" name="reset" value="Cancel">
                    </td>
                </tr>
            </table>

        </div>

    </div>
    <div style="background-color: #2d3b91; height: 25px; color: #eeeeee; margin-top: 70px;
    padding: 15px; border-bottom-right-radius: 20px; border-top-right-radius: 20px;"><a style="color: white;" href="../views/adduser.jsp"> REGISTER
        &nbsp;<i class="layui-icon layui-icon-right"></i> </a></div>
</form>
<!-- end of edit form -->
</body>
</html>
