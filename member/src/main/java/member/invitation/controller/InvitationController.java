package member.invitation.controller;

import lombok.RequiredArgsConstructor;
import member.invitation.repository.entity.InviteDTO;
import member.invitation.controller.dto.InviteRequest;
import member.invitation.service.InvitationService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class InvitationController {
    private final InvitationService invitationService;

    @PostMapping("/invitation/invite")
    public boolean invite(@RequestBody InviteRequest inviteRequest){
        return invitationService.invite(inviteRequest);
    }
    @PostMapping("/invitation/send")
    public List<InviteDTO> send(@RequestBody InviteRequest inviteRequest){
        return invitationService.send(inviteRequest);
    }
}
