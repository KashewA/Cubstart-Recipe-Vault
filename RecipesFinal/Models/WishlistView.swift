

import SwiftUI
import SwiftData

struct WishlistView: View {
    @Query private var cards: [WishItem]
    @State private var isPresentingCreate = false
    
    var body: some View {
        NavigationStack {
            VStack{
                if cards.isEmpty {
                    VStack {
                        Text("No Wishes!")
                            .font(.title).bold()
                        Text("Click + to make a new wishlist item.")
                    }
                } else {
                    cardsCount
                    List(cards) { card in
                        CardView(card: card)
                            .frame(height:20)
                    }
                    .scrollContentBackground(.hidden)
                    
                }
            }
            .navigationTitle("My Wishlist Items")
            .toolbar {
                Button(action: {
                    isPresentingCreate.toggle()
                }) {
                    Image(systemName: "plus")
                        .foregroundStyle(.mint)
                }
            }
            .sheet(isPresented: $isPresentingCreate) {
                CreateCardView()
            }
        }
    }
    
    private var cardsCount: some View {
            Text("\(cards.count) Cards")
                .bold()
                .padding(10)
                .background(.indigo.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct CardView: View {
    var card: WishItem
    
    var body: some View {
        NavigationLink(destination: {
            WishDetailView(card: card)
        }) {
            VStack(alignment: .leading) {
                Text("\(card.wish)")
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        .padding(10)
        .background(.mint)
        .clipShape(RoundedRectangle(cornerRadius:10))
        .frame(height:150)
        .listRowSeparator(.hidden)
    }
}
#Preview {
    ContentView()
}
