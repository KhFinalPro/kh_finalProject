package com.kh.chickenPeople.chat.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.chat.model.vo.ChattingMsg;
import com.kh.chickenPeople.chat.model.vo.ChattingRoom;

public interface ChatService {

	ChattingRoom selectRoom_data(String userId);

	int createRoom_no(String userId);

	ArrayList<ChattingRoom> selectAllRoom_data();

	int saveMessage(String jsonStr);

	ArrayList<ChattingMsg> selectAllMsgData(String chattingRoom_no);

}
