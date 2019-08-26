<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>gather projects-login</title>
	<c:set var="context" value="${pageContext.request.contextPath }"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A project management Bootstrap theme by Medium Rare">
    <link href="${context}/resources/assets/img/favicon.ico" rel="icon" type="image/x-icon">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">
    <link href="${context}/resources/assets/css/theme.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
    <div class="main-container fullscreen">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-5 col-lg-6 col-md-7">
            <div class="text-center">
              <h1 class="h2">Welcome Back &#x1f44b;</h1>
              <p class="lead">Log in to your account to continue</p>
              <form method="post" action="${context}/member/login.do">
                <div class="form-group">
                  <input class="form-control" type="email" placeholder="Email Address" name="email"/>
                </div>
                <div class="form-group">
                  <input class="form-control" type="password" placeholder="Password" name="pwd"/>
                  <div class="text-right">
                    <small><a href="#">Forgot password?</a>
                    </small>
                  </div>
                </div>
                <button class="btn btn-lg btn-block btn-primary" role="button" type="submit">
                  Log in
                </button>
                <small>Don't have an account yet? <a href="#">Create one</a>
                </small>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Required vendor scripts (Do not remove) -->
    <script type="text/javascript" src="${context}/resources/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${context}/resources/assets/js/popper.min.js"></script>
    <script type="text/javascript" src="${context}/resources/assets/js/bootstrap.js"></script>

    <!-- Optional Vendor Scripts (Remove the plugin script here and comment initializer script out of index.js if site does not use that feature) -->

    <!-- Autosize - resizes textarea inputs as user types -->
    <script type="text/javascript" src="${context}/resources/assets/js/autosize.min.js"></script>
    <!-- Flatpickr (calendar/date/time picker UI) -->
    <script type="text/javascript" src="${context}/resources/assets/js/flatpickr.min.js"></script>
    <!-- Prism - displays formatted code boxes -->
    <script type="text/javascript" src="${context}/resources/assets/js/prism.js"></script>
    <!-- Shopify Draggable - drag, drop and sort items on page -->
    <script type="text/javascript" src="${context}/resources/assets/js/draggable.bundle.legacy.js"></script>
    <script type="text/javascript" src="${context}/resources/assets/js/swap-animation.js"></script>
    <!-- Dropzone - drag and drop files onto the page for uploading -->
    <script type="text/javascript" src="${context}/resources/assets/js/dropzone.min.js"></script>
    <!-- List.js - filter list elements -->
    <script type="text/javascript" src="${context}/resources/assets/js/list.min.js"></script>

    <!-- Required theme scripts (Do not remove) -->
    <script type="text/javascript" src="${context}/resources/assets/js/theme.js"></script>
	
	<script type="text/javascript">
		var referer = "community/index.do"
		alert(document.referrer);
	</script>
  </body>
</html>