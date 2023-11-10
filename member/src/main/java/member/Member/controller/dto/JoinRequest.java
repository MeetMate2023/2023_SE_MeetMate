package member.Member.controller.dto;

import lombok.Data;

@Data
public class JoinRequest {
    private String id;
    private String password;
    private String name;
    private String nickname;
    private String local;
    private String hobby;
}
