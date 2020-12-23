//
//  LeafView.swift
//  GAME
//
//  Created by User04 on 2020/12/17.
//

import SwiftUI

struct LeafView: View {
    var positionX: CGFloat = 0
    var positionY: CGFloat = 0
    var rotationDegrees: Double = 0
    var width: CGFloat = 0
    var body: some View {
      circule()
        //.fill(Color.green)
        .frame(width:width,height:width*9/8)
        .rotationEffect(.degrees(rotationDegrees))
        .offset(x:positionX,y:positionY)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
    }
}

struct LeafView_Previews: PreviewProvider {
    static var previews: some View {
        LeafView()
    }
}
