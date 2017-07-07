package com.techelevator.npgeek.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.model.ParkDao;
import com.techelevator.npgeek.model.WeatherDao;

@Controller
public class ParkDetailController {
	
	@Autowired
	private ParkDao parkDao;
	@Autowired
	private WeatherDao weatherDao;
	
	@RequestMapping(path = "/parkDetail", method=RequestMethod.GET)
	public String showParkDetail(ModelMap model, HttpServletRequest request, @RequestParam String parkCode, @RequestParam boolean celsius){
		request.setAttribute("park", parkDao.getParkByCode(parkCode));
		request.setAttribute("fiveDayList", weatherDao.getFiveDayForecastByCode(parkCode));
		return "parkDetail";
	}
	
}
