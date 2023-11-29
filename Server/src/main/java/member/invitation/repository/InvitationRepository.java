package member.invitation.repository;

import member.Member.repository.entity.Member;
import member.invitation.controller.dto.InviteRequest;
import member.invitation.repository.entity.Invitation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface InvitationRepository extends JpaRepository<Invitation,Long> {
    List<Invitation>findByReceiver(Member receiver);

}
