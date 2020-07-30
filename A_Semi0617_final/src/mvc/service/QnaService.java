package mvc.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.QnaDao;
import mvc.vo.QnaVO;

@Service
public class QnaService {
	
	@Autowired
    private QnaDao qnaDao;
 
    /** �Խ��� - ��� ��ȸ */
    public List<QnaVO> getQnaList(HttpSession session) throws Exception {
    	int num = (int) session.getAttribute("user_num");
        return qnaDao.qnalist(num);
    }
    
    public List<QnaVO> getQnadetailList(HttpSession session, QnaVO vo) throws Exception {
    	int num = (int) session.getAttribute("user_num");
        return qnaDao.qnadetaillist(num, vo);
    }
    
    public List<QnaVO> deleteQnaList(HttpSession session, QnaVO vo) throws Exception {
    	int num = (int) session.getAttribute("user_num");
    	return qnaDao.deletelist(num, vo);
    }
    public int addQna(HttpSession session, QnaVO vo) throws Exception {
    	//int num = (int) session.getAttribute("user_num");
    	return qnaDao.addQna(vo);
    }
// 
//    /** �Խ��� - �� ��ȸ */
//    public BoardDto getBoardDetail(BoardForm boardForm) throws Exception {
// 
//        BoardDto boardDto = new BoardDto();
// 
//        String searchType = boardForm.getSearch_type();
// 
//        if("S".equals(searchType)){
//            
//            int updateCnt = boardDao.updateBoardHits(boardForm);
//        
//            if (updateCnt > 0) {
//                boardDto = boardDao.getBoardDetail(boardForm);
//            }
//            
//        } else {
//            
//            boardDto = boardDao.getBoardDetail(boardForm);
//        }
// 
//        return boardDto;
//    }
// 
//    /** �Խ��� - ��� */
//    public BoardDto insertBoard(BoardForm boardForm) throws Exception {
// 
//        BoardDto boardDto = new BoardDto();
// 
//        int insertCnt = boardDao.insertBoard(boardForm);
// 
//        if (insertCnt > 0) {
//            boardDto.setResult("SUCCESS");
//        } else {
//            boardDto.setResult("FAIL");
//        }
// 
//        return boardDto;
//    }
// 
//    /** �Խ��� - ���� */
//    public BoardDto deleteBoard(BoardForm boardForm) throws Exception {
// 
//        BoardDto boardDto = new BoardDto();
// 
//        int deleteCnt = boardDao.deleteBoard(boardForm);
// 
//        if (deleteCnt > 0) {
//            boardDto.setResult("SUCCESS");
//        } else {
//            boardDto.setResult("FAIL");
//        }
// 
//        return boardDto;
//    }
// 
//    /** �Խ��� - ���� */
//    public BoardDto updateBoard(BoardForm boardForm) throws Exception {
// 
//        BoardDto boardDto = new BoardDto();
// 
//        int deleteCnt = boardDao.updateBoard(boardForm);
// 
//        if (deleteCnt > 0) {
//            boardDto.setResult("SUCCESS");
//        } else {
//            boardDto.setResult("FAIL");
//        }
// 
//        return boardDto;
//    }
}
