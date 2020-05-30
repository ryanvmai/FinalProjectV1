//
//  LocationView.swift
//  FinalProjectV1
//
//  Created by Ryan Mai on 5/30/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    
    let posts: [Post] = [
        .init(id: 0, profile: "ProfilePic1", location: "Gong Cha Tea", username: "ryanvmai", date: "May 25, 2020 at 1:35 PM", image: "Tea", description: "Grabbing tea with my friends! Got Thai Iced Tea.. soo good! Must have.", ad: false),
            
        .init(id: 1, profile: "ProfilePic1", location: "Eataly, Boston", username: "ryanvmai", date: "May 25, 2020 at 1:35 PM", image: "Noodles", description: "Amazing pasta in Boston. My fav so far.", ad: false),
        
         .init(id: 3, profile: "ChipotleProfile", location: "Chipotle", username: "Chipotle", date: "", image: "ChipotlePost", description: "Ready for a burrito? Come on now and show us this post for free guac!", ad: true),
        
        .init(id: 2, profile: "ProfilePic1", location: "H Mart", username: "ryanvmai", date: "May 25, 2020 at 1:35 PM", image: "HMart", description: "You can never go wrong with the H Mart food court. Food was to die for. Can't wait to go back", ad: false)
        
    ]
    
    var body: some View {
        
        VStack (spacing: 20) {
            MapView()
            .edgesIgnoringSafeArea(.top)
            .frame(height: 250)
            
            Image("ChipotleProfile")
            .resizable()
            .frame(width: 130, height: 130)
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .offset(y: -108)
            .padding(.bottom, -130)
            
            VStack (alignment: .leading){
                Text("Chipotle Mexican Grill")
                    .font(.title)
                HStack {
                    Text("Oakton, VA")
                        .font(.subheadline)
                    Spacer()
                    Text("Open")
                        .foregroundColor(Color.green)
                }
            }
            .padding()
            Spacer()
            
            List {
                //remove !
                ForEach(refinePosts(posts), id: \.id) { post in
                    PostView(post: post)
                }
            }
           
        }
        
    }
    
    func refinePosts(_ posts: [Post]) -> [Post] {
        var postsTwo: Posts = Posts(posts: posts)
        for i in 0..<postsTwo.posts.count-1 {
            if postsTwo.posts[i].location != "Chipotle" {
                postsTwo.posts.remove(at: i)
            }
        }
        return postsTwo.posts
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
