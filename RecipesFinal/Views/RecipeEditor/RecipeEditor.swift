//
//  TitleView.swift
//  RecipeVault App
//

import SwiftUI

struct RecipeEditor: View {
    @Binding var config: RecipeEditorConfig
    
    var body: some View {
        NavigationStack {
            RecipeEditorForm(config: $config)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(editorTitle)
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            config.cancel()
                        } label: {
                            Text("Cancel")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            config.done()
                        } label: {
                            Text("Save")
                        }
                    }
                }
        }
    }
    
    private var editorTitle: String {
        config.recipe.isNew ? "Add Recipe" : "Edit Recipe"
    }
}

struct RecipeEditor_Previews: PreviewProvider {
    static var previews: some View {
        RecipeEditor(config: .constant(RecipeEditorConfig()))
    }
}
