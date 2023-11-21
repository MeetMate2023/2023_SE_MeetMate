package member.Member.service;

import member.Member.controller.dto.JoinRequest;
import member.Member.repository.entity.Member;

public interface MemberService {
    boolean join(JoinRequest joinRequest);
    Member login(JoinRequest joinRequest);

    boolean id_check(JoinRequest joinRequest);
    boolean nickname_check(JoinRequest joinRequest);

    boolean delete(JoinRequest joinRequest);
}
