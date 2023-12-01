package member.Member.controller;

import lombok.RequiredArgsConstructor;
import member.Member.controller.dto.JoinRequest;
import member.Member.repository.entity.Member;
import member.Member.repository.entity.MemberDTO;
import member.Member.service.MemberService;
import org.hibernate.mapping.Join;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @PostMapping("/member/login")
    public Member login(@RequestBody JoinRequest joinRequest) {
        return memberService.login(joinRequest);
    }

    @PostMapping("/member/join")
    public boolean join(@RequestBody JoinRequest joinRequest) {
        return memberService.join(joinRequest);
    }

    @PostMapping("/member/id_check")
    public boolean id_check(@RequestBody JoinRequest joinRequest) {
        return !memberService.id_check(joinRequest);
    }

    @PostMapping("/member/nickname_check")
    public boolean nickname_check(@RequestBody JoinRequest joinRequest) {
        return !memberService.nickname_check(joinRequest);
    }
    //내 프로필 출력 -> 위치, 취미, 내가 쓴 글, 내가 쓴 댓글
    @PostMapping("/member/delete")
    public boolean delete(@RequestBody JoinRequest joinRequest){
        return memberService.delete(joinRequest);
    }
    //유저 내용 업데이트
    @PostMapping("/member/update")
    public boolean update(@RequestBody JoinRequest joinRequest){
        return memberService.update(joinRequest);
    }
    //user nickname 모두 출력
    @GetMapping("/member/admin")
    public List<String> all_user_list(){
        return memberService.all_user_list();
    }
    //닉네임 받고, 닉네임 위치 취미
    @PostMapping("/member/profile")
    public MemberDTO send_profile(@RequestBody JoinRequest joinRequest){return memberService.send_profile(joinRequest);}
}
