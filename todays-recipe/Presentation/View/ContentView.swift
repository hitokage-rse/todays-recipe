//
//  ContentView.swift
//  todays-recipe
//
//  Created by kagehito on 2022/12/02.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<RecipeSearch>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Button("Hello, world!") {
                viewStore.send(.searchRandomly)
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(
                initialState: RecipeSearch.State(),
                reducer: RecipeSearch()
            )
        )
    }
}
