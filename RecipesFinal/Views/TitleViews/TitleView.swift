//
//  TitleView.swift
//  RecipeVault App
//

import SwiftUI

struct TitleView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Binding var recipe: Recipe
    
    var body: some View {
        HStack {
            switch horizontalSizeClass {
            case .compact:
                CompactTitleView(recipe: $recipe)
            default:
                RegularTitleView(recipe: $recipe)
            }
        }
        .padding()
        .background(
            Color.primary
                .colorInvert()
                .opacity(0.5)
        )
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(recipe: .constant(RecipeBox().allRecipes[0]))
    }
}
