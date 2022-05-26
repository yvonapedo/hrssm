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
        .main_content{
            background-color: #fafafa;
            margin: 50px 0px 0px 100px;
            padding:50px ;
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

        <div class="main_content">

            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">Search box</label>
                    <div class="layui-input-block" style="display: flex">
                        <input type="text" name="search" required lay-verify="required"
                             placeholder="please input title..." autocomplete="off"
                               class="layui-input"  style="width: 300px"/>
                        <button type="submit" class="layui-btn layui-btn-normal">Search</button>
                    </div>
                </div>

            <table class="tab_relative  layui-table" border="1"  >
                <thead style="" height="30">
                <td width="350"><strong>Project Title</strong></td>
                <td width="150"><strong>Issue Date</strong></td>
                <td width="150"><strong>Due Date </strong></td>
                <td width="150"><strong>Status </strong></td>
                <td width="150"><strong>Remarks</strong></td>

                <td colspan="2"><strong>Operations</strong></td>
                <%--            <td><strong></strong></td>--%>
                </thead>
                <tbody>
                <c:forEach items="${projects}" var="obj">
                    <tr>
                        <td><p class="s3">${obj.projectTitle}</p></td>
                        <td><p class="s3">${obj.issueDate}</p></td>
                        <td><p class="s3">${obj.dueDate}</p></td>
                        <td><p class="s3">${obj.status}</p></td>
                        <td><p class="s3">${obj.remarks}</p></td>
                        <td>
<%--                            <c:if test="${loginuser.userid==obj.employeeId}">--%>
                                <p>
                                    <a class="layui-btn" href="../project/getproject?projectId=${obj.projectId}">edit</a>
                                    <a class="layui-btn layui-btn-primary" href="#">remove</a>
                                </p>
<%--                            </c:if>--%>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            </form>
        </div>
</body>
</html>

