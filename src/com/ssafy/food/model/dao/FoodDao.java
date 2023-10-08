package com.ssafy.food.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.food.model.FoodDto;

public interface FoodDao {
	List<FoodDto> listFood(int areaCode, int gugunCode, int foodCode) throws SQLException;
}
