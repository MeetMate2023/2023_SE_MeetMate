package member.comment.contorller.dto;

import lombok.Data;

@Data
public class WriteRequest {
    private long id;//comment id
    private String content;
    private String nickname;
    private long articleId;//article id
}
