package member.invitation.service;

import member.invitation.repository.entity.Invitation;
import member.invitation.repository.entity.InviteDTO;
import member.invitation.controller.dto.InviteRequest;

import java.util.List;

public interface InvitationService {

    boolean invite(InviteRequest inviteRequest);

    List<InviteDTO>send(InviteRequest inviteRequest);

    boolean permit(InviteRequest inviteRequest);

    boolean All_delete(InviteRequest inviteRequest);
}
