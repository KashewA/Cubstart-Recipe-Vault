//
//  TitleView.swift
//  RecipeVault App
//

import SwiftUI

struct RecipeListItemView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            recipe.smallImage
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(20)

            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.title3)
                    .bold()
                    .colorInvert()
                Text(recipe.subtitle)
                    .font(.caption)
                    .colorInvert()
            }
            
            Spacer()
            
            if recipe.isFavorite {
                Image(systemName: "heart")
                    .symbolVariant(.fill)
                    .colorInvert()
            }
        }
        .padding()
        .background(Color.blue.opacity(0.5))
    }
}

struct RecipeListItemView_Previews: PreviewProvider {
    static let recipeBox = RecipeBox()
    
    static var previews: some View {
        RecipeListItemView(recipe: recipeBox.allRecipes[0])
    }
}
