package member.comment.contorller;

import lombok.RequiredArgsConstructor;
import member.comment.contorller.dto.WriteRequest;
import member.comment.repository.entity.Comment;
import member.comment.repository.entity.CommentDTO;
import member.comment.service.CommentService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.sound.midi.Soundbank;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class CommentController {
    private final CommentService commentService;

    @PostMapping("/comment/write")
    public boolean write(@RequestBody WriteRequest writeRequest){
        return commentService.write(writeRequest);
    }

    @PostMapping("/comment/list")
    public List<CommentDTO> getCommentList(@RequestBody WriteRequest writeRequest) {
        return commentService.getCommentList(writeRequest);
    }

    @PostMapping("/comment/edit")
    public boolean edit(@RequestBody WriteRequest writeRequest){
        return commentService.edit(writeRequest);
    }

    @PostMapping("/comment/delete")
    public boolean delete(@RequestBody WriteRequest writeRequest){
        return commentService.delete(writeRequest);
    }
}
