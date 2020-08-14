package com.kh.chickenPeople.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.chickenPeople.board.model.exception.BoardException;
import com.kh.chickenPeople.board.model.service.BoardService;
import com.kh.chickenPeople.board.model.vo.Board;
import com.kh.chickenPeople.board.model.vo.Picture;
import com.kh.chickenPeople.common.Pagination;
import com.kh.chickenPeople.member.model.vo.Member;
import com.kh.chickenPeople.notice.model.exception.NoticeException;
import com.kh.chickenPeople.reply.model.service.ReplyService;
import com.kh.chickenPeople.reply.model.vo.ReReply;
import com.kh.chickenPeople.reply.model.vo.Reply;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Controller
public class BoradContoller {
	
	@Autowired 
	BoardService boardService;
	
	@Autowired
	ReplyService replyService;
	
	@RequestMapping("boardList.do")
	public ModelAndView boardList(ModelAndView mv,
						@RequestParam(value="page",required=false)Integer page) { 
		
		
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		int listCount = boardService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Board> selectTotalBoardList=boardService.selectTotalBoardList(pi);
		
//		System.out.println("selectTotalBoardList"+selectTotalBoardList);
		
		if(selectTotalBoardList!=null) {
			mv.addObject("boardList",selectTotalBoardList);
			mv.addObject("pi",pi);
			mv.setViewName("board/boardListView");
			
		}else {
			throw new NoticeException("게시판 목록보기 실패");
		}
		
		return mv;
	}
	
	
	@RequestMapping("bdetail.do")
	public String boardDetail() {

	return "board/test";
	}



	@RequestMapping(value="bdetail.do",method=RequestMethod.GET)
	public ModelAndView boardDetail(ModelAndView mv, int bNum,  HttpServletRequest request, ArrayList<Picture> pList) {
		
		HttpSession session = request.getSession(false);
		
		//조회수
		int result= boardService.addReadCount(bNum);
		if(result>0) 
		{
			Board board = boardService.selectOne(bNum);
			
			pList = boardService.selectPicture(bNum);
			
			ArrayList<Reply> replyList = replyService.selectReply(bNum);
			ArrayList<ReReply> reReplyList = replyService.selectReReply(bNum);
			
			System.out.println("board : "+board);
			if(board !=null) 
			{
				mv.addObject("board",board);
				mv.addObject("pList",pList);
				mv.addObject("replyList",replyList);
				mv.addObject("reReplyList",reReplyList);
				mv.setViewName("board/boardDetailView");
			}
			else 
			{
				throw new BoardException("게시판 조회 실패");
			}
		}
		else 
		{
			throw new BoardException(" 공지사항 조회수 증가 실패");
		}
		
		try {	//회원일때 좋아요 누른 여부 확인
			
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			Board b = new Board();
			b.setbNum(bNum);
			b.setId(id);
			
			Board selectBoardLike = boardService.selectBoardLike(b);
			if(selectBoardLike != null) {
				mv.addObject("msg", "싫어요");
			}
			else {
				mv.addObject("msg", "좋아요");
			}
		}
		catch(NullPointerException e){	//비회원
			
		}
		
		
		return mv;
		
	}
	
	
	@RequestMapping("bInsertView.do")
		public String boardInsertView() {
		
		return "board/boardInsertForm";
	}

		
	@RequestMapping(value="bInsert.do", method=RequestMethod.POST)
		public String boardInsert(Board b, Picture p, HttpServletRequest request,
				@RequestParam(value="fileName", required= false) List<MultipartFile> file,
				@RequestParam(value="bContent", required= false) String[] bContent) {
		
			/*
			 * System.out.println("board 출력"+b);
			 * 
			 * System.out.println("파일 출력" +file.get(0).getOriginalFilename());
			 * System.out.println("내용 출력"+bContent[0]);
			 */
		
		ArrayList<Picture> pList = new ArrayList<>();
		Member memId = (Member)request.getSession().getAttribute("loginUser");
		b.setbWriter(memId.getId());

		int result1 = boardService.insertBoard(b);		// 작성자, 게시글 제목, 카테고리
		int currval = boardService.selectCurrval(); 
		/* System.out.println("현재 게시글 번호"+currval); */

		int i = 0;
		for(MultipartFile m : file) {
			if(!m.getOriginalFilename().equals("")) {
				System.out.println(m.getOriginalFilename());
				Picture pic = new Picture();
				pic.setbNum(currval);
				if(bContent.length > 0 && bContent[i] != null){	
				pic.setbContent(bContent[i]);
				}
				
				String renameFileName = saveFile(m,request);
				/* System.out.println(renameFileName); */
	
				pic.setOriFileName(m.getOriginalFilename());
				pic.setUpFileName(renameFileName);
				pList.add(pic);
				i++;
			}else {
				Picture pic = new Picture();
				pic.setbNum(currval);
				if(bContent.length > 0 && bContent[i] != null){	
				pic.setbContent(bContent[i]);
				}
				pList.add(pic);
				i++;
			}
		}
		b.setbNum(currval);
		b.setbThumbnail(pList.get(0).getUpFileName());
		//썸네일 저장
		int thumbnailUpdate = boardService.updateThumbnail(b);

		
		int result2 = boardService.insertPicture(pList);
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:boardList.do";
		}else {
			throw new BoardException("게시글 등록 실패!");
		}		
		
	}

	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로를 설정하는 메소드
		
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		// java.io.File로 import 하자
		
		if(!folder.exists())
		{
			folder.mkdirs();
		}
		
		// 공지글은 굳이 파일명 중복 제거는 신경쓰지 않고 게시판에서 파일명 rename하는걸 해보자!
