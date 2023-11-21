package member.article.contorller.dto;

import lombok.Data;

@Data
public class UploadRequest {

    Long id;
    String title;
    String nickname;
    String content;
    String category;
    String location;
    String chat;
}
