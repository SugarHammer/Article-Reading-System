<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>404错误，您所访问的页面不存在！</title>
</head>
<style>
    @charset "utf-8";
    body {
        margin: 0;
        font: 14px/1.5 "Microsoft Yahei", "Hiragino Sans GB", sans-serif;
        background-color: #fff
    }

    a {
        color: #3d3d3d;
        text-decoration: none
    }

    /*错误页面*/
    #errorpage {
        width: 600px;
        text-align: center;
        padding: 80px 0;
        margin: 0 auto;
        height: 360px;
    }

    #errorpage p {
        font-size: 18px;
        font-weight: bold;
        padding-top: 30px;
    }

    #errorpage .bt a {
        background: #fe3a3b;
        padding: 9px 46px 11px;
        *padding: 7px 24px 9px;
        color: #fff;
        border: 0;
        font-size: 14px;
    }

    .errortans {
        margin: 0;
        text-align: left;
        float: left;
        z-index: 5;
        height: 300px;
        position: relative;
        padding: 80px 0 0 24px;
    }

    .errortans p {
        font-weight: normal;
        z-index: 10;
        position: relative;
    }

    .errortans p b {
        font-size: 38px;
    }

    .errortans div {
        margin-top: 30px;
    }

    #errorpage .logo {
        display: inline-block;
        float: left;
        height: 303px;
        width: 256px;
        background: url(../../images/tfans.jpg);
    }

    #errorpage .e404 {
        display: inline-block;
        position: absolute;
        top: -60px;
        left: 145px;;
        height: 164px;
        width: 150px;
    }
</style>

<body>

<div id="errorpage">
    <div class="tfans_error">
        <div class="logo"></div>
        <div class="errortans clearfix">
            <div class="e404"></div>
            <p><b>出错啦！</b></p>

            <p>操作失败!</p>

            <div class="bt"><a href="<c:url value="/"/>">返回首页</a></div>
        </div>
    </div>
</div>


</body>
</html>
