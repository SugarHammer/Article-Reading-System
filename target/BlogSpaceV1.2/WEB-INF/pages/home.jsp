<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员登录</title>
    <jsp:include page="commons/style.jsp"/>
</head>
<body class="login_bg">
<section class="loginBox">
    <header class="loginHeader">
        <h1>校园阅读系统</h1>
    </header>
    <section class="loginCont">
        <form class="loginForm" action="<c:url value="/actions/login/admin"/>" method="post" >
            <div class="inputbox">
                <label for="user">用户名：</label>
                <input id="user" type="text" name="loginName" placeholder="请输入用户名" required/>
            </div>
            <div class="inputbox">
                <label for="mima">密码：</label>
                <input id="mima" type="password" name="password" placeholder="请输入密码" required/>
            </div>
            <div class="subBtn">
                <input type="submit" value="登录"/>
                <input type="reset" value="重置"/>
            </div>

        </form>
    </section>
</section>
</body>
</html>
