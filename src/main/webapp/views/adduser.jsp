<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="jspresource.jsp"%>
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
                        var dataNew = "../hrm_img/" + data
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
        body{
            background-image:url(../res/img/bg.jpg);
            background-repeat: no-repeat;
            width:100%;
            height:100%;
            background-size: cover;
            background-attachment: fixed;
            postion:fixed;
            top:0;
            left:0;
            right:0;
            bottom:0;
        }
        table{
            background: #ffffff;
            padding:10px;
            /*border: #cccccc solid 1px;*/
            border-radius:10px;
        }
        tr{
            height: 60px;
        }

    </style>
    <!-- end of page css-->
    <meta charset="utf-8">
    <title>Register member</title>
</head>
<body style=" background-image:url(../res/img/bg.jpg); ">
<!-- begin to edit form -->
<div style=" height: 100vh;  border: red 5px solid; padding:30px 50px 0px 50px; width: 400px ">
    <center>
        <form action="../user/register" >
            <table>
                <tr>
                    <td colspan="2" >
                      <h2 style="  font-weight: 500; color: #2D3B91;">Sign up </h2>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="col-five">
                            <section style=" overflow: hidden">
                                <div style="width:100%">

                                    <c:if test="${content==null}">
                                        <div><img id="upload" width="300" height="300px" src="../hrm_ing/nopicture.jpg"></div>
                                    </c:if>
                                    <c:if test="${content!=null}">
                                        <div><img id="upload" width="300" height="300px" src="../hrm_ing/${loginuser.photourl}">
                                        </div>
                                    </c:if>
                                </div>

                                <div>
                                    <input id="photourl" class="editbox2" style="width: 100%; color: #c5bec1;" type="text"
                                           name="photourl" value="${loginuser.photourl}"
                                           readonly="readonly">
                                    <input class="btn btn--stroke" type="button" value="Choose Picture" id="choicePhoto"
                                           style="width: 90%; color: #c5bec1; ">
                                    <!-- Hide file tag -->
                                    <input id="fileToUpload" style="display:none" type="file" name="upfile"/>
                                </div>


                            </section>
                        </div>


                    </td>
                </tr>
                <tr>
                    <td> <label class="layui-form-label">Username</label> </td>
                    <c:if test="${loginuser!=null}">
                    <td><input type="text"  class="layui-input" style="width: 300px" name="userid" value="${loginuser.userid}" ></td>
                    </c:if>
                    <c:if test="${loginuser==null}">
                        <td><input type="text"  class="layui-input" style="width: 300px" name="username" value="${loginuser.username}"></td>
                    </c:if>
                </tr>
                <tr>
                    <td><label class="layui-form-label">Password</label></td>
                    <td><input type="password"  class="layui-input" style="width: 300px" name="password" value="${loginuser.password}"></td>
                </tr>
                <tr>
                    <td><label class="layui-form-label">Confirm password</label></td>
                    <td><input type="password"  class="layui-input" style="width: 300px" name="password2" value="${loginuser.password}"></td>
                </tr>
                <tr>
                    <td><label class="layui-form-label">First name</label></td>
                    <td><input type="text"  class="layui-input" style="width: 300px" name="firstname" value="${loginuser.firstname}"></td>
                </tr>
                <tr>
                    <td><label class="layui-form-label">Last name</label></td>
                    <td><input type="text"  class="layui-input" style="width: 300px" name="lastname" value="${loginuser.lastname}"></td>
                </tr>
                <tr>
                    <td><label class="layui-form-label">Dat of birth</label></td>
                    <td><input type="date"  class="layui-input" style="width: 300px" name="dob" value="${loginuser.dob}"></td>
                </tr>
                <tr>
                    <td><label class="layui-form-label">Mobile</label></td>
                    <td><input type="text"  class="layui-input" style="width: 300px" name="telephone" value="${loginuser.telephone}"></td>
                </tr>
                <tr>
                    <td><label class="layui-form-label">email</label></td>
                    <td><input type="text"  class="layui-input" style="width: 300px" name="email" value="${loginuser.email}"></td>
                </tr>
                <tr>
                    <td><label class="layui-form-label">address</label></td>
                    <td><input type="text"  class="layui-input" style="width: 300px" name="address" value="${loginuser.address}"></td>
                </tr>
                <tr>
                    <td><label class="layui-form-label">Department</label></td>
                    <td><input type="text"  class="layui-input" style="width: 300px" name="deptid" value="${loginuser.deptid}"></td>
                </tr>
                <tr>
                    <td><label class="layui-form-label">hiredate</label></td>
                    <td><input type="date"  class="layui-input" style="width: 300px" name="hiredate" value="${loginuser.hiredate}"></td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" class="layui-btn layui-btn-normal" name="register" value="Register">
                        <input type="button" class="layui-btn" name="reset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</div>
<!-- end of edit form -->
</body>
</html>