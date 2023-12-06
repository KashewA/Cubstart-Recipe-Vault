//
//  CardDetailView.swift
//  FlashCards
//
//  Created by Kaashvi Agnihotri on 11/3/23.
//

import Foundation
import SwiftUI

struct WishDetailView: View {
    @Environment (\.modelContext) private var modelContext
    @Environment (\.dismiss) private var dismiss
    @State var card: WishItem
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Item:")
                    .bold()
                TextEditor(text: $card.wish)
                    .padding(4)
                    .frame(height: 200)
                Text("Recipe:")
                    .bold()
                TextEditor(text: $card.recipe)
                    .padding(4)
                    .frame(height: 200)
                }
                .padding()
                .background(.mint.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .padding()
                .shadow(color: .white.opacity(0.3), radius: 20)
            HStack {
                saveButton
                Spacer()
                    .frame(width: 150)
                deleteButton
            }
        }
    }
    
    private var saveButton: some View {
        Button(action: {
            try? modelContext.save()
            dismiss()
        }) {
            Image(systemName: "checkmark")
                .foregroundStyle(.white)
                .font(.system(size: 20))
                .padding()
                .background(.green.opacity(0.5))
                .clipShape(Circle())
        }
    }
    
    private var deleteButton: some View {
        Button(action: {
            modelContext.delete(card)
            dismiss()
        }) {
            Image(systemName: "trash")
                .foregroundStyle(.white)
                .font(.system(size: 20))
                .padding()
                .background(.red.opacity(0.5))
                .clipShape(Circle())
        }
    }
}

