package member.Member.repository;

import member.Member.repository.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Long> {
    Member getMemberById(String id);
    Member getMemberByNickname(String nickname);
}

