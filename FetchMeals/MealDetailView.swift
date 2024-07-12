//
//  MealDetailView.swift
//  FetchMeals
//
//  Created by Midhun Kesarapu on 7/9/24.
//


import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @State private var mealDetail: MealDetail?

    var body: some View {
        VStack {
            if let mealDetail = mealDetail {
                Text(mealDetail.strMeal)
                    .font(.largeTitle)
                    .padding()

                Text(mealDetail.strInstructions)
                    .padding()

//                List {
//                    ForEach(mealDetail.strIngredients, id: \.self) { ingredient in
//                        Text(ingredient)
//                    }
//                }
            } else {
                ProgressView("Loading...")
            }
        }
        .onAppear {
            Task {
                do {
                    mealDetail = try await NetworkManager.shared.fetchMealDetails(mealID: mealID)
                } catch {
                    print("Failed to fetch meal details: \(error)")
                }
            }
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealID: "52772")
    }
}
