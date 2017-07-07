package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component 
public class JDBCWeatherDao implements WeatherDao{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCWeatherDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Weather> getFiveDayForecastByCode(String parkCode) {
		List<Weather> fiveDay = new ArrayList<>();
		String sqlSelectFiveDayForecast = "SELECT * FROM weather WHERE parkCode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectFiveDayForecast, parkCode);
		while(results.next()){
			Weather weather = mapRowToWeather(results); 
			fiveDay.add(weather);
		}
		return fiveDay;
	}
	
	private Weather mapRowToWeather(SqlRowSet row){
		
		Weather weather = new Weather();
		weather.setParkCode(row.getString("parkCode"));
		weather.setFiveDayForecastValue(row.getInt("fiveDayForecastValue"));
		weather.setLowTemp(row.getInt("low"));
		weather.setHighTemp(row.getInt("high"));
		weather.setForecast(row.getString("forecast"));
		
		return weather;
	}

}
