package member.article.service;

import member.article.contorller.dto.UploadRequest;
import member.article.repository.entity.Article;

import java.util.List;

public interface ArticleService {

    boolean upload(UploadRequest uploadRequest);
    List<Article> getArticleList();

    boolean edit(UploadRequest uploadRequest);
    boolean delete(UploadRequest uploadRequest);

}
