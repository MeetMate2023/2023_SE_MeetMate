package member.Member.service;

import member.Member.controller.dto.JoinRequest;

public interface MemberService {
    boolean join(JoinRequest joinRequest);
    boolean login(JoinRequest joinRequest);

    boolean id_check(JoinRequest joinRequest);
    boolean nickname_check(JoinRequest joinRequest);

}
