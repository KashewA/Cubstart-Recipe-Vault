//
//  TitleView.swift
//  RecipeVault App
//

import SwiftUI

struct RecipeNotSelectedView: View {
    var body: some View {
        VStack {
            Text("No recipe currently selected.")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()

            Text("Choose a recipe from the prior menu.")
                .font(.system(size: 15))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()

            Text("😃🍲🍴")
                .font(.system(size: 50))  // Adjust the size as needed
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct RecipeNotSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeNotSelectedView()
    }
}
