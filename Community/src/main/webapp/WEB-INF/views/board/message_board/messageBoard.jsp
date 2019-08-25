<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        <div class="content-container">
        
<!--           왼쪽레이아웃 시작 -->        
          <div class="chat-module" data-filter-list="chat-module-body">
            <div class="chat-module-top">
              <form>
                <div class="input-group input-group-round">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">search</i>
                    </span>
                  </div>
                  <input type="search" class="form-control filter-list-input" placeholder="Search chat" aria-label="Search Chat">
                </div>
              </form>
              <div class="chat-module-body">

                <div class="media chat-item">
                  <img alt="Claire" src="${pageContext.request.contextPath}/resources/assets/img/avatar-female-1.jpg" class="avatar" />
                  <div class="media-body">
                    <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text">Claire</span>
                      <span data-filter-by="text">4 days ago</span>
                    </div>
                    <div class="chat-item-body" data-filter-by="text">
                      <p>Hey guys, just kicking things off here in the chat window. Hope you&#39;re all ready to tackle this great project. Let&#39;s smash some Brand Concept &amp; Design!</p>

                    </div>

                  </div>
                </div>

                <div class="media chat-item">
                  <img alt="Peggy" src="${pageContext.request.contextPath}/resources/assets/img/avatar-female-2.jpg" class="avatar" />
                  <div class="media-body">
                    <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text">Peggy</span>
                      <span data-filter-by="text">4 days ago</span>
                    </div>
                    <div class="chat-item-body" data-filter-by="text">
                      <p>Nice one <a href="#">@Claire</a>, we&#39;ve got some killer ideas kicking about already.
                        <img src="https://media.giphy.com/media/aTeHNLRLrwwwM/giphy.gif" alt="alt text" title="Thinking">
                      </p>
                    </div>
                  </div>
                </div>

                <div class="media chat-item">
                  <img alt="Ravi" src="${pageContext.request.contextPath}/resources/assets/img/avatar-male-3.jpg" class="avatar" />
                  <div class="media-body">
                    <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text">Ravi</span>
                      <span data-filter-by="text">3 days ago</span>
                    </div>
                    <div class="chat-item-body" data-filter-by="text">
                      <h1>&#x1f609;</h1>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="chat-module-bottom">
              <form class="chat-form" action="">
              <div class="row">
                <textarea class="form-control col-11" placeholder="새글을 입력해주세요." rows="1"></textarea>
                <input type="hidden" name="" value="">
                <input type="submit" class="col-1 btn btn-outline-primary" value="등록">
                </div>
              </form>
            </div>
            
          </div>
<!--           왼쪽레이아웃 끝 -->

<!--           오른쪽레이아웃 시작 -->
          <div class="sidebar collapse" id="sidebar-collapse">
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
<!--           오른쪽레이아웃 끝 -->          
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
</body>
</html>