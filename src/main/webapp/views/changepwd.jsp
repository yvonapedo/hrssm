<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="jspresource.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>HRM</title>
    <style>
        .tab_relative {
            /*border: red 2px solid;*/
            margin: auto;
            /*width: 1000px;*/
        }

        table {
            /*background: #ffffff;*/
            padding: 10px;
            /*border: #cccccc solid 1px;*/

        }

        tr {
            height: 60px;
        }

        .main_content {
            background-color: #fafafa;
            margin: 50px 0px 0px 100px;
            padding: 50px;
        }
    </style>
</head>
<body>
<center>
    <!-- begin to system menu-->
    <%@include file="sysmenu.jsp" %>
    <!-- end of system menu-->
    <div style="display: flex;">
        <%@include file="sidebar.jsp" %>

        <div class="main_content" style="width: 900px">
            <div class="layui-card" style="width: 800px">
                <div class="layui-card-header"><h3>My information </h3></div>
                <div class="layui-card-body">
                    <form class="layui-form" action="../user/changepwd">
                        <table>
                            <tr>
                                <td colspan="2">
                                    <h2 style="color: #2D3B91;">Change Password </h2>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px;"><label class="layui-form-label">Username</label></td>
                                <c:if test="${loginuser!=null}">
                                    <td><input type="text" class="layui-input" style="width: 300px" name="username"
                                               value="${loginuser.username}"></td>
                                </c:if>

                            </tr>
                            <tr>
                                <td><label class="layui-form-label">Old Password</label></td>
                                <td><input type="password" class="layui-input" style="width: 300px" name="password"
                                ></td>
                            </tr>
                            <tr>
                                <td><label class="layui-form-label">New Password</label></td>
                                <td><input type="password" class="layui-input" style="width: 300px" name="password1"
                                ></td>
                            </tr>
                            <tr>
                                <td><label class="layui-form-label">Confirm password</label></td>
                                <td><input type="password" class="layui-input" style="width: 300px" name="password2"
                                         ></td>
                            </tr>


                        </table>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button lay-filter="formDemo" type="submit" lay-submit
                                        class="layui-btn layui-btn-normal">Save
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

</center>
</body>
</html>
