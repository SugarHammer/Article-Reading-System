<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/css/public.css"/>"/>
    <style type="text/css">
        .pagination {
            display: inline-block;
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px
        }

        .pagination > li {
            display: inline
        }

        .pagination > li > a, .pagination > li > span {
            position: relative;
            float: left;
            padding: 6px 12px;
            margin-left: -1px;
            line-height: 1.42857143;
            color: #337ab7;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd
        }

        .pagination > li:first-child > a, .pagination > li:first-child > span {
            margin-left: 0;
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px
        }

        .pagination > li:last-child > a, .pagination > li:last-child > span {
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px
        }

        .pagination > li > a:focus, .pagination > li > a:hover, .pagination > li > span:focus, .pagination > li > span:hover {
            z-index: 2;
            color: #23527c;
            background-color: #eee;
            border-color: #ddd
        }

        .pagination > .active > a, .pagination > .active > a:focus, .pagination > .active > a:hover, .pagination > .active > span, .pagination > .active > span:focus, .pagination > .active > span:hover {
            z-index: 3;
            color: #fff;
            cursor: default;
            background-color: #337ab7;
            border-color: #337ab7
        }

        .pagination > .disabled > a, .pagination > .disabled > a:focus, .pagination > .disabled > a:hover, .pagination > .disabled > span, .pagination > .disabled > span:focus, .pagination > .disabled > span:hover {
            color: #777;
            cursor: not-allowed;
            background-color: #fff;
            border-color: #ddd
        }

    </style>
</head>
</html>
