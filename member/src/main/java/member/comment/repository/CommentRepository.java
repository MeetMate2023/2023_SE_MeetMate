package member.comment.repository;

import member.comment.repository.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface CommentRepository extends JpaRepository<Comment,Long> {

    List<Comment> findByArticleId(Long articleId);
}
