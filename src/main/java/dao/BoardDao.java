package dao;

import java.util.List;

import util.DaoHelper;
import vo.Board;
import vo.Customer;

public class BoardDao {

	public void insertBoard(Board board) {
		DaoHelper.update("boardDao.insertBoard", board.getTitle(),
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
}
