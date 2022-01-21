//
//  ContentView.swift
//  IdeaOfState
//
//  Created by Giuseppe Mazzilli on 13/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            List(viewModel.data, id: \.self) { item in
                Text(item)
            }
            
            HStack {
                Toggle("Autentication", isOn: $viewModel.authStatus)
                    .padding()
            }
            
            HStack {
                Button("Delete") {
                    if !viewModel.data.isEmpty {
                        viewModel.data.removeLast()
                    }
                }.padding()
                
                Spacer()
                
                Button("Update") {
                    viewModel.update()
                }.padding()
                
                Spacer()
                
                Button("Refresh") {
                    viewModel.refresh()
                }.padding()
            }
            
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(store: Store.shared))
    }
}
