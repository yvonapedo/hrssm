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
                <div class="layui-card-header"><h3>Edit Project </h3>  </div>
                <div class="layui-card-body">
                    <form class="layui-form" action="../project/editproject">
                        <input style="display: none" type="number" name="projectId" value="${project.projectId}">
                        <div class="layui-form-item">
                            <label class="layui-form-label">Project Title </label>
                            <div class="layui-input-block">
                                <input type="text" name="projectTitle" value="${project.projectTitle}" required
                                       lay-verify="required"
                                        autocomplete="off"
                                       class="layui-input" style="width: 300px"/>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">Issue Date</label>
                            <div class="layui-input-block">
                                <input type="date" name="issueDate" value="${project.issueDate}" required
                                       lay-verify="required"
                                        autocomplete="off"
                                       class="layui-input" style="width: 300px"/>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">Due Date</label>
                            <div class="layui-input-block">
                                <input type="date" name="dueDate" value="${project.dueDate}" required
                                       lay-verify="required"
                                        autocomplete="off"
                                       class="layui-input" style="width: 300px"/>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">Employee </label>
                            <div class="layui-input-block">
                                <input type="text" name="username" value="${user.username}" required
                                       lay-verify="required"
                                        autocomplete="off"
                                       class="layui-input" style="width: 300px"/>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">status</label>
                            <div class="layui-input-block">
                                <input type="text" name="status" value="${project.status}" required
                                       lay-verify="required"
                                        autocomplete="off"
                                       class="layui-input" style="width: 300px"/>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">remark</label>
                            <div class="layui-input-block">
                                <input type="text" name="remarks" value="${project.remarks}" required
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
