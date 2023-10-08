package com.ssafy.food.model.service;

import java.util.List;

import com.ssafy.food.model.FoodDto;

public interface FoodService {
	List<FoodDto> listFood(int areaCode, int gugunCode, int foodCode) throws Exception;
}
