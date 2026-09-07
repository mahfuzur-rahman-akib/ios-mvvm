//
//  Manager.swift
//  Football IoS
//
//  Created by Mahfuzur Rahman on 9/7/26.
//

import Foundation

enum JobType {
    case manager
    case headCoach
}

struct Manager {
    let name: String
    let job : JobType
}
