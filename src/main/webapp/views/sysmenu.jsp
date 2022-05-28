<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>HRM</title>
    <link rel="stylesheet" href="../res/layui/css/layui.css">

    <style>

        .layui-nav-item {
            font-weight: 500;
            text-transform: uppercase;
        }
    </style>

    <script>
        window.onload = function exampleFunction() {
            // window.open("../message/getunread")
            console.log('The Script will load now.');
        }
    </script>
</head>
<body>

<div class="layui-container " style="width: 100%; background-color: #2D3B91;">
    <div class="layui-row" style="display: flex; ">
        <div style=" margin-top:10px ;width: 100px;color: #ffffff; display: flex; font-weight: 500;font-size: 30px"><i
                class="layui-icon layui-icon-website" style="font-weight: 500;font-size: 50px"></i>&nbsp;&nbsp;HRM
        </div>
        <div class="layui-col-md8 layui-col-md-offset4">
            <ul class="layui-nav " style="width: 100%; background-color: #2D3B91;" lay-filter="test">

                <li class="layui-nav-item"><a href="../project/getprojects"><i
                        class="layui-icon layui-icon-align-left"></i>&nbsp;&nbsp;&nbsp;My projects</a></li>
                <li class="layui-nav-item"><a href="../salary/getsalaries"><i class="layui-icon  layui-icon-dollar"></i>&nbsp;&nbsp;&nbsp;Income</a>
                </li>
                <li class="layui-nav-item"><a href="../department/getemployees?deptId=${loginuser.deptid}"><i
                        class="layui-icon layui-icon-group"></i>&nbsp;&nbsp;&nbsp;My Department</a></li>
                <li class="layui-nav-item"><a href="../message/getmessages"> <i class="layui-icon layui-icon-email"></i>&nbsp;&nbsp;&nbsp;Messages
<%--                    <span class="layui-badge orange">${count}</span>--%>
                </a>
                </li>
                <li class="layui-nav-item"><a href="">
                    <%--                    <img src="../../hrm_img/${loginuser.photourl}" tppabs="http://t.n/RCzsdCq" class="layui-nav-img">--%>
                    <i class="layui-icon layui-icon-user"></i>&nbsp;&nbsp;&nbsp;${loginuser.firstname}</a>
                    <dl class="layui-nav-child">
                        <dd><a href="../views/edituser.jsp"><i class="layui-icon layui-icon-username"></i>&nbsp;&nbsp;My
                            Information</a></dd>
                        <dd><a href="../views/changepwd.jsp"><i class="layui-icon layui-icon-password"></i>&nbsp;&nbsp;Change
                            Password</a>
                        </dd>
                        <dd><a href="../user/logout"><i class="layui-icon layui-icon-close"></i>&nbsp;&nbsp;Exit</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
</div>


<script src="../res/layui/layui.js"></script>
<script>
    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element,
            layer = layui.layer,
            util = layui.util,
            $ = layui.$;

    });
</script>
</body>
</html>
