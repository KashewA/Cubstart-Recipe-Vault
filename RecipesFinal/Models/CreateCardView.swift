//
//  CreateCardView.swift
//  FlashCards
//
//  Created by Kaashvi Agnihotri on 12/3/23.
//

import Foundation
import SwiftUI

struct CreateCardView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var wishItem = ""
    @State private var recipe = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mint.ignoresSafeArea()
                VStack {
                    Spacer()
                    mainFlashCard
                    Spacer()
                    createNewFlashCardButton
                    Spacer()
                }
            }
            .navigationTitle("Create New Flashcard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                        
                    }
                }
            }
        }
    }
    
        
        
        var mainFlashCard: some View {
            VStack {
                Text("WishList Item:")
                    .bold()
                TextEditor(text: $wishItem)
                    .padding(4)
                    .frame(height: 200)
                Text("Recipe:")
                    .bold()
                TextEditor(text: $recipe)
                    .padding(4)
                    .frame(height: 200)
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .padding()
                .shadow(color: .white.opacity(0.3), radius: 20)
            
            
        }
        
        var createNewFlashCardButton: some View {
            Button(action: {
                let newCard = WishItem(wish: wishItem, recipe: recipe)
                modelContext.insert(newCard)
                dismiss()
            }) {
                Text("Create New Card")
                    .foregroundStyle(.mint)
                    .bold()
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        
    
}
