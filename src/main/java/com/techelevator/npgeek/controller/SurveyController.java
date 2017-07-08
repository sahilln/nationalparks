package com.techelevator.npgeek.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@RequestMapping(path = "/surveyOutput", method = RequestMethod.GET)
	public String showSurveyResults(HttpServletRequest request) {
		List<Survey> surveyResults = surveyDao.getAllSurveyResults();
		List<Park> topParks = parkDao.getTopParks();

		request.setAttribute("surveyResults", surveyResults);
		request.setAttribute("topParks", topParks);

		return "surveyOutput";
	}

	@RequestMapping(path = "/surveyInput", method = RequestMethod.GET)
	public String showSurveyInput(HttpServletRequest request, Model modelHolder) {
		if (!modelHolder.containsAttribute("survey")) {
			modelHolder.addAttribute("survey", new Survey());
		}
		return "surveyInput";
	}

	@RequestMapping(path = "/surveyInput", method = RequestMethod.POST)
	public String processSurveyInput(@Valid @ModelAttribute("survey") Survey submission, BindingResult result,
			RedirectAttributes attr) {
		attr.addFlashAttribute("survey", submission);

		if (result.hasErrors()) {
			attr.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "survey", result);
			return "redirect:/surveyInput";
		}

		surveyDao.save(submission);
		return "redirect:/surveyOutput";
	}
}
