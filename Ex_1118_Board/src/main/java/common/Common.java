package common;

public class Common {
	//페이징 처리를 위한 클래스
	
	
	//일반게시판
	public static class Board {
		//한 페이지에 보여줄 게시글 수
		public final static int BLOCKLIST=5;
		
		//하단 페이지 메뉴의 수 
		//<- 1 2 3 4 5->
		public final static int BLOCKPAGE=5;
		
	}
	
	//댓글 페이징
	public static class Comment {
		//한 페이지에 보여줄 댓글 수
		public final static int BLOCKLIST=5;
		
		//하단 페이지 메뉴의 수 
		//<- 1 2 3 4 5->
		public final static int BLOCKPAGE=5;
		
	}
	
	
	
}
