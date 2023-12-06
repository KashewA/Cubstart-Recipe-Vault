//
//  RecipesApp.swift
//  RecipeVault
//

import SwiftUI

@main
struct RecipesApp: App {
    @StateObject private var recipeBox = RecipeBox()
    @State private var selectedSidebarItem: SidebarItem? = .all
    @State private var selectedRecipeId: Recipe.ID?
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView(selection: $selectedSidebarItem)
            } content: {
                ContentListview(selection: $selectedRecipeId, selectedSidebarItem: selectedSidebarItem ?? .all)
            } detail: {
                DetailView(recipeId: $selectedRecipeId)
            }
            .environmentObject(recipeBox)

        }
        .modelContainer( for: [WishItem.self] )

    }
}
