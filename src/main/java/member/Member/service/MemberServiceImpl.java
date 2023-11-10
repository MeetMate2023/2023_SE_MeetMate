package member.Member.service;


import lombok.RequiredArgsConstructor;
import member.Member.controller.dto.JoinRequest;
import member.Member.repository.MemberRepository;
import member.Member.repository.entity.Member;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;

    @Override
    public boolean join(JoinRequest joinRequest) {
        Member member = Member.builder()
                .id(joinRequest.getId())
                .password(joinRequest.getPassword())
                .name(joinRequest.getName())
                .nickname(joinRequest.getNickname())
                .local(joinRequest.getLocal())
                .hobby(joinRequest.getHobby())
                .build();
        // TODO: save() 메서드에서 반환하는 값 체크해서 리턴 값 수정
        memberRepository.save(member);
        return true;

    }

    public boolean login(JoinRequest joinRequest) {
        Member member = Member.builder()
                .id(joinRequest.getId())
                .password(joinRequest.getPassword())
                .build();

        Member foundMember = memberRepository.getMemberById(member.getId());

        return foundMember != null && foundMember.getPassword().equals(member.getPassword());
    }

    public boolean id_check(JoinRequest joinRequest) {
        String idToCheck = joinRequest.getId();
        return memberRepository.getMemberById(idToCheck) != null;
    }

    public boolean nickname_check(JoinRequest joinRequest) {
        String nicknameToCheck = joinRequest.getNickname();
        return memberRepository.getMemberByNickname(nicknameToCheck) != null;
    }



}
