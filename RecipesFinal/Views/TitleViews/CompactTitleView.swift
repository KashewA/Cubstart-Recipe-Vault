//
//  TitleView.swift
//  RecipeVault App
//

import SwiftUI

struct CompactTitleView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Spacer()
        VStack {
            Text(recipe.title)
                .font(.title2)
                .bold()
                .padding(5)
            StarRating(rating: $recipe.rating)
            Text(recipe.subtitle)
                .font(.subheadline)
                .padding(5)
        }
        Spacer()
    }
}

struct CompactTitleView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CompactTitleView(recipe: .constant(RecipeBox().allRecipes[0]))
        }
    }
}
