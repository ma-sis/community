<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                      <span class="chat-item-author" data-filter-by="text">익명</span>
                      <span data-filter-by="text">
                      <fmt:formatDate value="${messageboardone.board_regdate}" pattern="yyyy-MM-dd HH:mm" var="regdate"/> 
					${regdate}
					</span>
                    
                    </div>
                      <%
      					pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
    					pageContext.setAttribute("br", "<br/>"); //br 태그
					%> 
                    <c:set var="conresult" value="${fn:replace(messageboardone.board_content, crcn, br)}" />
                    <div class="chat-item-body contentview" data-filter-by="text" id="conr" >${conresult}</div>
                    <div class="chat-item-body contentview" data-filter-by="text" id="conr2" style="display: none;" >${messageboardone.board_content}</div>
                    
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
			<div id="commentdiv"></div>
	
		 </div>
		<!--End:댓글목록부분 -->		 
		 <div class="border ">
		 <form id="frm" method="post">
		 <div class="row" id="commentform">
		 <input type="text" class="form-control col-11 "  placeholder="댓글을 입력하세요." name="comment_contents" id="comment_contents">
		 <input type="hidden" name="board_num" value="${messageboardone.board_num}">
		 <input type="hidden" name="comment_useremail" value="${sessionScope.mdto.email}">
		 <input type="hidden" name="comment_username" value="${sessionScope.mdto.name}">
		 <button  class="btn btn-outline-primary col-1" id="regbtn">등록</button>
		 </div>
		 </form>
		 
		<!--Start:댓글수정부분 -->
		<form id="frm2" method="post">
		 <div class="row" id="upcomment">
		  <input type="hidden" name="comment_num" value="" id="comment_num">
		  <input type="text" class="form-control col-10 commentform" name="comment_contents" id="comment_contentsu">
		  <button  class="btn btn-outline-primary col-1 commentform" id="frm2upbtn">수정</button>
		  <button  class="btn btn-outline-primary col-1 commentform" id="frm2rebtn">취소</button>
		</div>
		</form>
		<!--End:댓글수정부분 -->
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

	function getcomments(){ //전체 댓글 list 
    
    $.getJSON("${pageContext.request.contextPath}/board/messageboard/readcomments/${messageboardone.board_num}",function(data){
       
       var str="";
       
         $(data).each(function(){
        	 var loginemail="${sessionScope.mdto.email}";
        	 
        	 var regdate= new Date(this.comment_regdate);
        	 str+= "<div class='media chat-item border mb-0 pb-0 mt-0 pt-0 bg-light'>"+
           "<img alt='Image' src='${pageContext.request.contextPath}/resources/assets/img/profile/default.jpg' class='avatar mt-1' />"+
            "<div class='media-body ml-0 bg-light'>"+
              "<div class='chat-item-title'><span class='chat-item-author' data-filter-by='text'>"+
              	"익명"+"</span>"+
              "<span data-filter-by='text'>"+
              (regdate.getMonth() + 1)+"/"+regdate.getDate()+" "+ regdate.getHours()+":"+regdate.getMinutes()+"</span></div>"+
              "<div class='chat-item-body' data-filter-by='text'>"+this.comment_contents;
              if(this.comment_useremail == loginemail){
            	  var convar=String(this.comment_contents);
            	  var comment_num=this.comment_num;
 				str+="<span class='float-right' style='cursor: pointer;'><a id='comupbtn' onclick='fnupcom("+comment_num+",\""+convar+"\");'>[수정]</a><a id='comdelbtn' onclick='fndelcom("+this.comment_num+");'>[삭제]</a></span>";
 				
 				
         }
        	 
        	str+="</div></div></div>";
         }
            );
         $("#commentdiv").html(str);
          });   
          
    }  


	if(${msg !=null}){ //메시지창
	    $('.popovers').popover();
	    window.setTimeout(function() {
	    $(".alert").fadeTo(2000, 500).slideUp(500, function(){
	    $(this).remove(); 
	    });
	    }, 500);
	    }

$(function(){
	
		getcomments(); //전체 댓글 목록불러오기
		$("#updatetview").hide(); //수정하는 부분 숨김
		$("#upcomment").hide();//댓글수정하는 부분 숨김
		$("#upbtn").on("click",function(){//수정버튼선택시
	
		$(".contentview").hide(); //게시물목록 숨김	
		$("#updatetview").show(); //수정하는 부분 보여줌
		
		 $("#ftext").val($("#conr2").text());
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
	    	   $("#ftext").val("$(conresult2)");
	        }
	        else{
	            return ;
	        }
		
		
	});
	
	   $("#regbtn").on("click", function(){ //댓글작성
		   
		   if($("#comment_contents").val()==null || $("#comment_contents").val()==""){
	    		alert("내용을 입력해주세요");
	    		$("#comment_contents").focus();
	    	}else{
		   
	        $.ajax({
	            url: "${pageContext.request.contextPath}/board/messageboard/createcomment",
	            type: "POST",
	            data: $("#frm").serialize(),
	            success: function(data){
	            	
	            	getcomments();
	            
	            },
	            error: function(){
	                alert("serialize err");
	            }
	        });
	    	}
	    });
	   
	   $("#frm2rebtn").on("click",function(){ //댓글수정시 취소버튼눌렀을경우
		   
	   		$("#commentform").show();		
			$("#upcomment").hide();
	   });
	   
	   $("#frm2upbtn").on("click",function(){//댓글수정시 수정버튼눌렀을경우
		   
		   
	        $.ajax({
	            url: "${pageContext.request.contextPath}/board/messageboard/updatecomment",
	            type: "POST",
	            data: $("#frm2").serialize(),
	            success: function(data){
	            	
	            	getcomments();
	            
	            },
	            error: function(){
	                alert("serialize err");
	            }
	        });
		   
	   });
	
	
	
});

	function fndelcom(comment_num){ //댓글삭제클릭시
	
	       if(confirm("댓글을 삭제하시겠습니까?") == true){
	    	  
		        $.ajax({
		            url: "${pageContext.request.contextPath}/board/messageboard/deletecomment/"+comment_num,
		            type: "POST",
		            success: function(data){
		            	
		            	getcomments();
		            
		            },
		            error: function(){
		                alert("댓글삭제 오류");
		            }
		        });
	    	  
	        }
	        else{
	            return ;
	        }
	}

	function fnupcom(comment_num,comment_contents){ //댓글수정클릭시
		
		$("#commentform").hide();		
		$("#upcomment").show();
		$("#comment_num").val(comment_num);
		$("#comment_contentsu").val(comment_contents);
		$("#comment_contentsu").focus();
	}
	
	
</script>

</body>
</html>