<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>校园阅读系统</title>
    <jsp:include page="../commons/style.jsp"/>
    <jsp:include page="../commons/header.jsp"/>
</head>
<body>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <nav>
                <ul class="list">
                    <c:forEach items="${menus}" var="menu">
                        <li>
                            <a href="<c:url value="${menu.uri}"/>">${menu.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="#">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="nickname">用户昵称：</label>
                    <input type="text" name="nickname" id="nickname" value="${account.nickname}" readonly/>
                    <span>*请输入用户昵称</span>
                </div>
                <div>
                    <label for="loginName">登录帐号：</label>
                    <input type="text" name="loginName" id="loginName" value="${account.loginName}" readonly/>
                    <span >*请输入登录帐号</span>
                </div>
                <div>
                    <label for="idCard">身份证：</label>
                    <input type="text" name="idCard" id="idCard" value="${account.idCard}" required/>
                    <span>*请输入身份证</span>

                </div>
                <div>
                    <label for="cellPhone">手机号：</label>
                    <input type="text" name="cellPhone" id="cellPhone" value="${account.cellPhone}" required/>
                    <span>*请输入手机号</span>
                </div>

                <div>
                    <label for="enabled">是否可用：</label>
                    <select id="enabled" name="enabled">
                        <c:if test="${account.enabled}">
                            <option value="true" selected>可用</option>
                            <option value="false">不可用</option>
                        </c:if>
                        <c:if test="${!account.enabled}">
                            <option value="true" >可用</option>
                            <option value="false" selected>不可用</option>
                        </c:if>
                    </select>
                    <span>*请选择是否可用</span>
                </div>

                <div class="providerAddBtn">
                    <input type="button" value="保存" onclick= "return formSubmit()"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>

    </div>
</section>
<jsp:include page="../commons/footer.jsp"/>
</body>

<script type="text/javascript" >
    function formSubmit(){
        var nickname = $("#nickname").val();
        var loginName = $("#loginName").val();
        var idCard = $("#idCard").val();
        var cellPhone = $("#cellPhone").val();

        var enabled = $("#enabled").val();

        if (nickname == '' || nickname == null) {
            window.alert("请输昵称！");//
            return ;
        }
        if (loginName == '' || loginName == null) {
            window.alert("请输入登录帐号名！");//
            return ;

        }
        if (idCard == '' || idCard == null) {
            window.alert("请输入身份证号码！");//
            return ;
        }
        if (cellPhone == '' || cellPhone == null) {
            window.alert("请输入手机号码！");//
            return ;
        }

        if (enabled == '' || enabled == null) {
            window.alert("请选择是否可用！");//
            return ;
        }

        var varJson = {
            "nickname": nickname, "loginName": loginName,
            "idCard": idCard, "cellPhone": cellPhone,
            "enabled": enabled
        };

        $.ajax(
                {
                    type: "post",
                    url: "<c:url value="/actions/security/updateSubmit"/>",
                    dataType: 'json',
                    data: varJson,
                    success: function (data) {
                        if (data.success) {
                            window.alert("更新成功");
                            window.location.href = "<c:url value="/actions/accountManager"/>";
                        } else {
                            window.alert("更新用户失败");
                        }
                    },
                    error: function () {
                        window.alert("更新用户出现错误！");
                    }
                });
    }



</script>
</html>
