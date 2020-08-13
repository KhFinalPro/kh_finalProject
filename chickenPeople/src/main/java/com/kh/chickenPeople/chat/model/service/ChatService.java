package com.kh.chickenPeople.chat.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.chat.model.vo.ChattingMsg;
import com.kh.chickenPeople.chat.model.vo.ChattingRoom;
import com.kh.chickenPeople.member.model.vo.Member;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;
import com.kh.chickenPeople.systemAdmin.model.vo.SearchStatus;

public interface ChatService {

	ChattingRoom selectRoom_data(String userId);

	int createRoom_no(String userId);

	ArrayList<ChattingRoom> selectAllRoom_data(SearchStatus chatSearch,PageInfo pi);

	int saveMessage(String jsonStr);

	ArrayList<ChattingMsg> selectAllMsgData(String chattingRoom_no);

	int getListCount(SearchStatus chatSearch);

	ArrayList<Member> selectAllMember_data();

	int updateChatStatus(int room_no);

}
