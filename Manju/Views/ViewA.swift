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
            Color.red
            Image(systemName: "ellipsis.message")
                .foregroundColor(Color.white)
                .font(.system(size:150))
        }
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}
