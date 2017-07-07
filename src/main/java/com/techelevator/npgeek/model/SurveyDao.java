package com.techelevator.npgeek.model;

import java.util.List;

public interface SurveyDao {

	public List<Survey> getAllSurveyResults();
	public void save(Survey submission);
	

}
