<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.*, service.*, impl.*, controller.*"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>HRM</title>
    <link rel="stylesheet" href="../res/layui/css/layui.css">
    <link rel="stylesheet" href="../res/css/main.css">
    <style>
        .layui-btn-normal{
            background-color: #2d3b91;
        }
    </style>
</head>
<body>

<script src="../res/layui/layui.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'element', 'form'], function(){
        var layer = layui.layer,
            form = layui.form,
            element = layui.element;


    });
</script>
</body>
</html>
