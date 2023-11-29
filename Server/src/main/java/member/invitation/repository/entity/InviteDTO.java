package member.invitation.repository.entity;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InviteDTO {
    //인덱스, 보낸 사용자의 닉네임과 모임 이름, 일정, 위치, 모임 카테고리, 단체방 링크
    //I(id, title,nickname,local,meetTime,category,chat);
    private long id;
    private String title;
    private String local;
    private String nickname;
    private String meetTime;
    private String category;
    private String chat;
}
