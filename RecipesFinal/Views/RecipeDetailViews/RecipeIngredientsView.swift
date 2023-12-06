//
//  TitleView.swift
//  RecipeVault App
//

import SwiftUI

struct RecipeIngredientsView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            Text("~ INGREDIENTS ~")
                .font(.system(size: 15))
                .bold()
                .padding(.bottom)
            Text(recipe.ingredients)
                .font(.caption)
                .lineSpacing(10)
        }
        .padding()
        .background(Color.blue.opacity(0.3))
        .cornerRadius(40) // Add curved corners with the desired radius
        
    }
    
}

struct RecipeIngredientsView_Previews: PreviewProvider {
    static var recipeBox = RecipeBox()
    
    static var previews: some View {
        RecipeIngredientsView(recipe: recipeBox.allRecipes[0])
    }
}
