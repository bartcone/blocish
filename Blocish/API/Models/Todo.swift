//
//  Todo.swift
//  Blocish
//
//  Created by Bart Cone on 12/14/23.
//

import Foundation

struct Todo: Equatable, Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case description
    }
}
