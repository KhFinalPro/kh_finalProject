package com.kh.chickenPeople.chat.model.service;

import java.util.ArrayList;

import com.kh.chickenPeople.chat.model.vo.ChattingMsg;
import com.kh.chickenPeople.chat.model.vo.ChattingRoom;
import com.kh.chickenPeople.systemAdmin.model.vo.PageInfo;

public interface ChatService {

	ChattingRoom selectRoom_data(String userId);

	int createRoom_no(String userId);

	ArrayList<ChattingRoom> selectAllRoom_data(PageInfo pi);

	int saveMessage(String jsonStr);

	ArrayList<ChattingMsg> selectAllMsgData(String chattingRoom_no);

	int getListCount();

}
