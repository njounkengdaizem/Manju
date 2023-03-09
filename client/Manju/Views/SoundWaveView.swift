//
//  SoundWaveView.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/4/23.
//

import SwiftUI

import SwiftUI

struct SoundWaveView: View {
    var audioData: [Float]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let centerY = height / 2
            let path = Path { path in
                path.move(to: CGPoint(x: 0, y: centerY))
                for i in 0..<audioData.count {
                    let x = CGFloat(i) / CGFloat(audioData.count) * width
                    let y = CGFloat(audioData[i]) * height / 2 + centerY
                    path.addLine(to: CGPoint(x: x, y: y))
                }
                path.addLine(to: CGPoint(x: width, y: centerY))
            }
            .stroke(Color.blue, lineWidth: 2)
            //.animation(.easeInOut(duration: 0.1))
            
            path
        }
    }
}


struct SoundWaveView_Previews: PreviewProvider {
    static var previews: some View {
        SoundWaveView(audioData: <#[Float]#>)
    }
}
