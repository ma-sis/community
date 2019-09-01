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
							
                <div class="media chat-item" style="cursor: default;" >
                  <img alt="Image" src="${pageContext.request.contextPath}/resources/assets/img/profile/default.jpg" class="avatar mt-1" />
                  <div class="media-body ml-0">
                    <div class="chat-item-title">
                      <span class="chat-item-author" data-filter-by="text">${messageboardone.board_username}</span>
                     
                      <span data-filter-by="text">
						방금전
					</span>
                    
                    </div>
                    <div class="chat-item-body contentview" data-filter-by="text" >
                     ${messageboardone.board_content}
                    </div>
                    
					<!--Start:수정버튼클릭시  show -->
                    <div class="chat-item-body" data-filter-by="text" id="updatetview">
                    <form id="upform" action="${pageContext.request.contextPath}/board/messageboard/update">
 					<textarea class="form-control"  rows="3" name="board_content" id="ftext"></textarea>
 					<input type="hidden" value="${messageboardone.board_num}" name="board_num">
 					 </form>
 					 <button class="float-right btn btn-sm btn-outline-primary mt-1 ml-1" id="freset" >취소</button>
 					 <button class="float-right btn btn-sm btn-outline-primary mt-1" id="fupbtn" >수정</button>
                    </div>
                    <!--End:수정버튼클릭시  show -->
                    
                     <div class="chat-item-title contentview">
                      <span class="chat-item-author" data-filter-by="text"></span>
                      <span data-filter-by="text " class="text-muted">
                    	<b class="text-primary"><i class="material-icons" style="font-size:15px;">favorite_border</i></b>${messageboardone.board_like}
                    	<i class="material-icons" style="font-size:15px;">bookmark_border</i>
                      </span>
                    </div>
                      <c:if test="${sessionScope.mdto.email == messageboardone.board_useremail}">
                      <div class="chat-item-title contentview">
                      <span class="chat-item-author" data-filter-by="text"></span>
                      <span data-filter-by="text " class="text-muted">
                    	 <a id="upbtn" style="cursor: pointer;">[수정]</a>
                    	 <a id="delbtn" style="cursor: pointer;">[삭제]</a>
                      </span>
                    </div>                   
                    </c:if>
                    
                  </div>
                </div>
		 </div>
		 
		<!--Start:댓글목록부분 -->
		 <div style="overflow: auto;  height: 500px;" class="border bg-light" >
	
			<div id="top"></div>
			<c:forEach items="${comments}" var="list">
                <div class="media chat-item border" >
                  <img alt="Image" src="${pageContext.request.contextPath}/resources/assets/img/profile/default.jpg" class="avatar mt-1" />
                  <div class="media-body ml-0 bg-light">
                    <div class="chat-item-title">
                     <span class="chat-item-author" data-filter-by="text">${list.comment_username}</span>
	                 <span data-filter-by="text">
                   <fmt:formatDate value="${list.comment_regdate}" pattern="MM/dd HH:mm" var="regdate"/> 
						${regdate}
					</span>
                    
                    </div>
                    <div class="chat-item-body" data-filter-by="text">
					${list.comment_contents}
                    </div>
 
                  </div>
                </div>
                </c:forEach>
	
		 </div>
		<!--End:댓글목록부분 -->		 
		 
		 <div class="border ">
		 <form id="frm">
		 <div class="row">
		 <input type="text" class="form-control col-11"  placeholder="댓글을 입력하세요." name="comment_contents">
		 <input type="hidden" name="board_num" value="${messageboardone.board_num}">
		 <input type="hidden" name="comment_useremail" value="${sessionScope.mdto.email}">
		 <input type="hidden" name="comment_username" value="${sessionScope.mdto.name}">
		 <button  class="btn btn-outline-primary col-1" id="regbtn">등록</button>
		 </div>
		 </form>
		 </div>
				
          </div>
		<!-- End:왼쪽레이아웃-->



		<!--Start:오른쪽레이아웃 -->
          <div class="sidebar collapse col-lg-3" id="sidebar-collapse">
               	<!-- Start:알림창 -->
		<div class="popupunder alert alert-success fade in">
		<button type="button" class="close close-sm" data-dismiss="alert">
		<i class="glyphicon glyphicon-remove"></i>
		</button>
		<strong>${msg}</strong>
		</div>
		<!-- End:알림창 -->	
          
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

<script type="text/javascript">
$(function(){
	
	$("#updatetview").hide(); //수정하는 부분 숨김
	
	$("#upbtn").on("click",function(){//수정버튼선택시
	
		$(".contentview").hide(); //게시물목록 숨김	
		$("#updatetview").show(); //수정하는 부분 보여줌
		 $("#ftext").val("${messageboardone.board_content}");
		 $("#ftext").focus();
		
	});
	
	$("#delbtn").on("click",function(){ //삭제버튼선택시 
		
	       if(confirm("삭제하시겠습니까?") == true){
	    	   location.href="${pageContext.request.contextPath}/board/messageboard/delete/${messageboardone.board_num}";
	        }
	        else{
	            return ;
	        }
	});
	
	$("#fupbtn").on("click",function(){ //수정완료버튼선택시 
		
	       if(confirm("수정하시겠습니까?") == true){
	    	   $("#upform").submit();
	        }
	        else{
	            return ;
	        }
	});
	
	$("#freset").on("click",function(){ //수정버튼취소클릭시
		
		
	       if(confirm("취소하시했습니까?") == true){
	    	   $("#updatetview").hide();
	    	   $(".contentview").show();
	    	   $("#ftext").val("${messageboardone.board_content}");
	        }
	        else{
	            return ;
	        }
		
		
	});
	
	
	
});
</script>

<!--     잠시 -->
    <script type="text/javascript">
    
    function getcomments(){
    	
    $.getJSON("${pageContext.request.contextPath}/board/messageboard/readcomments/${messageboardone.board_num}",function(data){
    	
    	  $(data).each(function(){
    		  console.log(data);
    	  });

   		 });	
   	 	
    }
    
    
    if(${msg !=null}){
        $('.popovers').popover();
        window.setTimeout(function() {
        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
        $(this).remove(); 
        });
        // 500 : Time will remain on the screen
        }, 500);
        }
    
    
    $(function(){
    	
    	getcomments();
//     	$("#regbtn").on("click",function(){
    		
//     		 $.ajax({
//     	            url: "/board/messageboard/createcomment",
//     	            type: "POST",
//     	            data: $("#frm").serialize(),
//     	            success: function(data){

//     	            alert("성공@");
//     	            },
//     	            error: function(){
//     	                alert("serialize err");
//     	            }
//     	        });
    		
//     	});
    	
    });
    </script>
<!--     잠시 -->
</body>
</html>