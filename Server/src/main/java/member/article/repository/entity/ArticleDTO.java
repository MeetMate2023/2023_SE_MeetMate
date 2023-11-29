package member.article.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ArticleDTO {
   private Long id;
   private String Title;
   private String Category;
   private String Content;
   private String Location;
   private LocalDateTime upload_time;
   private String nickname;
   private String chat;
   private String meetTime;
}
