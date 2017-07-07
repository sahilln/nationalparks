package com.techelevator.npgeek.model;

import java.util.ArrayList; 
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCParkDao implements ParkDao{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCParkDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Park> getAllParks() {
		List<Park> allParks = new ArrayList<>();
		
		String sqlSelectAllParks = "SELECT * FROM park";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllParks);
		while(results.next()){
			allParks.add(mapRowToPark(results));
		}
			
			return allParks;
		
	}

	@Override
	public Park getParkByCode(String parkCode) {
		
		Park park = null;
		
		String sqlSelectParkByCode = "SELECT * FROM park WHERE parkCode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectParkByCode, parkCode);
		if(results.next()){
			park = mapRowToPark(results);
		}
		return park;
	}

	@Override
	public List<Park> getTopParks() {
		List<Park> parks = new ArrayList<>();
		
		String sqlReturnCount = "SELECT park.*, COUNT (*) as count FROM survey_result " +
								"JOIN park ON survey_result.parkcode = park.parkCode " +
								"GROUP BY survey_result.parkCode, park.parkCode " +
								"ORDER BY COUNT DESC " + 
								"LIMIT 5";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlReturnCount);
		while(results.next()){
			parks.add(mapRowToPark(results));	
		}
		return parks;
	}

	private Park mapRowToPark(SqlRowSet row) {
		
		Park park = new Park();
		park.setParkCode(row.getString("parkCode"));
		park.setAcreage(row.getInt("acreage"));
		park.setAnnualVisitors(row.getInt("annualVisitorCount"));
		park.setClimate(row.getString("climate"));
		park.setElevationInFeet(row.getInt("elevationInFeet"));
		park.setEntryFee(row.getInt("entryFee"));
		park.setInspirationalQuote(row.getString("inspirationalQuote"));
		park.setInspirationalQuoteSrc(row.getString("inspirationalQuoteSource"));
		park.setMilesOfTrails(row.getFloat("milesOfTrail"));
		park.setNumAnimalSpecies(row.getInt("numberOfAnimalSpecies"));
		park.setNumOfCampsites(row.getInt("numberOfCampsites"));
		park.setParkDescription(row.getString("parkDescription"));
		park.setParkName(row.getString("parkName"));
		park.setState(row.getString("state"));
		park.setYearFounded(row.getInt("yearFounded"));
		
		return park;
		
		
		
	}

}
