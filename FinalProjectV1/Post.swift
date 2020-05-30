//
//  Post.swift
//  FinalProjectV1
//
//  Created by Ryan Mai on 5/30/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import Foundation

struct Post: Codable {
    let id: Int
    let profile, location, username, date, image, description: String
    let ad: Bool
    
    init(id: Int, profile: String, location: String, username: String, date: String, image: String, description: String, ad: Bool) {
        self.profile = profile
        self.id = id
        self.location = location
        self.username = username
        self.date = date
        self.image = image
        self.description = description
        self.ad = ad
    }
}
