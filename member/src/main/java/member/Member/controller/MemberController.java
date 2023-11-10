package member.Member.controller;

import lombok.RequiredArgsConstructor;
import member.Member.controller.dto.JoinRequest;
import member.Member.service.MemberService;
import org.hibernate.mapping.Join;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @PostMapping("/login")
    public boolean login(@RequestBody JoinRequest joinRequest) {
        return memberService.login(joinRequest);
    }

    @PostMapping("/join")
    public boolean join(@RequestBody JoinRequest joinRequest) {
        return memberService.join(joinRequest);
    }

    @PostMapping("id_check")
    public boolean id_check(@RequestBody JoinRequest joinRequest) {
        return !memberService.id_check(joinRequest);
    }

    @PostMapping("nickname_check")
    public boolean nickname_check(@RequestBody JoinRequest joinRequest) {
        return !memberService.nickname_check(joinRequest);
    }
}
