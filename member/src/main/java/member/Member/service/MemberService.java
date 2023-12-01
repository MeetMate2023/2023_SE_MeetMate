package member.Member.service;

import member.Member.controller.dto.JoinRequest;
import member.Member.repository.entity.Member;
import member.Member.repository.entity.MemberDTO;

import java.util.List;

public interface MemberService {
    boolean join(JoinRequest joinRequest);
    Member login(JoinRequest joinRequest);

    boolean id_check(JoinRequest joinRequest);
    boolean nickname_check(JoinRequest joinRequest);

    boolean delete(JoinRequest joinRequest);
    List<String>all_user_list();

    boolean update(JoinRequest joinRequest);
    MemberDTO send_profile(JoinRequest joinRequest);
}
