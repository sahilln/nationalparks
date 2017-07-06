package com.techelevator.npgeek.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.npgeek.model.ParkDao;

@Controller
public class HomeController {

	@Autowired
	
	private ParkDao parkDao;
	
	
	@RequestMapping(path = "/homePage", method=RequestMethod.GET)
	public String showHomePage(HttpServletRequest request){
		request.setAttribute("parkList", parkDao.getAllParks());
		return "homePage";
	
	}
}
	


