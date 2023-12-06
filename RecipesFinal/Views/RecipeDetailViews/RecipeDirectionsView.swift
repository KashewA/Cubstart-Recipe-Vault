//
//  TitleView.swift
//  RecipeVault App
//

import SwiftUI

struct RecipeDirectionsView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            Text("~ DIRECTIONS ~")
                .font(.system(size: 15))
                .bold()
                .padding(.bottom)
            Text(recipe.directions)
                .font(.caption)
                .lineSpacing(10)
        }
        .padding()
        .background(Color.gray.opacity(0.3)) // Use a gray background
        .cornerRadius(40) // Add curved corners with the desired radius
    }
}

struct RecipeDirectionsView_Previews: PreviewProvider {
    static var recipeBox = RecipeBox()
    
    static var previews: some View {
        RecipeDirectionsView(recipe: recipeBox.allRecipes[0])
    }
}
