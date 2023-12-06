//
//  TitleView.swift
//  RecipeVault App
//

import SwiftUI

struct RegularTitleView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.title)
                .font(.largeTitle)
                .bold()
                .padding(5)
            StarRating(rating: $recipe.rating)
        }
        Spacer()
        Text(recipe.subtitle)
            .font(.subheadline)
    }
}

struct RegularTitleView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            RegularTitleView(recipe: .constant(RecipeBox().allRecipes[0]))
        }
    }
}
