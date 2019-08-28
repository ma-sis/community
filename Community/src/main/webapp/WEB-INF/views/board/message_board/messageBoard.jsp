<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate1" />    
<fmt:formatDate value="${now}" pattern="HH" var="nowDate2" />    
<fmt:formatDate value="${now}" pattern="mm" var="nowDate3" />    


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Pipeline Project Management Bootstrap Theme</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A project management Bootstrap theme by Medium Rare">
    <link href="${pageContext.request.contextPath}/resources/assets/img/favicon.ico" rel="icon" type="image/x-icon">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/theme.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div class="layout layout-nav-side">

<%-- Nav Start --%>
			<jsp:include page="../../include/nav.jsp"></jsp:include>
<%-- Nav End --%>



      <div class="main-container">

        <div class="content-container row">
		<!-- Start:왼쪽레이아웃-->   
	
          <div class="chat-module col-9" data-filter-list="chat-module-body">
            <div class="chat-module-top">
              <form>
                <div class="input-group input-group-round" id="second">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">search</i>
                    </span>
                  </div>
                  <input type="search" class="form-control filter-list-input" placeholder="Search chat" aria-label="Search Chat">
                </div>
              </form>
              
			<!--Start:게시물List -->
		
              <div class="chat-module-body" id="third">
              <div id="top"></div>
				<!--Start:게시물-->
				<c:forEach items="${messageboardList}" var="list">
				<fmt:formatDate value="${list.board_regdate}" pattern="yyyyMMdd" var="regdate1"/> 
				<fmt:formatDate value="${list.board_regdate}" pattern="MM/dd HH:mm" var="regdate4"/> 
				<fmt:formatDate value="${list.board_regdate}" pattern="HH" var="regdate2"/> 
				<fmt:formatDate value="${list.board_regdate}" pattern="mm" var="regdate3"/> 
				
                <div class="media chat-item" >
                  <img alt="Image" src="${pageContext.request.contextPath}/resources/assets/img/profile/default.jpg" class="avatar" />
                  <div class="media-body">
                    <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text">${list.board_username}</span>
                     
                      <span data-filter-by="text">
                      <c:choose>
                      <c:when test="${nowDate1==regdate1}">
                      <c:set var="result" value="${(nowDate2 * 60 + nowDate3) - (regdate2 * 60 + regdate3)}" ></c:set>
                    
                      <c:choose>
							<c:when test="${result <60 and  result != 0}">
							${result}분 전
							</c:when>
							<c:when test="${result == 0}">
							방금 전
							</c:when>							
							<c:otherwise>
							${regdate4}
							</c:otherwise>
                      </c:choose>	                      
                      </c:when>
                      <c:otherwise>
                      ${regdate4}
                      </c:otherwise>
                      </c:choose>
					</span>
                    
                    </div>
                    <div class="chat-item-body" data-filter-by="text">
                      <a class="pb-0 mb-0 text-secondary" href="${pageContext.request.contextPath}/board/messageboard/read/${list.board_num}">${list.board_content}</a>
                    </div>
                     <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text"></span>
                      <span data-filter-by="text " class="text-muted">
                    	<b class="text-primary"><i class="material-icons" style="font-size:15px;">favorite_border</i></b>${list.board_like}
                    	<i class="material-icons" style="font-size:15px;">bookmark_border</i>
                      </span>
                    </div>
                  </div>
                </div>
                </c:forEach>
                <!--End:게시물-->
                
              </div>
			<!--End:게시물List -->              
            </div>
            <div class="chat-module-bottom">
              <form class="chat-form" action="${pageContext.request.contextPath}/board/messageboard/create">
              <div class="row">
                <textarea class="form-control col-11" placeholder="새글을 입력해주세요." rows="1" name="board_content"></textarea>
                <input type="hidden" name="board_useremail" value="min@commu.com">
                <input type="submit" class="col-1 btn btn-outline-primary" value="등록">
                </div>
              </form>
            </div>
          </div>
		<!-- End:왼쪽레이아웃-->

		<!--Start:오른쪽레이아웃 -->
          <div class="sidebar collapse col-3" id="sidebar-collapse">
            <div class="sidebar-content">
              <div class="chat-team-sidebar text-small">
                <div class="chat-team-sidebar-top">
    
                </div>
                <div class="chat-team-sidebar-bottom">
                  <div class="tab-content">
				   인기글 나올 부분
                  </div>
                </div>
              </div>
            </div>
          </div>
		<!-- End:오른레이아웃-->      
		
        </div>

      </div>
    </div>
          <!-- Required vendor scripts (Do not remove) -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.js"></script>

    <!-- Optional Vendor Scripts (Remove the plugin script here and comment initializer script out of index.js if site does not use that feature) -->

    <!-- Autosize - resizes textarea inputs as user types -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/autosize.min.js"></script>
    <!-- Flatpickr (calendar/date/time picker UI) -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/flatpickr.min.js"></script>
    <!-- Prism - displays formatted code boxes -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/prism.js"></script>
    <!-- Shopify Draggable - drag, drop and sort items on page -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/draggable.bundle.legacy.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/swap-animation.js"></script>
    <!-- Dropzone - drag and drop files onto the page for uploading -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/dropzone.min.js"></script>
    <!-- List.js - filter list elements -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/list.min.js"></script>

    <!-- Required theme scripts (Do not remove) -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/theme.js"></script>
	<!--  messageBoard js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/board/message_board/messageBoard.js"></script>
    
</body>
</html>