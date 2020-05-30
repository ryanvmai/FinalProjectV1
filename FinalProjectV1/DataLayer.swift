//
//  DataLayer.swift
//  FinalProjectV1
//
//  Created by Ryan Mai on 5/30/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import Foundation

let defaults = UserDefaults.standard
let encoder = JSONEncoder()
let decoder = JSONDecoder()

class DataLayer {
    
    init() { }

    let posts: [Post] = [
        .init(id: 0, profile: "ProfilePic1", location: "Gong Cha Tea", username: "ryanvmai", date: "May 25, 2020 at 1:35 PM", image: "Tea", description: "Hello!!", ad: false)
    ]

    func encodeData() {
        if let encodedData = try? encoder.encode(posts) {
            defaults.set(encodedData, forKey: "posts")
        }

    }

    func getPosts() -> [Post]? {
        if let encodedData = defaults.object(forKey: "posts") as? Data {
            do {
                return try decoder.decode([Post].self, from: encodedData)
            } catch {
                print("Error")
            }
        }
        return nil
    }

}
