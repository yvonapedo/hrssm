<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="../res/layui/css/layui.css">
    <title>HRM</title>

</head>
<body>
<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo"
    style="margin-right: 10px ; text-align: left; background-color: #001428; height: 100vh; border-radius: 0px; border: #001428 2px solid;">
    <li class="layui-nav-item">
        <img src="../../hrm_img/${loginuser.photourl}" style="height: 100px; width: 100px; border-radius: 50px; margin: 10px 0px 10px 45px;">
        <%--        <svg  viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">--%>
        <%--        <circle cx="50" cy="50" r="50"  stroke="#001428" stroke-width="35" fill="#2D3B91"/>   </svg>--%>
    </li>

    <c:if test="${loginuser.usertypeId==1}">
        <li class="layui-nav-item">
            <a href="javascript:;">${loginuser.firstname}</a>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">${loginuser.lastname}</a>
        </li>
    </c:if>
    <c:if test="${loginuser.usertypeId!=1}">
        <li class="layui-nav-item">
            <a href="javascript:;">Projects</a>
            <dl class="layui-nav-child">
                <dd><a href="../views/addproject.jsp">New Project</a></dd>
                <dd><a href="../project/getprojects">Incomplete Project</a></dd>
                <dd><a href="../project/getprojects">Completed Project</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">Departments</a>
            <dl class="layui-nav-child">
                <dd><a href="../views/adddept.jsp">add Department</a></dd>
                <dd><a href="../department/getdepartments">Department managers</a></dd>
                <dd><a href="../department/getdepartments">Department members</a></dd>

            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">Salaries</a>
            <dl class="layui-nav-child">
                <dd><a href="../views/addsalary.jsp">Add Salary</a></dd>
                <dd><a href="../salary/getsalaries">Employees Salary</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">Users</a>
            <dl class="layui-nav-child">
                <dd><a href="../views/adduser.jsp">Add User</a></dd>
                <dd><a href="../user/getusers">User query</a></dd>
            </dl>
        </li>
    </c:if>
    <li class="layui-nav-item"><a href="../user/logout">Exit</a></li>

</ul>


<script src="layui/layui.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'element'], function () {
        var layer = layui.layer,
            element = layui.element;

        element.on('nav(demo)', function (elem) {
            // layer.msg(elem.text());
        });
    });
</script>
</body>
</html>
