package org.masis.community.messageboard.domain;

import java.util.Date;

public class MessageBoardDTO {
	
	private int board_num; //게시물번호
	private String board_useremail; //게시물 작성자 이메일
	private String board_username;//게시물 작성자 닉네임
	private int board_like; //게시물 좋아요수 
	private Date board_regdate; //게시물 등록일 ->시간가져와서 몇분전 글 기능구현 위해서 Timestamp로 바꿈 
	private String board_content;//게시물 내용
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_useremail() {
		return board_useremail;
	}
	public void setBoard_useremail(String board_useremail) {
		this.board_useremail = board_useremail;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	
	public String getBoard_content() {
		return board_content;
	}
	public Date getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_username() {
		return board_username;
	}
	public void setBoard_username(String board_username) {
		this.board_username = board_username;
	}
	
	
	
	

}
