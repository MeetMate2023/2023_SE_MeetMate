package member.meeting.repository;

import member.Member.repository.entity.Member;
import member.article.repository.entity.Article;
import member.meeting.controller.dto.MeetingRequest;
import member.meeting.repository.entity.Meeting;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MeetingRepository extends JpaRepository<Meeting,Long> {
    List<Meeting> findByMember_Nickname(String nickname);

    boolean existsByArticleAndMember(Article article, Member receiver);
}
