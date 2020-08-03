package com.kh.chickenPeople.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.kh.chickenPeople.notice.model.exception.NoticeException;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

@Controller
public class BoradContoller {
	
	@Autowired 
	BoardService boardService;
	
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
	public ModelAndView boardDetail(ModelAndView mv, int bNum) {
		
	
	//조회수
		int result= boardService.addReadCount(bNum);
		if(result>0) {
		Board board = boardService.selectOne(bNum);
		System.out.println("b조회수"+board);
		if(board !=null) {
				mv.addObject("board",board);
				mv.setViewName("board/boardDetailView");
			}else {
				throw new BoardException("게시판 조회 실패");
			}
		}else {
			throw new BoardException(" 공지사항 조회수 증가 실패");
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
		
		int result1 = boardService.insertBoard(b);	
		/* int currval = boardService.selectCurrval(); */

//		int i = 0;
//		for(MultipartFile m : file) {
//			if(!m.getOriginalFilename().equals("")) {
//				System.out.println(m.getOriginalFilename());
//				Attachment aSample = new Attachment();
//				aSample.setRefBid(Integer.valueOf(currval).toString());
//				aSample.setbContent(bCon[i]);
//				
//				String renameFileName = saveFile(m,request);
//				System.out.println(renameFileName);
//	
//				aSample.setOriginalFileName(m.getOriginalFilename());
//				aSample.setRenameFileName(renameFileName);
//				aList.add(aSample);
//				i++;
//			}else {
//				Attachment aSample = new Attachment();
//				aSample.setRefBid(Integer.valueOf(currval).toString());
//				aSample.setbContent(bCon[i]);
//
//				aList.add(aSample);
//				i++;
//			}
//		}
//
//		int result2 = bService.insertAttachment(aList);
//		
//		if(result1 > 0 && result2 > 0) {
//			return "redirect:blist.do";
//		}else {
//			throw new BoardException("게시글 등록 실패!");
//		}		
		
		return "redirect:boardList.do";
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
//}
}