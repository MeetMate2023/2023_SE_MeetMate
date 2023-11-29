package member.Member.repository;

import member.Member.repository.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {
    Member getMemberByUid(String uid);

    Member getMemberByNickname(String nickname);
    //Optional<Member> findByNickname(String nickname);
    Member findByNickname(String nickname);

    @Modifying
    int deleteByUid(String uid);

}

