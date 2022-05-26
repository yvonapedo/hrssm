<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="jspresource.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <!--begin to css of page-->
    <style type="text/css">
        body{
            background:#EE7621;
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
            background: #008080;
            padding:20px;
            border: #cccccc solid 1px;
            border-radius:10px;
        }
        tr{
            height: 50px;
        }

        .editbox{
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width:150px;
            height: 23px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top:2px;
            margin-bottom:2px;
            margin-left:10px;
        }

        .orangebuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt; color: #ffffff;
            border: 0px #FF8000 solid;
            background-color:#FF8000;
            cursor: hand;
            font-style: normal ;
            width:80px;
            height:30px;
            border-radius: 5px 5px 5px 5px;
            margin-left:30px;
        }


        .bluebuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt; color: #ffffff;
            border: 0px #81BEF7 solid;
            background-color:#81BEF7;
            cursor: hand;
            font-style: normal ;
            width:80px;
            height:30px;
            border-radius: 5px 5px 5px 5px;
            margin-left:30px;
        }
    </style>
    <!--end of page css-->
    <meta charset="utf-8">
    <title></title>
</head>
<body>
<!-- begin to login form -->
<div style="margin-top: 30px; ">
    <center>
        <img style="width:200px" src="img/pet.png" />
        <form action="../user/login">
            <table >
                <tr>
                    <td>USER ACCOUNT</td>
                    <td><input type="text" class="editbox" name="username"></td>
                </tr>
                <tr>
                    <td>LOGIN PASSWORD</td>
                    <td><input type="password" class="editbox" name="password"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" class="orangebuttoncss" value="LOGIN">
                        <input type="button" class="bluebuttoncss" value="CANCEL">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</div>
<!-- end of  login form -->
</body>
</html>

