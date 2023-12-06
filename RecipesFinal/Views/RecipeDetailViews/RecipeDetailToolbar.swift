//
//  TitleView.swift
//  RecipeVault App
//

import SwiftUI

struct RecipeDetailToolbar: ToolbarContent {
    @Binding var recipe: Recipe
    @Binding var showDeleteConfirmation: Bool
    let deleteRecipe: () -> Void

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                withAnimation {
                    recipe.isFavorite.toggle()
                }
            } label: {
                Image(systemName: "heart")
                    .symbolVariant(recipe.isFavorite ? .fill : .none)
            }
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(role: .destructive) {
                showDeleteConfirmation = true
            } label: {
                Image(systemName: "trash")
            }
            .alert("Delete Recipe?", isPresented: $showDeleteConfirmation) {
                Button(role: .destructive) {
                    withAnimation {
                        deleteRecipe()
                    }
                } label: {
                    Text("Delete \(recipe.title)")
                }

            }
        }
    }
}
