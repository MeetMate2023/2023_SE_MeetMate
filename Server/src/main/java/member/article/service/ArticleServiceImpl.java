package member.article.service;

import lombok.RequiredArgsConstructor;
import member.Member.repository.MemberRepository;
import member.Member.repository.entity.Member;
import member.article.contorller.dto.UploadRequest;
import member.article.repository.ArticleRepository;
import member.article.repository.entity.Article;
import member.article.repository.entity.ArticleDTO;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ArticleServiceImpl implements ArticleService{
    private final ArticleRepository articleRepository;
    private final MemberRepository memberRepository;

    public boolean upload(UploadRequest uploadRequest){
        //
        Member nickname = memberRepository.findByNickname(uploadRequest.getNickname());

         Article article = Article.builder()
                .title(uploadRequest.getTitle())
                .category(uploadRequest.getCategory())
                .content(uploadRequest.getContent())
                .location(uploadRequest.getLocation())
                .upload_time(LocalDateTime.now())
                .nickname(nickname)
                .chat(uploadRequest.getChat())
                .meetTime(uploadRequest.getMeetTime())
                .build();
        articleRepository.save(article);

        nickname.setLastPostDate(LocalDateTime.now());
        memberRepository.save(nickname);
        return true;
    }
    public List<ArticleDTO> getArticleList() {
        List<Article> article = articleRepository.findAll();
        List<ArticleDTO>articleDTOList = new ArrayList<>();

        for(Article article1 : article){
            Long id = article1.getId();
            String title = article1.getTitle();
            String category = article1.getCategory();
            String content = article1.getContent();
            String location = article1.getLocation();
            LocalDateTime upload_time = article1.getUpload_time();
            String nickname = article1.getNickname().getNickname();
            String meetTime = article1.getMeetTime();
            String chat = article1.getChat();
            ArticleDTO dto = new ArticleDTO(id,title,category, content,location, upload_time,nickname,chat,meetTime);
            articleDTOList.add(dto);
        }
        return articleDTOList;
    }

    public boolean edit(UploadRequest uploadRequest) {
        // title, category, content, location, 수정
        Long id = uploadRequest.getId();
        String nTitle = uploadRequest.getTitle();
        String nContent = uploadRequest.getContent();
        String nCategory = uploadRequest.getCategory();
        String nLocation = uploadRequest.getLocation();
        String chat = uploadRequest.getChat();
        String meetTime = uploadRequest.getMeetTime();
        Optional<Article> existingArticleOptional = articleRepository.findById(id);

        if (existingArticleOptional.isPresent()) {
            Article existingArticle = existingArticleOptional.get();
            existingArticle.setTitle(nTitle);
            existingArticle.setCategory(nCategory);
            existingArticle.setContent(nContent);
            existingArticle.setLocation(nLocation);
            existingArticle.setChat(chat);
            existingArticle.setMeetTime(meetTime);
            // 수정된 게시글을 저장
            articleRepository.save(existingArticle);
            return true;
        } else {
            // 수정할 게시글이 없는 경우
            return false;
        }
    }

    public boolean delete(UploadRequest uploadRequest){
        Long id = uploadRequest.getId();
        // 기존 게시글을 ID를 기반으로 찾아온다.
        Optional<Article> existingArticleOptional = articleRepository.findById(id);
        //Member member = memberRepository.findByNickname();
        if (existingArticleOptional.isPresent()) {
            // 게시글이 존재하면 삭제
            articleRepository.deleteById(id);
            //member.setDailyPostCount(member.getDailyPostCount()-1);
            return true;
        } else {
            return false;
        }
    }
}
