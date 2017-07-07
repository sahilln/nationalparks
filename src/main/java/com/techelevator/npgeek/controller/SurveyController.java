package com.techelevator.npgeek.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDao;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDao;

@Controller
public class SurveyController {

@Autowired

private SurveyDao surveyDao;

@Autowired
private ParkDao parkDao;

@RequestMapping(path="/surveyOutput", method = RequestMethod.GET)
public String showSurveyResults(HttpServletRequest request){
	
	List<Survey> surveyResults = surveyDao.getAllSurveyResults();
	List<Park> topParks = parkDao.getTopParks();
	
	request.setAttribute("surveyResults", surveyResults);
	request.setAttribute("topParks", topParks);
	
	
	return "surveyOutput";
}

@RequestMapping(path = "/surveyInput", method = RequestMethod.GET)
public String
showSurveyInput(HttpServletRequest request){
	return "surveyInput";
}

@RequestMapping(path="/surveyInput", method = RequestMethod.POST)
public String processSurveyInput( @ModelAttribute ("survey") @Valid Survey submission){
	surveyDao.save(submission);
return "redirect:/surveyOutput";
}
}
