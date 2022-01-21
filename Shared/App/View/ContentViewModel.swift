//
//  ContentViewModel.swift
//  IdeaOfState
//
//  Created by Giuseppe Mazzilli on 13/01/22.
//

import SwiftUI

class ContentViewModel: ObservableObject, ViewModelWithState {
    @Published var data: Array<String>
    @Published var authStatus: Bool
        
    private let store: Store
    private var localState: ContentViewState
    
    init(store: Store) {
        self.store = store
        self.localState = store.state[ContentViewState.self]
        
        data = localState.data
        authStatus = localState.authStatus
    }
    
    func refresh() {
        localState = store.state[ContentViewState.self]
        data = localState.data
        authStatus = localState.authStatus
    }
    
    func update() {
        store.state[ContentViewState.self] = ContentViewState(data: data, authStatus: authStatus)
    }
    
}



