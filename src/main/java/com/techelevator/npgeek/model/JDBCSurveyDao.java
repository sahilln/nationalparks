package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
@Component
public class JDBCSurveyDao implements SurveyDao {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCSurveyDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Survey> getAllSurveyResults() {
		List<Survey> surveyResults = new ArrayList<>();
		
		String sqlReturnSurveyResults = "SELECT * FROM survey_result";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReturnSurveyResults);
		while(results.next()){
			surveyResults.add(mapRowToSurvey(results));
		}
		return surveyResults;
	}
	
	

	@Override
	public void save(Survey submission) {
		int surveyId = getNextId();
		String sqlInsertSubmission = "INSERT INTO survey_result(surveyId, parkCode, emailAddress, state, activityLevel) VALUES (?,?,?,?,?)";
		jdbcTemplate.update(sqlInsertSubmission, surveyId, submission.getParkCode(), submission.getEmailAddress(), submission.getState(), submission.getActivityLevel());
		submission.setSurveyId(surveyId);
	}
	
	
	private int getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_surveyId')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Integer surveyId = null;
		if(results.next()) {
			surveyId = results.getInt(1);
		} else {
			throw new RuntimeException("Error: unable to select next survey id from sequence");
		}
		return surveyId;
	}
	

	private Survey mapRowToSurvey(SqlRowSet row){
		
		Survey survey = new Survey();
		
		survey.setActivityLevel(row.getString("activityLevel"));
		survey.setEmailAddress(row.getString("emailAddress"));
		survey.setParkCode(row.getString("parkCode"));
		survey.setState(row.getString("state"));
		survey.setSurveyId(row.getInt("surveyId"));
		
		return survey;
	
	}
		
}

