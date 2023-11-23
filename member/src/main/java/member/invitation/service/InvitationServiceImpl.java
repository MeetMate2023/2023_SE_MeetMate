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
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class InvitationServiceImpl implements InvitationService{
    private final InvitationRepository invitationRepository;
    private final ArticleRepository articleRepository;
    private  final MemberRepository memberRepository;
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
    public List<InviteDTO> send(InviteRequest inviteRequest){
        Member receiver = memberRepository.findByNickname(inviteRequest.getSender());
        List<Invitation> invitations = invitationRepository.findByReceiver(receiver);
        List<InviteDTO> inviteDTOList = new ArrayList<>();
        for(Invitation invitation : invitations){
            String title = invitation.getArticle().getTitle();
            String local = invitation.getArticle().getLocation();
            String meetTime = invitation.getArticle().getMeetTime();
            InviteDTO inviteDTO = new InviteDTO(title,local,meetTime);
            inviteDTOList.add(inviteDTO);
        }
        return inviteDTOList;
    }
}
