//
//  ContentView.swift
//  FinalProjectV1
//
//  Created by Ryan Mai on 5/29/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    let posts: [Post] = [
        
        .init(id: 0, profile: "ProfilePic1", location: "Gong Cha Tea", username: "ryanvmai", date: "May 25, 2020 at 1:35 PM", image: "Tea", description: "Grabbing tea with my friends! Got Thai Iced Tea.. soo good! Must have.", ad: false),
            
        .init(id: 1, profile: "ProfilePic1", location: "Eataly, Boston", username: "ryanvmai", date: "May 25, 2020 at 1:35 PM", image: "Noodles", description: "Amazing pasta in Boston. My fav so far.", ad: false),
        
         .init(id: 3, profile: "ChipotleProfile", location: "Chipotle", username: "Chipotle", date: "", image: "ChipotlePost", description: "Ready for a burrito? Come on now and show us this post for free guac!", ad: true),
        
        .init(id: 2, profile: "ProfilePic1", location: "H Mart", username: "ryanvmai", date: "May 25, 2020 at 1:35 PM", image: "HMart", description: "You can never go wrong with the H Mart food court. Food was to die for. Can't wait to go back", ad: false)
    ]
    
   // let posts = DataLayer.init().getPosts()
    
    var body: some View {
        NavigationView {
            List {
                //remove !
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
            }
            .navigationBarTitle(Text("Pinned"))
        }
    }
}

struct PostView: View {
    
    @State var showingLocation = false
    @State var showingProfile = false
    
    let post: Post
    var inProfile = false
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            HStack (spacing: 20) {
                Image(post.profile)
                    .resizable()
                        .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
                    .clipped()
                VStack (alignment: .leading) {
//                    NavigationLink(destination: LocationView()) {
//                        Text(post.location).font(.title).fontWeight(.medium)
//                    }
                    Button(action: {self.showingLocation.toggle()}) {
                        Text(post.location).font(.title).fontWeight(.medium)
                    }.sheet(isPresented: $showingLocation) {
                        LocationView()
                    }
                    if post.ad {
                        Text("Paid Promotion").font(.subheadline).fontWeight(.semibold).foregroundColor(Color.gray)
                    }
                    if !inProfile {
//                        NavigationLink(destination: Profile()) {
//                            Text(post.username).font(.subheadline)
//                        }
                        Button(action: {self.showingProfile.toggle()}) {
                            Text(post.username).font(.subheadline)
                        }.sheet(isPresented: $showingProfile) {
                            Profile()
                        }
                    } else {
                        Text(post.username).font(.subheadline)
                    }
                    Text(post.date).font(.caption)
                }
            }.padding(.leading, 16).padding(.top, 16)
            
            VStack (alignment: .leading) {
                Image(post.image)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(20)
                Text(post.description)
            }.padding(.leading, 16)
            
        }.padding(.leading, -15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
