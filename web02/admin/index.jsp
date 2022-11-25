<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../common.css">

<style>
.title { padding-top:36px; padding-bottom:20px; }
#content_row { min-height:calc(100vh - 84px); }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container-fluid" id="content">
<div class="row" id="content_row">
    <%@ include file="admin_sidebar.jsp" %>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

    </main>
  </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>