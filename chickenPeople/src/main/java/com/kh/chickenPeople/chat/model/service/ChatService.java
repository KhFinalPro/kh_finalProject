package com.kh.chickenPeople.chat.model.service;

import com.kh.chickenPeople.chat.model.vo.ChattingRoom;

public interface ChatService {

	ChattingRoom selectRoom_data(String loginUserName);

}
