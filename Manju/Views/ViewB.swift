//
//  ViewB.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/4/23.
//

import SwiftUI

struct ViewB: View {
    @State private var showDetails = false
    @State private var micScale: CGFloat = 1.0
    var body: some View {
        ZStack(alignment: .center){
            Color.white
            VStack{
                Spacer()
                    .frame(height:50)
                VStack{
                    ZStack(alignment: .center){
                        Image("momma")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 500.0, height: 150.0, alignment: .center)
                            .clipShape(Circle())
                    }
                }
                Spacer()
                    .frame(height:40)
                HStack {
                    VStack (alignment: .center, spacing: 27) {
                        Text(" Good Morning. \n How can I assist you today?")
                            .font(.custom("Helvetica", size: 20.0))
                            .multilineTextAlignment(.leading)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                            .listRowSeparator(.hidden)
                            .overlay(alignment:.topLeading){
                                Image(systemName: "arrowtriangle.up.fill")
                                    .font(.title)
                                    .rotationEffect(.degrees((200)))
                                    .offset(x: -0.02 * UIScreen.main.bounds.width, y: -0.01 * UIScreen.main.bounds.width)
                                    .foregroundColor(.blue)
                            }
                    }
                }
                
                Spacer()
                    .frame(height:40)
                HStack {
                    VStack(alignment: .center, spacing:27){
                        Button(action: {
                            self.showDetails.toggle()
                        }) {
                            Text("What's the weather?")
                                .font(.system(size: 15, weight: .light, design: .default))
                                .foregroundColor(.gray)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.cyan.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            Button(action: {
                                self.showDetails.toggle()
                            }) {
                                Text("Help Me")
                                    .font(.system(size: 15, weight: .light, design: .default))
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color.gray.opacity(0.1))
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                        }
                        .padding(.bottom, 20)
                  
                    }
                }
                Spacer().frame(height: 5)
                HStack {
                    VStack(alignment: .center, spacing:27){
                        Button(action: {
                            self.showDetails.toggle()
                        }) {
                            Text("What's the time?")
                                .font(.system(size: 15, weight: .light, design: .default))
                                .foregroundColor(.gray)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            Button(action: {
                                self.showDetails.toggle()
                            }) {
                                Text("Joke Please?")
                                    .font(.system(size: 15, weight: .light, design: .default))
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color.cyan.opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                        }
                        .padding(.bottom, 20)
                        .opacity(0.8)
                    }
                }
                Spacer()
                VStack{
                    Button(action: {
                        showDetails.toggle()
                    }) {
                        Text("Ask me anything")
                            .font(.system(size: 20, weight: .light, design: .default))
                            .padding(.bottom, 20)
                            .foregroundColor(.blue)
                    }
                    HStack {
                        VStack(spacing: 20){
                            Image(systemName: "mic.circle.fill")
                                .foregroundColor(Color.blue.opacity(0.5))
                                .font(.system(size:70))
                                .scaleEffect(micScale)
                                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                        } .frame(width: 0, alignment: .center)
                    }
                    .onAppear {
                        withAnimation {
                            micScale = 1.3}
                    }
                    Spacer()
                        .frame(height: 50)
             
                }.frame(maxWidth: .infinity)
            }.padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .edgesIgnoringSafeArea(.top)
        .preferredColorScheme(.dark)
     
    }
    
    struct ViewB_Previews: PreviewProvider {
        static var previews: some View {
            ViewB()
        }
    }
}
