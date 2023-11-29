package member.meeting.service;


import lombok.RequiredArgsConstructor;
import member.Member.repository.MemberRepository;
import member.Member.repository.entity.Member;
import member.meeting.controller.dto.MeetingRequest;
import member.meeting.repository.MeetingRepository;
import member.meeting.repository.entity.Meeting;
import member.meeting.repository.entity.MeetingDTO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MeetingServiceImpl implements MeetingService{
private final MeetingRepository meetingRepository;
private final MemberRepository memberRepository;
    @Override
    public List<MeetingDTO> getMeetingList(MeetingRequest meetingRequest) {
        List<Meeting> articleIds = meetingRepository.findByMember_Nickname(meetingRequest.getNickname());
        List<MeetingDTO>meetingDTOS = new ArrayList<>();
        for(Meeting meet : articleIds){
            String title = (meet.getArticle().getTitle());
            String meetTime = (meet.getArticle().getMeetTime());
            String location = (meet.getArticle().getLocation());
            MeetingDTO dto = new MeetingDTO(title, meetTime, location);
            meetingDTOS.add(dto);
        }
        return meetingDTOS;
    }
}
