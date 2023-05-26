package dao;

import java.util.List;

import util.DaoHelper;
import vo.Comment;
import vo.Customer;

public class CommentDao {

	public void insertComment(Comment comment) {
		DaoHelper.update("commentDao.insertComment", comment.getContent(),
													comment.getCustomer().getId(),
													comment.getBoard().getNo());
	}
	
	public List<Comment> getCommentsByBoardNo(int boardNo) {
		return DaoHelper.selectList("commentDao.getCommentsByBoardNo", rs -> {
			Comment comment = new Comment();
			comment.setNo(rs.getInt("comment_no"));
			comment.setContent(rs.getString("comment_content"));
			comment.setCreateDate(rs.getDate("comment_create_date"));
			comment.setCustomer(new Customer(rs.getString("cust_id"), rs.getString("cust_name")));
			return comment;
		}, boardNo);
	}
	
	public Comment getCommentByNo(int commentNo, int boardNo) {
		return DaoHelper.selectOne("commentDao.getCommentByNo", rs -> {
			Comment comment = new Comment();
			comment.setCustomer(new Customer(rs.getString("cust_id")));
			return comment;
		}, commentNo, boardNo);
	}
	
	public void deleteComment(int no) {
		DaoHelper.update("commentDao.deleteComment", no);
	}
}
