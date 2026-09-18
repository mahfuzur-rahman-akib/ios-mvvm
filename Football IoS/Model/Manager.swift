//
//  Manager.swift
//  Football IoS
//
//  Created by Mahfuzur Rahman on 9/7/26.
//

import Foundation

enum JobType : String{
    case manager = "Manager"
    case headCoach = "Head Coach"
}

struct Manager {
    let name: String
    let job : JobType
}
