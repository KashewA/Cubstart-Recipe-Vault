//
//  Wish.swift
//  RecipesFinal
//
//  Created by Kaashvi Agnihotri on 12/5/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class WishItem {
    var wish: String
    var recipe: String
    
    init(wish: String, recipe: String) {
        self.wish = wish
        self.recipe = recipe
    }
}
