//
//  TitleView.swift
//  RecipeVault App
//

import Foundation

struct RecipeEditorConfig {
    var recipe = Recipe.emptyRecipe()
    var shouldSaveChanges = false
    var isPresented = false
    
    mutating func presentAddRecipe(sidebarItem: SidebarItem) {
        recipe = Recipe.emptyRecipe()
        
        switch sidebarItem {
        case .favorites:
            // Adds Recipe to Favorites.
            recipe.isFavorite = true
        case .collection(let name):
            recipe.collections = [name]
        default:
            break
        }
        
        shouldSaveChanges = false
        isPresented = true
    }
    
    mutating func done() {
        shouldSaveChanges = true
        isPresented = false
    }
    
    mutating func cancel() {
        shouldSaveChanges = false
        isPresented = false
    }
}
