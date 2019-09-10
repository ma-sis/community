<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    <style type="text/css">
.popupunder{
    width: 300px;
	position:fixed;
	top: 10px;
	right: 10px;
	z-index: 10;
	border: 0;
	padding: 20px;
}
.popupunder.alert-success{
    border: 1px solid #198b49;
	background:#27AE60;
	color:#fff;
}
.popupunder .close{
	font-size: 10px;
	position:absolute !important;
	right: 2px;
	top: 3px;
}
    </style>
</head>
<body>
<div class="layout layout-nav-side">

<%-- Nav Start --%>
			<jsp:include page="../../include/nav.jsp"></jsp:include>
<%-- Nav End --%>


      <div class="main-container">

        <div class="content-container row">
		<!-- Start:왼쪽레이아웃    -->
		<!-- Start:알림창 -->
		<div class="popupunder alert alert-success fade in">
		<button type="button" class="close close-sm" data-dismiss="alert">
		<i class="glyphicon glyphicon-remove"></i>
		</button>
		<strong>${msg}</strong>
		</div>
		<!-- End:알림창 -->	
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
                <div class="media chat-item" >
                  <img alt="Image" src="${pageContext.request.contextPath}/resources/assets/img/profile/default.jpg" class="avatar" />
                  <div class="media-body">
                    <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text">익명</span>
                     
                      <span data-filter-by="text" class="dateresult">
                       <jsp:useBean id="now" class="java.util.Date" />
					   <fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate1" />   
                       <fmt:formatDate value="${list.board_regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="regdate"/> 
                       <fmt:formatDate value="${list.board_regdate}" pattern="yyyyMMdd" var="regdate1"/> 
                       <fmt:formatDate value="${list.board_regdate}" pattern="MM/dd HH:mm" var="regdate2"/> 
					   
					   <c:choose>
					    <c:when test="${nowDate1==regdate1}">
                      	<time class="timeago" datetime="${regdate}">${regdate4}</time>
					    </c:when>
					    <c:otherwise>
					    ${regdate2} 
					    </c:otherwise> 
                      </c:choose>
                    
						</span>
                    
                    </div>
                    <div class="chat-item-body" data-filter-by="text">
                                          <%
      					pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
    					pageContext.setAttribute("br", "<br/>"); //br 태그
					%> 
                    <c:set var="conresult" value="${fn:replace(messageboardone.board_content, crcn, br)}" />
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
              <form class="chat-form" action="${pageContext.request.contextPath}/board/messageboard/create" onsubmit="return fncontentcheck();">
              <div class="row">
                <textarea class="form-control col-11" placeholder="새글을 입력해주세요." rows="1" name="board_content" id="board_content"></textarea>
                <input type="hidden" name="board_useremail">
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
    
    <!-- jquery.timeago JavaScript -->
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery.timeago.js"></script>

<!--     잠시 -->
    <script type="text/javascript">
    
    jQuery(document).ready(function() { //게시물 시간  plug in
        $("time.timeago").timeago();
      });
    
    if(${msg !=null}){
        $('.popovers').popover();
        window.setTimeout(function() {
        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
        $(this).remove(); 
        });
        // 500 : Time will remain on the screen
        }, 500);
        }
    
    function fncontentcheck(){
    	if($("#board_content").val()==null || $("#board_content").val()==""){
    		alert("내용을 입력해주세요");
    		$("#board_content").focus();
    		return false;
    	}else true;
    	
    }
    

    
    </script>
<!--     잠시 -->
</body>
</html>