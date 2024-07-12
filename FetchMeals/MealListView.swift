//
//  MealListView.swift
//  FetchMeals
//
//  Created by Midhun Kesarapu on 7/9/24.
//

import SwiftUI

struct MealListView: View {
    @State private var meals: [Meal] = []

    var body: some View {
        NavigationView {
            List(meals, id: \.idMeal) { meal in
                NavigationLink(destination: MealDetailView(mealID: meal.idMeal)) {
                    Text(meal.strMeal)
                }
            }
            .navigationTitle("Dessert Meals")
            .onAppear {
                Task {
                    do {
                        meals = try await NetworkManager.shared.fetchDessertMeals()
                    } catch {
                        print("Failed to fetch meals: \(error)")
                    }
                }
            }
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
