package member.article.contorller;

import lombok.RequiredArgsConstructor;
import member.article.contorller.dto.UploadRequest;
import member.article.repository.entity.Article;
import member.article.service.ArticleService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class ArticleController {
    private final ArticleService articleService;
    @PostMapping("/article/write")
    public boolean upload(@RequestBody UploadRequest uploadRequest){return articleService.upload(uploadRequest);
    }
    @PostMapping("/article/list")
    public List<Article> getArticleList() {
        return articleService.getArticleList();
    }

    @PostMapping("/article/edit")
    public boolean edit(@RequestBody UploadRequest uploadRequest){return articleService.edit(uploadRequest);
    }
    @PostMapping("/article/delete")
    public boolean delete(@RequestBody UploadRequest uploadRequest){return articleService.delete(uploadRequest);}
}
