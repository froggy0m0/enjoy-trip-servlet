package com.ssafy.food.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.food.model.FoodDto;
import com.ssafy.util.DBUtil;

public class FoodDaoImpl implements FoodDao {
	double nowLat = 36.355215;
	double nowLong = 127.298022;
	
	private DBUtil db;
	private static FoodDao instance = new FoodDaoImpl();
	private FoodDaoImpl() {
		db = DBUtil.getInstance();
	}
	public static FoodDao getInstance() {
		return instance;
	}
	@Override
	public List<FoodDto> listFood(int areaCode, int gugunCode,  int foodCode) throws SQLException {
		List<FoodDto> list = new ArrayList<>();
		if (areaCode >= 9) areaCode += 22;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select title, addr1, first_image, latitude, longitude ");
		sql.append(" from attraction_info \n");
		sql.append(" where content_type_id = 39 and sido_code = ? ");
		if(gugunCode != 0) sql.append("and gugun_code = ? ");
		sql.append("\n limit 30 ");
		
		try (
				Connection con = db.getConnection();
				PreparedStatement stmt = con.prepareStatement(sql.toString());
				
			) {
				int index = 1;
				stmt.setInt(index++, areaCode);
				if(gugunCode != 0) stmt.setInt(index++, gugunCode);
//				stmt.setInt(index++, foodCode);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
					FoodDto foodDto = new FoodDto();
					foodDto.setTitle(rs.getString("title"));
					foodDto.setAddress(rs.getString("addr1"));
					foodDto.setImage(rs.getString("first_image"));
					
					double latitude = rs.getDouble("latitude");
					double longtitude = rs.getDouble("longitude");

					
					foodDto.setMapx(rs.getDouble("longitude"));
					foodDto.setMapy(rs.getDouble("latitude"));
					
					foodDto.setAreaCode(areaCode);
					
					double distance = Haversine(latitude, longtitude, nowLat, nowLong);
					foodDto.setDistance(Math.round(distance * 100) / 100.0); // 둘째자리까지
					
					foodDto.setFoodCode(foodCode);
					list.add(foodDto);
				}	
			}
		return list;
	}
	
	public static double Haversine(double x1, double y1, double x2, double y2) {
	    double distance;
	    double radius = 6371; // 지구 반지름(km)
	    double toRadian = Math.PI / 180;

	    double deltaLatitude = Math.abs(x1 - x2) * toRadian;
	    double deltaLongitude = Math.abs(y1 - y2) * toRadian;

	    double sinDeltaLat = Math.sin(deltaLatitude / 2);
	    double sinDeltaLng = Math.sin(deltaLongitude / 2);
	    double squareRoot = Math.sqrt(
	        sinDeltaLat * sinDeltaLat +
	        Math.cos(x1 * toRadian) * Math.cos(x2 * toRadian) * sinDeltaLng * sinDeltaLng);

	    distance = 2 * radius * Math.asin(squareRoot);

	    return distance;
	}
}