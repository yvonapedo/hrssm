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
                    <form class="layui-form" action="../user/edituser">
                        <table>
                            <tr>
                                <td colspan="2">
                                    <h2 style="color: #2D3B91;">Update My Detail </h2>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px;"><label class="layui-form-label">Username</label></td>
                                <c:if test="${loginuser!=null}">
                                    <td><input type="text" class="layui-input" style="width: 300px" name="username"
                                               value="${loginuser.username}"></td>
                                </c:if>

                            </tr>
                            <%--                            <tr>--%>
                            <%--                                <td><label class="layui-form-label">Password</label></td>--%>
                            <%--                                <td><input type="password" class="layui-input" style="width: 300px" name="password"--%>
                            <%--                                           value="${loginuser.password}"></td>--%>
                            <%--                            </tr>--%>
                            <%--                            <tr>--%>
                            <%--                                <td><label class="layui-form-label">Confirm password</label></td>--%>
                            <%--                                <td><input type="password" class="layui-input" style="width: 300px" name="password2"--%>
                            <%--                                           value="${loginuser.password}"></td>--%>
                            <%--                            </tr>--%>
                            <tr>
                                <td><label class="layui-form-label">First name</label></td>
                                <td><input type="text" class="layui-input" style="width: 300px" name="firstname"
                                           value="${loginuser.firstname}"></td>
                            </tr>
                            <tr>
                                <td><label class="layui-form-label">Last name</label></td>
                                <td><input type="text" class="layui-input" style="width: 300px" name="lastname"
                                           value="${loginuser.lastname}"></td>
                            </tr>
                            <tr>
                                <td><label class="layui-form-label">Dat of birth</label></td>
                                <td><input type="date" class="layui-input" style="width: 300px" name="dob"
                                           value="${loginuser.dob}"></td>
                            </tr>
                            <tr>
                                <td><label class="layui-form-label">Mobile</label></td>
                                <td><input type="text" class="layui-input" style="width: 300px" name="telephone"
                                           value="${loginuser.telephone}"></td>
                            </tr>
                            <tr>
                                <td><label class="layui-form-label">Email</label></td>
                                <td><input type="text" class="layui-input" style="width: 300px" name="email"
                                           value="${loginuser.email}"></td>
                            </tr>
                            <tr>
                                <td><label class="layui-form-label">Address</label></td>
                                <td><input type="text" class="layui-input" style="width: 300px" name="address"
                                           value="${loginuser.address}"></td>
                            </tr>

                            <tr>
                                <td><label class="layui-form-label">Gender</label></td>
                                <td>
                                    <%--                                    <input type="text" class="layui-input" style="width: 300px" name="address"--%>
                                    <%--                                           value="${loginuser.address}">--%>
                                    <div>
                                        <input type="radio" name="gender" value="male" title="Male">
                                        <input type="radio" name="gender" value="female" title="Female">
                                    </div>

                                </td>
                            </tr>

                            <tr>
                                <td><label class="layui-form-label">Hire Date</label></td>
                                <td><input type="date" class="layui-input" style="width: 300px" name="hiredate"
                                           value="${loginuser.hiredate}"></td>
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
<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;

    });
</script>
</html>
