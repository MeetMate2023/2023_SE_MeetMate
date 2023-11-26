package member.invitation.controller.dto;

import lombok.Data;

@Data
public class InviteRequest {
    private long articleId;// 기사 id
    private String sender;
    private String receiver;
}
