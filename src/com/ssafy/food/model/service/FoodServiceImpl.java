package com.ssafy.food.model.service;

import java.util.List;

import com.ssafy.food.model.FoodDto;
import com.ssafy.food.model.dao.FoodDao;
import com.ssafy.food.model.dao.FoodDaoImpl;

public class FoodServiceImpl implements FoodService {
	private static FoodService foodService = new FoodServiceImpl();
	private FoodDao foodDao;
	
	private FoodServiceImpl() {
		foodDao = FoodDaoImpl.getInstance();
	}
	public static FoodService getFoodService() {
		return foodService;
	}

	
	@Override
	public List<FoodDto> listFood(int areaCode, int gugunCode, int foodCode) throws Exception {
		return foodDao.listFood(areaCode, gugunCode, foodCode);
	} 
	
}
