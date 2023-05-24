package dao;

import util.DaoHelper;
import vo.Board;

public class BoardDao {

	public void insertBoard(Board board) {
		DaoHelper.update("boardDao.insertBoard", board.getTitle(),
												board.getContent(),
												board.getCustomer().getId());
	}
}
