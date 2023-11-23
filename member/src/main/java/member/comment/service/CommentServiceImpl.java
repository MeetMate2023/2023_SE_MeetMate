package member.comment.service;

import lombok.RequiredArgsConstructor;
import member.Member.repository.MemberRepository;
import member.Member.repository.entity.Member;
import member.article.repository.ArticleRepository;
import member.article.repository.entity.Article;
import member.comment.contorller.dto.WriteRequest;
import member.comment.repository.CommentRepository;
import member.comment.repository.entity.Comment;
import member.comment.repository.entity.CommentDTO;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {
    private final CommentRepository commentRepository;
    private final ArticleRepository articleRepository;
    private final MemberRepository memberRepository;
    public boolean write(WriteRequest writeRequest) {
        Article article = articleRepository.findById(writeRequest.getArticleId()).orElse(null);
        Member member = memberRepository.findByNickname(writeRequest.getNickname());

        if (article == null){
            System.out.println("Article을 찾을 수 없음: " + writeRequest.getArticleId());
            return false;
        }
        if(member == null) {
            // 디버깅을 위한 세부 정보 로깅
            System.out.println("Member를 찾을 수 없음: " + writeRequest.getNickname());
            return false;
        }

        Comment comment = Comment.builder()
                .content(writeRequest.getContent())
                .article(article)
                .member(member)
                .build();

        commentRepository.save(comment);
        return true;
    }


    public List<CommentDTO> getCommentList(WriteRequest writeRequest) {
        Long articleId = writeRequest.getArticleId();
        List<Comment> commentList = commentRepository.findByArticleId(articleId);
        List<CommentDTO> commentDTOList = new ArrayList<>();

        for (Comment comment : commentList) {
            String content = comment.getContent();
            String nickname = comment.getMember().getNickname();
            Long commentId = comment.getId();
            CommentDTO commentDTO = new CommentDTO(content, nickname,commentId);
            commentDTOList.add(commentDTO);
        }

        return commentDTOList;
    }



    @Override
    public boolean edit(WriteRequest writeRequest) {
        Long commentIndex = writeRequest.getId();
        String content = writeRequest.getContent();

        Optional<Comment> existingCommentOptional = commentRepository.findById(commentIndex);

        if (existingCommentOptional.isPresent()) {
            Comment existingComment = existingCommentOptional.get();
            existingComment.setContent(content);
            commentRepository.save(existingComment);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean delete(WriteRequest writeRequest) {
        if (commentRepository.existsById(writeRequest.getId())) {
            commentRepository.deleteById(writeRequest.getId());
            return true;
        } else {
            return false;
        }
    }
}
