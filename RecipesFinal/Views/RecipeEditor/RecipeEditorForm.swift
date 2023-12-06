//
//  TitleView.swift
//  RecipeVault App
//

import SwiftUI

struct RecipeEditorForm: View {
    @Binding var config: RecipeEditorConfig
    
    var body: some View {
        VStack {
            Text("👨‍🍳 Create Recipe 👩‍🍳")
                .font(.system(size: 25))  // Adjust the size as needed
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(10)
            
            Form {
                Section(header: Text("Recipe Details").foregroundColor(.black)) {
                    TextField("Recipe Name", text: $config.recipe.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.yellow.opacity(0.3))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("Servings", text: $config.recipe.servings)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("Preparation Time", text: $config.recipe.prepTimeAsText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("Cook Time", text: $config.recipe.cookTimeAsText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("Meal Type (Breakfast, Lunch, Dinner)", text: $config.recipe.collectionAsText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Section(header: Text("Ingredients").foregroundColor(.black)) {
                    TextField("Enter Ingredients Here", text: $config.recipe.ingredients)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Section(header: Text("Directions").foregroundColor(.black)) {
                    TextField("Enter Directions Here", text: $config.recipe.directions)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
        .background(Color.blue.opacity(0.3)) // Set the background color of the entire view
    }
}

struct RecipeEditorForm_Previews: PreviewProvider {
    static var previews: some View {
        RecipeEditorForm(config: .constant(RecipeEditorConfig()))
    }
}
