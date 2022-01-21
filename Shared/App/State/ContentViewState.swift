//
//  ContentViewState.swift
//  IdeaOfState
//
//  Created by Giuseppe Mazzilli on 20/01/22.
//

import Foundation

struct ContentViewState: ViewState {
    var data: Array<String>
    var authStatus: Bool
    
    init() {
        self.data = ["one", "two", "three"]
        self.authStatus = false
    }
    
    init(data: Array<String>, authStatus: Bool) {
        self.data = data
        self.authStatus = authStatus
    }
}
