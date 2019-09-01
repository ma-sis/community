package org.masis.community.messageboard.domain;

import java.util.Date;

//자유게시판 댓글
public class MessageboradCommentsDTO {
	
	private int board_num; //게시물번호
	private String comment_useremail; //댓글작성자 이메일 
	private int comment_num; //댓글번호 
	private Date comment_regdate; //댓글 작성일 
	private String comment_username; //댓글작성자 닉네임
	private String comment_contents; //댓글내용
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getComment_useremail() {
		return comment_useremail;
	}
	public void setComment_useremail(String comment_useremail) {
		this.comment_useremail = comment_useremail;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public Date getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(Date comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	public String getComment_username() {
		return comment_username;
	}
	public void setComment_username(String comment_username) {
		this.comment_username = comment_username;
	}
	public String getComment_contents() {
		return comment_contents;
	}
	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
	}
	
	
	
	
	

}
