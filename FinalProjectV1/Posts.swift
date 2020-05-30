//
//  Posts.swift
//  FinalProjectV1
//
//  Created by Ryan Mai on 5/30/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import Foundation

struct Posts: Codable {
    var posts: [Post]
    
    init(posts: [Post]) {
        self.posts = posts
    }
}
