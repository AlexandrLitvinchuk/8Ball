//
//  Json.swift
//  URL
//
//  Created by Олександр Літвінчук on 01.02.2022.
//  Copyright © 2022 Олександр Літвінчук. All rights reserved.
//

import Foundation
// MARK: - Struct
struct Structer: Codable {
    let magic: Magic?
}

// MARK: - Magic
struct Magic: Codable {
    let question, answer, type: String?
}
