//
//  ViewA.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/4/23.
//

import SwiftUI


struct ViewA: View {
    var body: some View {
        ZStack{
            Color.blue
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(Color.white)
                .font(.system(size:150))
            Image("teal3")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}


//struct ViewA: View {
////    @State var posts: [Post] = []
//    var body: some View {
////        List(posts) { post in Text(post.title)
////
////        }.onAppear{
////            Api().getPosts{(posts) in
////                self.posts = posts
////            }}
////                )
//        ZStack{
