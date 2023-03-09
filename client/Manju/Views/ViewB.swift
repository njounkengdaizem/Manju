//
//  ViewB.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/4/23.
//

import SwiftUI
import AVKit
import AVFoundation

struct ViewB: View {
    @State private var showDetails = false
    @State private var isMicActive = false
    @State private var micScale: CGFloat = 1.0
    @State var UserResponse: [UserResponse] = []
    let synthesizer = AVSpeechSynthesizer()


    var body: some View {
        ZStack(alignment: .center){
            VStack{
                Spacer()
                HStack {
                    VStack (alignment: .center, spacing: 27) {
                        Text(" I Am Manju")
                            .font(.system(size: 25.0, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, UIScreen.main.bounds.width + UIScreen.main.bounds.width/1.5)
                    }
                }
                Spacer()
            }
            VStack{
                Spacer()
                HStack {
                    VStack (alignment: .center, spacing: 27) {
                        Text("'Manju, tell me a python joke'")
                            .font(.system(size: 20.0, weight: .light))
                            .italic()
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, UIScreen.main.bounds.width + UIScreen.main.bounds.width/2.3)
                    }
                }
                Spacer()
            }
            .preferredColorScheme(.dark)
            
            ZStack {
                Image("teal")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width/10, height: UIScreen.main.bounds.width/2.5, alignment: .center)
                Spacer().frame(height: UIScreen.main.bounds.width)
            
                
                Button(action: {
                    self.isMicActive.toggle()
                } )
                {
                    Image(systemName: isMicActive ? "mic.fill" : "mic")
                        .font(.system(size: 60))
                        .scaleEffect(micScale)
                        .foregroundColor(isMicActive ? .teal : .teal)
                        .animation(isMicActive ? Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true) : .none)
                }
                .padding(.top, 0)
                .offset(y: -UIScreen.main.bounds.width/100)
                .onAppear(){
                    startSpeech(say:"Hello, ask me anything")
                    startSpeech(say: "For example: Manju what is the time?")
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .background(
            Image("back2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
    
func startSpeech(say: String) {
    let utterance = AVSpeechUtterance(string: say)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
    utterance.rate = 0.55
    synthesizer.speak(utterance)
}

   
struct ViewB_Previews: PreviewProvider {
        static var previews: some View {
            ViewB()
        }
    }
}


