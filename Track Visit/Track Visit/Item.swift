//
//  Item.swift
//  Track Visit
//
//  Created by Christos Bimpas on 18/07/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
