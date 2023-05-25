package dao;

import java.util.List;

import util.DaoHelper;
import vo.Board;
import vo.Customer;

public class BoardDao {

	public int getBoardsSeq() {
		return DaoHelper.selectOne("boardDao.getBoardsSeq", rs -> {
			return rs.getInt("nextval");
		});
	}
	public void insertBoard(Board board) {
		DaoHelper.update("boardDao.insertBoard", board.getNo(),
												board.getTitle(),
												board.getContent(),
												board.getCustomer().getId());
	}
	
	public int getTotalRows() {
		return DaoHelper.selectOne("boardDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}
	
	public List<Board> getBoards(int begin, int end) {
		return DaoHelper.selectList("boardDao.getBoards", rs -> {
			Board board = new Board(Integer.parseInt(rs.getString("board_no")));
			board.setTitle(rs.getString("board_title"));
			board.setCommentCnt(Integer.parseInt(rs.getString("board_comment_cnt")));
			board.setCreateDate(rs.getDate("board_create_date"));
			board.setCustomer(new Customer(null, rs.getString("cust_name")));
			return board;
		}, begin, end);
	}
	
	public Board getBoardByNo(int no) {
		return DaoHelper.selectOne("boardDao.getBoardByNo", rs -> {
			Board board = new Board();
			board.setNo(no);
			board.setTitle(rs.getString("board_title"));
			board.setContent(rs.getString("board_content"));
			board.setCommentCnt(rs.getInt("board_comment_cnt"));
			board.setReadCnt(rs.getInt("board_read_cnt"));
			board.setDeleted(rs.getString("board_deleted"));
			board.setUpdateDate(rs.getDate("board_update_date"));
			board.setCreateDate(rs.getDate("board_create_date"));
			board.setCustomer(new Customer(rs.getString("cust_id"), rs.getString("cust_name")));
			return board;
		}, no);
	}
	
	public void increaseReadCnt(int no) {
		DaoHelper.update("boardDao.increaseReadCnt", no);
	}
	public void increaseCommentCnt(int no) {
		DaoHelper.update("boardDao.increaseCommentCnt", no);
	}
	public void decreaseCommentCnt(int no) {
		DaoHelper.update("boardDao.decreaseCommentCnt", no);
	}
	public void updateDeleted(String deleted, int no) {
		DaoHelper.update("boardDao.updateDeleted", deleted, no);
	}
}
