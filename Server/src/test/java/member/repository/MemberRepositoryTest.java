package member.repository;

import member.Member.repository.MemberRepository;
import member.Member.repository.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MemberRepositoryTest {

    @Autowired MemberRepository memberRepository;

    @Test
    public void crudTest(){
//        Member member = Member.builder()
//                .ID("qwer123")
//                .password("1234")
//                .name("홍길동")
//                .nicname("joa")
//                .local("daegu")
//                .hobby("exercise, music")
//                .build();
//                //create Test
//        memberRepository.save(member);
//
//        //get test
//        Member foundMember = memberRepository.findById(1L).get();
    }
}
