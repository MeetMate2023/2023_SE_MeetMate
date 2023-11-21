package member.Member.service;


import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import member.Member.controller.dto.JoinRequest;
import member.Member.repository.MemberRepository;
import member.Member.repository.entity.Member;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;

    public boolean join(JoinRequest joinRequest) {
        Member member = Member.builder()
                .uid(joinRequest.getUid())
                .password(joinRequest.getPassword())
                .name(joinRequest.getName())
                .company_check(joinRequest.isCompany_check())
                .nickname(joinRequest.getNickname())
                .local(joinRequest.getLocal())
                .hobby(joinRequest.getHobby())
                .build();
        memberRepository.save(member);
        return true;
    }

    public Member login(JoinRequest joinRequest) {
        Member member = Member.builder()
                .uid(joinRequest.getUid())
                .password(joinRequest.getPassword())
                .build();

        Member foundMember = memberRepository.getMemberByUid(member.getUid());
        if(foundMember != null && foundMember.getPassword().equals(member.getPassword())){
            return foundMember;
        }
        else
            return null;
    }

    public boolean id_check(JoinRequest joinRequest) {
        String idToCheck = joinRequest.getUid();
        return memberRepository.getMemberByUid(idToCheck) != null;
    }

    public boolean nickname_check(JoinRequest joinRequest) {
        String nicknameToCheck = joinRequest.getNickname();
        return memberRepository.getMemberByNickname(nicknameToCheck) != null;
    }

    @Transactional
    public boolean delete(JoinRequest joinRequest){
        int deletedRecords = memberRepository.deleteByUid(joinRequest.getUid());
        return deletedRecords > 0;
    }
}
