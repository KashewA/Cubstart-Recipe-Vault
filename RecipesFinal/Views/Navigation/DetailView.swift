//
//  DetailView.swift
//  RecipeVault
//

import SwiftUI

struct DetailView: View {
    @Binding var recipeId: Recipe.ID?
    @EnvironmentObject private var recipeBox: RecipeBox
    @State private var showDeleteConfirmation = false
    
    private var recipe: Binding<Recipe> {
        Binding {
            if let id = recipeId {
                return recipeBox.recipe(with: id) ?? Recipe.emptyRecipe()
            } else {
                return Recipe.emptyRecipe()
            }
        } set: { updatedRecipe in
            recipeBox.update(updatedRecipe)
        }
    }
    
    var body: some View {
        ZStack {
            if recipeBox.contains(recipeId) {
                RecipeDetailView(recipe: recipe)
                    .navigationTitle(recipe.wrappedValue.title)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        RecipeDetailToolbar(
                            recipe: recipe,
                            showDeleteConfirmation: $showDeleteConfirmation,
                            deleteRecipe: deleteRecipe
                        )
                    }
            } else {
                RecipeNotSelectedView()
            }
        }
    }
    
    private func deleteRecipe() {
        recipeBox.delete(recipe.id)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var recipeBox = RecipeBox()
    
    static var previews: some View {
        NavigationView {
            DetailView(recipeId: .constant(recipeBox.allRecipes[0].id))
                .environmentObject(recipeBox)
        }
        DetailView(recipeId: .constant(0))
            .environmentObject(recipeBox)
    }
}
