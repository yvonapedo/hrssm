<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="jspresource.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <!--begin to Js of page-->
    <script type="text/javascript" src="../res/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../res/js/ajaxfileupload.js"></script>
    <script type="text/javascript">
        $(function () {
            /*After the upload button is clicked, the
            file control is invoked to open the file selector.
            */
            $("#choicePhoto").click(function () {
                $("#fileToUpload").click();
            });
            /*When a file is selected, the change method of the
            file control is started
             */
            $("#fileToUpload").change(function (e) {
                $.ajaxFileUpload({
                    url: '../fileuploadservlet.do',
                    type: "post",
                    secureuri: false,
                    fileElementId: 'fileToUpload',
                    dataType: 'text',//return data's type
                    data: null,
                    success: function (data) {
                        alert("file upload successfully"); //display messge
                        var dataNew = "../../hrm_img/" + data
                        $('#upload').attr("src", dataNew)
                        $("#photourl").val(data);
                    },
                    error: function (data, status, e) {
                        alert("file upload failed");//display messge
                    }
                });
            });
        });
    </script>

    <style type="text/css">
        body {
            background-image: url(../res/img/bg.jpg);
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

        img {
            margin-bottom: 20px;
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
<body style=" background-image:url(../res/img/bg.jpg); ">
<!-- begin to edit form -->
<form action="../user/register" style="  display: flex;">
    <div style=" height: 100vh; background-color: #eeeeeeef; padding:30px 30px 0px 30px; width: 800px; border-right: #2d3b91 10px solid;
                display: flex;">


        <div>
            <section style=" overflow: hidden">
                <div style="width:100%">

                    <c:if test="${content==null}">
                        <div><img style="" id="upload" width="300" height="300px"
                                  src="../../hrm_img/nopicture.jpg"></div>
                    </c:if>
                    <c:if test="${content!=null}">
                        <div><img id="upload" style="margin-bottom: 20px;" width="300" height="300px"
                                  src="../../hrm_img/${loginuser.photourl}">
                        </div>
                    </c:if>
                </div>

                <div>
                    <input id="photourl" class="layui-input" style=" color: #c5bec1;" type="text"
                           name="photourl" value="${loginuser.photourl}"
                           readonly="readonly">
                    <input class="layui-btn layui-btn-normal" type="button" value="Select Picture" id="choicePhoto"
                           style="width: 100%; margin-bottom: 10px; ">
                    <!-- Hide file tag -->
                    <input id="fileToUpload" style="display:none" type="file" name="upfile"/>
                </div>


            </section>
        </div>

        <%--        <div style="width: 2px; background-color: #2D3B91; height: 100%;"></div>--%>
        <div style="margin-left: 50px;">
            <table>
                <tr>
                    <td colspan="2">
                        <h2 style="color: #2D3B91;">Sign up </h2>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px;"><label class="layui-form-label">Username</label></td>
                    <c:if test="${loginuser!=null}">
                        <td><input type="text" class="layui-input" style="width: 300px" name="userid"
                                   value="${loginuser.userid}"></td>
                    </c:if>
                    <c:if test="${loginuser==null}">
                        <td><input type="text" class="layui-input" style="width: 300px" name="username"
                                   value="${loginuser.username}"></td>
                    </c:if>
                </tr>
                <tr>
                    <td><label class="layui-form-label">Password</label></td>
                    <td><input type="password" class="layui-input" style="width: 300px" name="password"
                               value="${loginuser.password}"></td>
                </tr>
                <tr>
                    <td><label class="layui-form-label">Confirm password</label></td>
                    <td><input type="password" class="layui-input" style="width: 300px" name="password2"
                               value="${loginuser.password}"></td>
                </tr>
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
                    <td><label class="layui-form-label">Department</label></td>
                    <td>
                        <%--                        <input type="text" class="layui-input" style="width: 300px" name="deptid"--%>
                        <%--                               value="${loginuser.deptid}">--%>

                        <select name="deptid" class="layui_input" style="padding: 10px; width: 300px;">
                            <option value="">-- select one --</option>
                            <c:forEach items="${depts}" var="obj">
                            <option value="${obj.deptId}">${obj.deptName}</option>
                            </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td><label class="layui-form-label">Hire Date</label></td>
                    <td><input type="date" class="layui-input" style="width: 300px" name="hiredate"
                               value="${loginuser.hiredate}"></td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" class="layui-btn layui-btn-normal" name="register" value="Register">
                        <input type="button" class="layui-btn" name="reset" value="Cancel">
                    </td>
                </tr>
            </table>

        </div>

    </div>
    <div style="background-color: #2d3b91; height: 25px; color: #eeeeee; margin-top: 70px;
    padding: 15px; border-bottom-right-radius: 20px; border-top-right-radius: 20px;"><a style="color: white;"
                                                                                        href="../views/login.jsp"> LOGIN
        &nbsp;<i class="layui-icon layui-icon-right"></i> </a></div>
</form>
<!-- end of edit form -->
</body>
</html>