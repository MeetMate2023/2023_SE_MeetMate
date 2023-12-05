package member.invitation.service;


import lombok.RequiredArgsConstructor;
import member.Member.repository.MemberRepository;
import member.Member.repository.entity.Member;
import member.article.repository.ArticleRepository;
import member.article.repository.entity.Article;
import member.invitation.repository.entity.InviteDTO;
import member.invitation.controller.dto.InviteRequest;
import member.invitation.repository.InvitationRepository;
import member.invitation.repository.entity.Invitation;
import member.meeting.repository.MeetingRepository;
import member.meeting.repository.entity.Meeting;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class InvitationServiceImpl implements InvitationService{
    private final InvitationRepository invitationRepository;
    private final ArticleRepository articleRepository;
    private  final MemberRepository memberRepository;
    private final MeetingRepository meetingRepository;
    public boolean invite(InviteRequest inviteRequest){
        Article article = articleRepository.findById(inviteRequest.getArticleId()).orElse(null);
        Member sender = memberRepository.findByNickname(inviteRequest.getSender());
        Member receiver = memberRepository.findByNickname(inviteRequest.getReceiver());
        Invitation invitation = Invitation.builder()
                .article(article)
                .receiver(receiver)
                .sender(sender)
                .build();
        invitationRepository.save(invitation);


        return true;
    }
    //보낸 사용자의 닉네임과 모임 이름, 일정, 위치, 모임 카테고리, 단체방 링크
    public List<InviteDTO> send(InviteRequest inviteRequest) {

        Member sender = memberRepository.findByNickname(inviteRequest.getSender());
        List<Invitation> invite = invitationRepository.findByReceiver(sender);
        List<InviteDTO> inviteDTOList = new ArrayList<>();
        for(Invitation invitation : invite){
            long id = invitation.getId();
            String title = invitation.getArticle().getTitle();
            String nickname = invitation.getArticle().getNickname().getNickname();
            String local = invitation.getArticle().getLocation();
            String meetTime = invitation.getArticle().getMeetTime();
            String category = invitation.getArticle().getCategory();
            String chat = invitation.getArticle().getChat();
            InviteDTO inviteDTO = new InviteDTO(id,title,local,nickname,meetTime,category, chat);
            inviteDTOList.add(inviteDTO);
        }

        return inviteDTOList;
    }

    public boolean permit(InviteRequest inviteRequest) {
        Long id = inviteRequest.getId();
        Optional<Invitation> existingInviteOptional = invitationRepository.findById(id);

        if (existingInviteOptional.isPresent()) {
            Invitation existingInvite = existingInviteOptional.get();

            // Check if the meeting already exists
            if (meetingRepository.existsByArticleAndMember(
                    existingInvite.getArticle(), existingInvite.getReceiver())) {
                // Meeting already exists, so no need to proceed
                return false;
            }

            // Meeting 엔티티 생성 및 저장
            Meeting meeting = Meeting.builder()
                    .article(existingInvite.getArticle())
                    .member(existingInvite.getReceiver())
                    .build();

            meetingRepository.save(meeting);

            invitationRepository.deleteById(id);
            return true;
        } else {
            return false;
        }
    }

    public boolean All_delete(InviteRequest inviteRequest){
        Member Receiver = memberRepository.findByNickname(inviteRequest.getReceiver());
        System.out.println(inviteRequest.getReceiver());
        List<Invitation> invite = invitationRepository.findByReceiver(Receiver);
        if(!invite.isEmpty()) {
            invitationRepository.deleteAll(invite);
            return true;
        }
        else
            return false;
    }
}
