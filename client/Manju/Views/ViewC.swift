//
//  ViewC.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/4/23.
//

import SwiftUI

struct ViewC: View {
    var body: some View {
        ZStack{
            Color.blue
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(Color.white)
                .font(.system(size:150))
            Image("teal1")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ViewC_Previews: PreviewProvider {
    static var previews: some View {
        ViewC()
    }
}
