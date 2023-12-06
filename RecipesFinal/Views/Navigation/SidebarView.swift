//
//  SidebarView.swift
//  RecipeVault
//

import SwiftUI

enum SidebarItem: Hashable {
    case all, favorites, recents
    case collection(String)
    
    var title: String {
        switch self {
        case .all:
            return "All Recipes"
        case .favorites:
            return "Favorites"
        case .recents:
            return "Recents"
        case .collection(let name):
            return name
        }
    }
}

struct SidebarView: View {
    @Binding var selection: SidebarItem?
    @EnvironmentObject var recipeBox: RecipeBox
    @State var wishlist = false

    
    var body: some View {
        List(selection: $selection) {
            VStack {
                Image("AppIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                
                Text("RecipeVault")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .background(Color.blue.opacity(0.5))
            .listRowInsets(EdgeInsets())
            
            Section("Library") {
                NavigationLink(value: SidebarItem.all) {
                    Text(SidebarItem.all.title)
                }
                NavigationLink(value: SidebarItem.favorites) {
                    Text(SidebarItem.favorites.title)
                }
                NavigationLink(value: SidebarItem.recents) {
                    Text(SidebarItem.recents.title)
                }
            }
            
            Section("Collections") {
                ForEach(recipeBox.collections, id: \.self) { collectionName in
                    NavigationLink(value: SidebarItem.collection(collectionName)) {
                        Text(collectionName)
                    }
                }
            }
            
            HStack {
                Spacer()
                Text("Welcome back, it is \(getCurrentTime()).")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color.blue.opacity(0.5))
                    .padding()
                Spacer()
            }
        }
        .listStyle(SidebarListStyle())
        
        Spacer()
            .frame(height:30)
        Button {
            wishlist.toggle()
        } label: {
            Text("View Wishlist")
        }
        
        .sheet(isPresented: $wishlist) {
            
        } content: {
            WishlistView()
        }
    }
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplitView {
            SidebarView(selection: .constant(nil))
        } detail: {
            Text("Detail Preview")
        }
        .environmentObject(RecipeBox())
    }
}
