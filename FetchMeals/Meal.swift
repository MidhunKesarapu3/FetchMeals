//
//  Meal.swift
//  FetchMeals
//
//  Created by Midhun Kesarapu on 7/9/24.
//


import Foundation

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String?
}

struct MealListResponse: Codable {
    let meals: [Meal]
}

struct MealDetailResponse: Codable {
    let meals: [MealDetail]
}

struct MealDetail: Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
//    let strIngredients: [String]
}