//		String filePath = folder + "\\" + file.getOriginalFilename();
		// 실제 저장 될 파일 경로 + 파일명
		
		// 공지사항 때와 다르게 파일을 저장할 때 작성자가 올린 파일명 그대로가 아닌
		// 업로드 시간을 기준으로 파일명을 변경하자.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		
		//-------------random도 추가하기----------------
		int ranNum = (int)(Math.random()*100000)+1;
		
		
		String renameFileName = 
				sdf.format(new java.sql.Date(System.currentTimeMillis())) + ranNum
						+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String filePath = savePath + "\\" + renameFileName;
		
			try {
				file.transferTo(new File(filePath));
				// 이 상태로는 파일 업로드가 되지 않는다. 왜냐면 파일 제한크기에 대한 설정이 없기 때문에
				// 그래서 파일 크기 지정을 root-context.xml에서 해주자
			} catch(Exception e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
			}	

		return renameFileName;
	}
	
	/*
	 * @RequestMapping("bInsertView.do") public String boardInsertView () {
	 * 
	 * return "board/boardInsertForm"; }
	 * 
	 * @RequestMapping(value="ninsert.do",method=RequestMethod.POST) public String
	 * boardInsert(Board b, HttpServletRequest request) {
	 * 
	 * int result = boardService.insertBoard(b);
	 * 
	 * if(result>0) { return "redirect:boardList.do"; }else { throw new
	 * BoardException("게시판 등록 실패"); } }
	 */
	
	@RequestMapping(value="boardLike.do", method=RequestMethod.POST)
	public void boardLike(HttpServletResponse response, String id, int bNum) throws IOException
	{
		response.setContentType("application/json;charset=utf-8");
		Board b = new Board();
		b.setbNum(bNum);
		b.setId(id);
		
		Board selectBoardLike = boardService.selectBoardLike(b);
		JSONObject sendJson = new JSONObject();
		//selectBoardLike == null 등록
		if(selectBoardLike == null)
		{
			int result = boardService.insertBoardLike(b);
			if(result > 0)	//좋아요 인설트 성공
			{
				int count = boardService.selectBoardLikeCount(b);
				int hitUpdate = boardService.updateBoardHit(b);
				sendJson.put("msg", "좋아요");
				sendJson.put("count", count);
				
			}
		}
		
		//selectBoardLike != null 좋아요 delete
		if(selectBoardLike != null)
		{
			int delete = boardService.deleteBoardLike(b);
			if(delete > 0)
			{
				int count = boardService.selectBoardLikeCount(b);
				int hitUpdate = boardService.downBoardHit(b);
				sendJson.put("msg", "싫어요");
				sendJson.put("count", count);
			}
		}
		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}
//}
}