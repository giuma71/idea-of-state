//
//  Framework.swift
//  IdeaOfState (iOS)
//
//  Created by Giuseppe Mazzilli on 20/01/22.
//

import SwiftUI

// MARK: - Abstracts


/// Protocol constraint for initializable concrete type from meta type
protocol ViewState {
    init()
}

protocol ViewModelWithState {
    /// This function is called to  local ViewState from Store ViewState and update ViewModel published properties.
    func refresh()
    /// This function is called to update Store ViewState from local ViewState
    func update()
}

// MARK: - Concrete

/// This class is a wrapper to access ViewState dictionary, and create a new element in case doesn't exists
// TODO: - fix subscript to support multiple instance of same ViewState.
class ViewStateContainer {
    private var state: [String: ViewState]
    
    init() {
        state = [:]
    }
    
    subscript<S: ViewState>(identifier: S.Type) -> S {
        get { state["\(S.self)"] as? S ?? S() }
        set(newValue) { state["\(S.self)"] = newValue }
    }
}

/// Store will handle navigation routing and views state
class Store {
    static let shared = Store()
    var state: ViewStateContainer
    
    private init() {
        state = ViewStateContainer()
    }
}

