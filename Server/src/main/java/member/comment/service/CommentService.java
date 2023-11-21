package member.comment.service;

import member.comment.contorller.dto.WriteRequest;
import member.comment.repository.entity.Comment;
import member.comment.repository.entity.CommentDTO;

import java.util.List;

public interface CommentService {
    boolean write(WriteRequest writeRequest);
    List<CommentDTO> getCommentList(WriteRequest writeRequest);
    boolean edit(WriteRequest writeRequest);
    boolean delete(WriteRequest writeRequest);

}
