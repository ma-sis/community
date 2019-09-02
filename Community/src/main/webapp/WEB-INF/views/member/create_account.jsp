<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Gather projects-Create Account</title>
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
              <h1 class="h2">Create account</h1>
              <p class="lead">Start doing things for free, in an instant</p>
              
              <form action="${context}/member/signUp.do" method="post">
                <div class="form-group row">
                  <input class="form-control col-lg-8 ml-2" type="email" placeholder="Email Address" id="email" name="email" autocomplete="email" required="required"/>
                  <button class="btn btn-block btn-primary col-lg-3 mx-2" type="button">메일 인증</button>
                  <div class="text-left ml-2" id="emailErr">
                    <small class="text-danger"></small>
                  </div>
                </div>
                <div class="form-group row" id="auth">
                  <input class="form-control col-lg-8 ml-2" type="text" placeholder="인증 번호" id="emailAuthNum"/>
                  <button class="btn btn-block btn-info col-lg-3 mx-2" type="button">인증 확인</button>
                  <div class="text-left ml-2" id="authErr">
                    <small class="text-danger">인증번호가 다릅니다. 다시 시도해주세요.</small>
                  </div>
                </div>
                <div class="form-group row">
                  <input class="form-control col-lg-8 ml-2" type="text" placeholder="User Name" id="name" name="name" autocomplete="name" maxlength="10"/>
                  <button class="btn btn-block btn-primary col-lg-3 mx-2" type="button">중복 확인</button>
                  <div class="text-left" id="nameErr">
                    <small class="text-danger"></small>
                  </div>
                </div>
                <div class="form-group">
                  <input class="form-control" type="text" placeholder="Phone Number" id="phone" name="phone" autocomplete="tel" maxlength="13"/>
                  <div class="text-left" id="phoneErr">
                    <small class="text-danger">휴대전화 번호를 입력해 주세요</small>
                  </div>
                </div>
                <div class="form-group">
                  <input class="form-control mb-1" type="password" placeholder="Password" id="pwd" name="pwd" autocomplete="new-password"/>
                  <input class="form-control" type="password" placeholder="Password Check" id="pwd2" autocomplete="new-password"/>
                  <div class="text-left" id="pwdErr">
                    <small class="text-danger">영문/숫자/특수문자 혼합하여 8자이상 20글자 이하</small>
                  </div>
                </div>
                <button class="btn btn-lg btn-block btn-primary" role="button" type="submit">
                  Create account
                </button>
                <small>By clicking 'Create Account' you agree to our <a href="#">Terms of Use</a>
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
	
	<!-- Page js -->
	<script type="text/javascript" src="${context}/resources/assets/js/member/join.js"></script>

  </body>
</html>