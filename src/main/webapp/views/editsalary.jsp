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
                <div class="layui-card-header"><h3>New Salary </h3>  </div>
                <div class="layui-card-body">
                    <form class="layui-form" action="../salary/editsalary">
                        <input style="display: none" type="number" name="salaryId" value="${salary.salaryId}">


                        <div class="layui-form-item">
                            <label class="layui-form-label">Employee Name</label>
                            <div class="layui-input-block">
                                <input type="text"  name="employeeId" value="${salary.employeeId}" required
                                       lay-verify="required"
                                       autocomplete="off"
                                       class="layui-input" style="width: 300px"/>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">Salary Amount </label>
                            <div class="layui-input-block">
                                <input type="text" name="amount" value="${salary.amount}" required
                                       lay-verify="required"
                                       autocomplete="off"
                                       class="layui-input" style="width: 300px"/>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">Issue Date</label>
                            <div class="layui-input-block">
                                <input type="date" name="issueDate" value="${salary.issueDate}" required
                                       lay-verify="required"
                                       autocomplete="off"
                                       class="layui-input" style="width: 300px"/>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">Remark </label>
                            <div class="layui-input-block">
                                <input type="text" name="remarks" value="${salary.remarks}" required
                                       lay-verify="required"
                                       autocomplete="off"
                                       class="layui-input" style="width: 300px"/>
                            </div>
                        </div>

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
