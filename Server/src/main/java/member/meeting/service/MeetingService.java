package member.meeting.service;

import member.meeting.controller.dto.MeetingRequest;
import member.meeting.repository.entity.Meeting;
import member.meeting.repository.entity.MeetingDTO;

import java.util.List;

public interface MeetingService {

    List<MeetingDTO> getMeetingList(MeetingRequest meetingRequest);
}
