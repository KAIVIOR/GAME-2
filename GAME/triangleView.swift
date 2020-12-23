//
//  triangleView.swift
//  GAME
//
//  Created by User09 on 2020/12/23.
//

import SwiftUI

struct triangleView: View {
        var positionX: CGFloat = 0
        var positionY: CGFloat = 0
        var rotationDegrees: Double = 0
        var width: CGFloat = 0
        var body: some View {
          triangle()
            .frame(width:width,height:width*2)
            .rotationEffect(.degrees(rotationDegrees))
            .offset(x:positionX,y:positionY)
            .shadow(radius: 10 )
        
    }
}

struct triangleView_Previews: PreviewProvider {
    static var previews: some View {
        triangleView()
    }
}
