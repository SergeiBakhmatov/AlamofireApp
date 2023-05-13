//
//  Fruit.swift
//  AlamofireApp
//
//  Created by Sergei Bakhmatov on 13.05.2023.
//

struct Fruit: Decodable {
    
    let name: String
    let family: String
    let genus: String
    let order: String
    let nutritions: Nutrition
    
    init(from fruitData: [String: Any]) {
        name = fruitData["name"] as? String ?? ""
        family = fruitData["family"] as? String ?? ""
        genus = fruitData["genus"] as? String ?? ""
        order = fruitData["order"] as? String ?? ""
        nutritions = Nutrition(from: fruitData["nutritions"] as? [String: Any] ?? ["": 0])
    }
    
    static func getFruits(from value: Any) -> [Fruit] {
        guard let fruitsData = value as? [[String: Any]] else { return [] }
        return fruitsData.map { Fruit(from: $0) }
    }
    
}

struct Nutrition: Decodable {
    let carbohydrates: Double
    let protein: Double
    let fat: Double
    let calories: Double
    let sugar: Double
        
    init(from fruitNutritionsData: [String: Any]) {
        carbohydrates = fruitNutritionsData["carbohydrates"] as? Double ?? 0
        protein = fruitNutritionsData["protein"] as? Double ?? 0
        fat = fruitNutritionsData["fat"] as? Double ?? 0
        calories = fruitNutritionsData["calories"] as? Double ?? 0
        sugar = fruitNutritionsData["sugar"] as? Double ?? 0
    }
}
