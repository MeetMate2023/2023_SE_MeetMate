package member.Member.controller.dto;

import lombok.Data;

@Data
public class JoinRequest {

    private String uid;
    private String password;
    private boolean company_check;
    private String name;
    private String nickname;
    private String local;
    private String hobby;
}
