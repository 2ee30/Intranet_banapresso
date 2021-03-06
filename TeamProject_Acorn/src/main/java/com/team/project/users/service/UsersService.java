package com.team.project.users.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.users.dto.UsersDto;

public interface UsersService {
	public Map<String, Object> isExistId(String inputId);
	public Map<String, Object> isExistPnum(String inputPnum);
	public void addUser(UsersDto dto);
	public void addEmp(UsersDto dto);
	public void validEmp(UsersDto dto, HttpSession session, ModelAndView mView);
	public void validUser(UsersDto dto, HttpSession session, ModelAndView mView);
	public void showInfo(String id, ModelAndView mView);
	public String saveProfileImage(HttpServletRequest request, MultipartFile mFile);
	public void updatePassword(UsersDto dto, ModelAndView mView);
	public void resignEmp(HttpServletRequest request);
	public void empMainList(HttpServletRequest request);
	public void empResignList(HttpServletRequest request);
	public void getList(HttpServletRequest request);
}
