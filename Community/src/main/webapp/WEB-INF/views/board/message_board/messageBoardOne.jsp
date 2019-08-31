<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    
    <style>
/* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
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

		 <div class="col-lg-9 pr-0">
		 <div class="border">
			<h2 class="pt-2 pb-2 pl-2 pr-2"> 자유게시판</h2>
		 </div>
		 <div class="border">
							
                <div class="media chat-item " >
                  <img alt="Image" src="${pageContext.request.contextPath}/resources/assets/img/profile/default.jpg" class="avatar mt-1" />
                  <div class="media-body ml-0">
                    <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text">${messageboardone.board_username}</span>
                     
                      <span data-filter-by="text">
방금전
					</span>
                    
                    </div>
                    <div class="chat-item-body" data-filter-by="text">
                      <a class="pb-0 mb-0 text-secondary" href="${pageContext.request.contextPath}/board/messageboard/read/${messageboardone.board_num}">${messageboardone.board_content}</a>
                    </div>
                     <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text"></span>
                      <span data-filter-by="text " class="text-muted">
                    	<b class="text-primary"><i class="material-icons" style="font-size:15px;">favorite_border</i></b>${messageboardone.board_like}
                    	<i class="material-icons" style="font-size:15px;">bookmark_border</i>
                      </span>
                    </div>
                  </div>
                </div>
		
		 </div>
		 
		 <div style="overflow: auto;  height: 500px;" class="border bg-light" >
	
	
	
<!-- 	잠시 -->
<div id="top"></div>

                <div class="media chat-item border" >
                  <img alt="Image" src="${pageContext.request.contextPath}/resources/assets/img/profile/default.jpg" class="avatar mt-1" />
                  <div class="media-body ml-0 bg-light">
                    <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text">${messageboardone.board_username}</span>
                     
                      <span data-filter-by="text">
방금전
					</span>
                    
                    </div>
                    <div class="chat-item-body" data-filter-by="text">
                      <a class="pb-0 mb-0 text-secondary" href="${pageContext.request.contextPath}/board/messageboard/read/${messageboardone.board_num}">${messageboardone.board_content}</a>
                    </div>
 
                  </div>
                </div>
                                <div class="media chat-item border" >
    <img alt="Image" src="${pageContext.request.contextPath}/resources/assets/img/profile/default.jpg" class="avatar mt-1" />                  <div class="media-body ml-0 bg-light">
                    <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text">${messageboardone.board_username}</span>
                     
                      <span data-filter-by="text">
방금전
					</span>
                    
                    </div>
                    <div class="chat-item-body" data-filter-by="text">
                      <a class="pb-0 mb-0 text-secondary" href="${pageContext.request.contextPath}/board/messageboard/read/${messageboardone.board_num}">${messageboardone.board_content}</a>
                    </div>
 
                  </div>
                </div>
                                <div class="media chat-item border" >
                  <img alt="Image" src="${pageContext.request.contextPath}/resources/assets/img/profile/default.jpg" class="avatar" />
                  <div class="media-body ml-0 bg-light">
                    <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text">${messageboardone.board_username}</span>
                     
                      <span data-filter-by="text">
방금전
					</span>
                    
                    </div>
                    <div class="chat-item-body" data-filter-by="text">
                      <a class="pb-0 mb-0 text-secondary" href="${pageContext.request.contextPath}/board/messageboard/read/${messageboardone.board_num}">${messageboardone.board_content}</a>
                    </div>
 
                  </div>
                </div>
                                <div class="media chat-item border" >
                  <img alt="Image" src="${pageContext.request.contextPath}/resources/assets/img/profile/default.jpg" class="avatar" />
                  <div class="media-body ml-0 bg-light">
                    <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text">${messageboardone.board_username}</span>
                     
                      <span data-filter-by="text">
방금전
					</span>
                    
                    </div>
                    <div class="chat-item-body" data-filter-by="text">
                      <a class="pb-0 mb-0 text-secondary" href="${pageContext.request.contextPath}/board/messageboard/read/${messageboardone.board_num}">${messageboardone.board_content}</a>
                    </div>
 
                  </div>
                </div>
	
<!-- 	잠시 -->
		 </div>
		 <div class="border ">
		 <form>
		 <div class="row">
		 <input type="text" class="form-control col-11"  placeholder="댓글을 입력하세요." >
		 <button type="submit" class="btn btn-outline-primary col-1">등록</button>
		</div>
		 </form>
		 </div>
				
          </div>
		<!-- End:왼쪽레이아웃-->

		<!--Start:오른쪽레이아웃 -->
          <div class="sidebar collapse col-lg-3" id="sidebar-collapse">
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