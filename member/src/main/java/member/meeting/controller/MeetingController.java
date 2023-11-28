package member.meeting.controller;

import lombok.RequiredArgsConstructor;
import member.meeting.controller.dto.MeetingRequest;
import member.meeting.repository.entity.Meeting;
import member.meeting.repository.entity.MeetingDTO;
import member.meeting.service.MeetingService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class MeetingController {
    private final MeetingService meetingService;

    @PostMapping("/calendar/list")
    public List<MeetingDTO> getMeetingList(@RequestBody MeetingRequest meetingRequest ) {
        return meetingService.getMeetingList(meetingRequest);
    }


}
