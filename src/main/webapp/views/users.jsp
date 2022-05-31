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

        .users {
            display: flex;
            justify-self: center;
            flex-wrap: wrap;
            width: 1300px;
        }

        .user {
            background-color: #2d3b91;
            margin: 1rem;
            width: 270px;
            overflow: hidden;

            position: relative;
            color: white;
            margin-top: 15px;
            /*border-radius: 3px;*/
            box-shadow: 0 4px 5px rgba(0, 0, 0, 0.2);
        }

        .user img {

            width: 100%;
        }

        .overview {
            max-height: 100%;
            overflow: auto;
            background-color: white;
            opacity: 0.5%;
            padding: 2rem;
            color: black;
            transform: translateY(101%);
            transition: transform 0.1s ease-in;
            position: absolute;

            left: 0;
            right: 0;
            bottom: 0;
        }

        .overview h4 {
            margin-top: 0;
            margin-bottom: 5px;
            color: #2d3b91;
            font-weight: bolder;
        }

        .overview p {
            margin-bottom: 3px;
            text-align: left;
        }

        .user:hover .overview {
            transform: translateY(0);
        }

        .user-info {
            color: #eeeeee;
            align-items: center;
            display: flex;

            justify-content: space-between;
            padding: 0.5rem 1rem 1rem;
            letter-spacing: 1px;
        }

        .user-info h3 {
            margin: 0;
        }

        .user-info span {
            background-color: #22254b;
            padding: 0.25rem 0.5rem;
            border-radius: 3px;
            font-weight: bold;
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

        <div class="main_content">

            <form class="layui-form" action="../user/getusers">
                <div class="layui-form-item">
                    <label class="layui-form-label">Search box</label>
                    <div class="layui-input-block" style="display: flex">
                        <input type="text" name="search" required lay-verify="required"
                               placeholder="please input title..." autocomplete="off"
                               class="layui-input" style="width: 300px"/>
                        <button type="submit" class="layui-btn layui-btn-normal">Search</button>
                    </div>
                </div>

                <div class="users">
                    <c:forEach items="${users}" var="obj">
                        <div class="user">

                            <img src="../../hrm_img/${obj.photourl}"
                                 style="margin-bottom: 20px;"
                                 alt="${obj.lastname}">
                            <div class="user-info">
                                <h3><b>${obj.firstname}&nbsp; ${obj.lastname}</b></h3>

                            </div>
                            <div class="overview">
                                <h4>Details</h4>
                                <p class="s3">${obj.telephone}</p>
                                <p class="s3">${obj.email}</p>
                                <p class="s3">${obj.address}</p>
                                <p class="s3">${obj.hiredate}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

