//
//  Team.swift
//  Football IoS
//
//  Created by Mahfuzur Rahman on 9/7/26.
//

import Foundation

class Team {
    let id: TeamType
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaying: Bool = false
    
    internal init(id: TeamType, name: String, info: String, manager: Manager, founded: String, isPlaying: Bool = false) {
        self.id = id
        self.name = name
        self.info = info
        self.manager = manager
        self.founded = founded
        self.isPlaying = false
    }
}
