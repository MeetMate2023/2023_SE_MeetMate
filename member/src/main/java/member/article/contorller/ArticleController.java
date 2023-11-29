package member.article.contorller;

import lombok.RequiredArgsConstructor;
import member.Member.controller.dto.JoinRequest;
import member.Member.repository.MemberRepository;
import member.Member.repository.entity.Member;
import member.Member.service.MemberService;
import member.article.contorller.dto.UploadRequest;
import member.article.repository.entity.Article;
import member.article.repository.entity.ArticleDTO;
import member.article.service.ArticleService;
import org.hibernate.mapping.Join;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

@RestController
@RequiredArgsConstructor
public class ArticleController {
    private final ArticleService articleService;
    private final MemberRepository memberRepository;

    @PostMapping("article/post")
    public boolean writePost(@RequestBody JoinRequest joinRequest) {
        Member member = memberRepository.findByNickname(joinRequest.getNickname());
        int normal_maxDailyPostCount = 3;//일반
        int business_maxDailyPostCount = 1;
        if (member.getLastPostDate() == null ||
                !member.getLastPostDate().toLocalDate().equals(LocalDateTime.now().toLocalDate())) {
            member.setDailyPostCount(0);
        }
        if(!member.isCompany_check()){
            return member.getDailyPostCount() < normal_maxDailyPostCount;
        }
        else{
            return member.getDailyPostCount() < business_maxDailyPostCount;
        }
    }

    @PostMapping("/article/write")
    public boolean upload(@RequestBody UploadRequest uploadRequest){return articleService.upload(uploadRequest);
    }
    @PostMapping("/article/list")
    public List<ArticleDTO> getArticleList() {
        return articleService.getArticleList();
    }

    @PostMapping("/article/edit")
    public boolean edit(@RequestBody UploadRequest uploadRequest){return articleService.edit(uploadRequest);
    }
    @PostMapping("/article/delete")
    public boolean delete(@RequestBody UploadRequest uploadRequest){return articleService.delete(uploadRequest);}
}
