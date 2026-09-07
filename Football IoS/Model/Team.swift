//
//  Team.swift
//  Football IoS
//
//  Created by Mahfuzur Rahman on 9/7/26.
//

import Foundation

struct Team {
    let id: TeamType
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaying: Bool = false
}
