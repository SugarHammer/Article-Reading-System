<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<header>

    <nav>
        <ul>
            <li style="font-size: 30px;margin-right: 5vw"><a href="<c:url value="/"/> ">校园阅读系统</a></li>
            <li><a href="<c:url value="/"/> ">网站首页</a></li>
            <li><a href="<c:url value="/actions/home"/> ">后台管理中心</a></li>
<%--            <li><a href="/">文章导航</a></li>--%>
<%--            <li><a href="/">留言</a></li>--%>
            <c:if test="${account!=null}">
                <li>
                    <a href="<c:url value="/actions/article/myBlogSpace"/> ">个人中心</a>
                </li>
            </c:if>

            <li>
                <c:choose>
                    <c:when test="${account==null}">
                        <a href="<c:url value="/actions/security/login"/> ">登录</a>
                    </c:when>
                    <c:otherwise>
                        <a href="#">${account.nickname},欢迎你</a>
                    </c:otherwise>
                </c:choose>
            </li>

            <li>
                <c:choose>
                    <c:when test="${account==null}">
                        <a href="<c:url value="/actions/security/register"/> ">注册</a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="/actions/article/postedit"/> ">写文章</a>
                    </c:otherwise>
                </c:choose>
            </li>

            <c:if test="${account!=null}">
                <li><a href="<c:url value="/actions/home/logout"/> ">退出</a></li>
            </c:if>
        </ul>
    </nav>
</header>
<body>

</body>
</html>
