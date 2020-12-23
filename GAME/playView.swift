//
//  playView.swift
//  GAME
//
//  Created by User04 on 2020/12/17.
//

import SwiftUI

struct circule: Shape {
    func path(in rect: CGRect) ->Path{
        Path{(path) in
            path.move(to:CGPoint(x:rect.width,y:0))
            path.addQuadCurve(to: CGPoint(x:0,y:rect.height), control: CGPoint(x:rect.width/5,y:rect.height/5))
            path.addQuadCurve(to: CGPoint(x:rect.width,y:0), control: CGPoint(x:rect.width*17/20,y:rect.height*13/15))
            path.closeSubpath()
            
        }
    }
}
struct triangle: Shape {
    func path(in rect: CGRect) ->Path{
        Path{(path) in
            path.move(to:CGPoint(x:20,y:20))
            path.addLine(to: CGPoint(x: 20, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 100))
            path.addLine(to: CGPoint(x:20,y:20))
            
        }
    }
}
struct off {
   // var key = Int()
    var offset = CGSize.zero
    var newPosition = CGSize.zero
    var degrees: Double = 0
    var scale : CGFloat = 1
}
struct playView: View {
    @State private var scale: CGFloat = 1
    @State var color = Color.black
    @State var color1 = Color.green
    @State var color2 = Color.red
    @State var color3 = Color.yellow
    @State private var a = 1
    @State private var offset = CGSize.zero
    @State private var offset1 = CGSize.zero
    @State private var newPosition = CGSize.zero
    @State private var offset2 = CGSize.zero
    @State private var newPosition2 = CGSize.zero
    @State private var offset3 = CGSize.zero
    @State private var newPosition3 = CGSize.zero
    @State private var newPosition1 = CGSize.zero
    @State private var degrees: Double = 0
    @State private var offs = [off]()//葉子
    @State private var circ = [off]()
    @State private var rec = [off]()
    @State private var trai = [off]()
    //@State private var circle = [Int]()


   // @State private var play : [off] = []
    
    

    var body: some View {
     
       
        VStack{
            
            Text("PETER FLY")
            Spacer()
            //Image("1")
            ZStack{
                ForEach(0..<offs.count, id: \.self)
                 { (item) in

                         LeafView(positionX: -30, positionY: -140, rotationDegrees: 20, width: 30)
                            .foregroundColor(color3)
                            .offset(offs[item].offset)
                            .rotationEffect(Angle.degrees(offs[item].degrees))
                            .scaleEffect(offs[item].scale)
                             .gesture(
                                 DragGesture()
                                         .onChanged({(value) in
                                            offs[item].offset = CGSize(width: value.translation.width +  offs[item].newPosition.width, height: value.translation.height +  offs[item].newPosition.height)
                                         })
                                         .onEnded({(value) in
                                            offs[item].newPosition =  offs[item].offset
                                         })
                             )
                            .gesture(MagnificationGesture()
                                        .onChanged{value in
                                            offs[item].scale = value.magnitude
                                        })
                            .gesture(RotationGesture()
                                        .onChanged{
                                            angle in
                                            offs[item].degrees = angle.degrees
                                        })
                 }
                ForEach(0..<trai.count, id: \.self)
                 { (item) in

                    triangleView(positionX: -30, positionY: -140, rotationDegrees: 0, width:100)
                            .foregroundColor(color2)
                            .offset(trai[item].offset)
                            .rotationEffect(Angle.degrees(trai[item].degrees))
                        .scaleEffect(trai[item].scale)
                             .gesture(
                                 DragGesture()
                                         .onChanged({(value) in
                                            trai[item].offset = CGSize(width: value.translation.width +  trai[item].newPosition.width, height: value.translation.height +  trai[item].newPosition.height)
                                         })
                                         .onEnded({(value) in
                                            trai[item].newPosition =  trai[item].offset
                                         })
                             )
                        .gesture(MagnificationGesture()
                                    .onChanged{value in
                                        trai[item].scale = value.magnitude
                                    })
                            .gesture(RotationGesture()
                                        .onChanged{
                                            angle in
                                            trai[item].degrees = angle.degrees
                                        })
                 }
             
             
              
                ForEach(0..<rec.count, id: \.self)
                 { (item) in

                        Rectangle()
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle.degrees(degrees))
                            .foregroundColor(color)
                            .scaleEffect(rec[item].scale)
                            .offset(rec[item].offset)
                            .rotationEffect(Angle.degrees(rec[item].degrees))
                          
                           
                             .gesture(
                                 DragGesture()
                                         .onChanged({(value) in
                                            rec[item].offset = CGSize(width: value.translation.width +  rec[item].newPosition.width, height: value.translation.height +  rec[item].newPosition.height)
                                         })
                                         .onEnded({(value) in
                                            rec[item].newPosition =  rec[item].offset
                                         })
                             )
                            .gesture(MagnificationGesture()
                                        .onChanged{value in
                                            rec[item].scale = value.magnitude
                                        })
                            .gesture(RotationGesture()
                                        .onChanged{
                                            angle in
                                            rec[item].degrees = angle.degrees
                                        })
                 }
                ForEach(0..<circ.count, id: \.self)
                 { (item) in

                        Circle()
                           
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle.degrees(degrees))
                            .foregroundColor(color1)
                            .offset(circ[item].offset)
                            .rotationEffect(Angle.degrees(circ[item].degrees))
                            .scaleEffect(circ[item].scale)
                           
                             .gesture(
                                 DragGesture()
                                         .onChanged({(value) in
                                            circ[item].offset = CGSize(width: value.translation.width +  circ[item].newPosition.width, height: value.translation.height +  circ[item].newPosition.height)
                                         })
                                         .onEnded({(value) in
                                            circ[item].newPosition =  circ[item].offset
                                         })
                             )
                            .gesture(MagnificationGesture()
                                        .onChanged{value in
                                            circ[item].scale = value.magnitude
                                        })
                            .gesture(RotationGesture()
                                        .onChanged{
                                            angle in
                                            circ[item].degrees = angle.degrees
                                        })
                 }
                

            }
            HStack{
                Button(action: changeColor) {
                    Text("改變顏色")
                        .fontWeight(.bold)
                            //.font(.little)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .padding(5)
                            .border(Color.purple, width: 1)
                }
                Button(action: triangle) {
                    Text("新增三角形")
                        .fontWeight(.bold)
                            //.font(.little)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .padding(5)
                            .border(Color.purple, width: 1)
                }
                Button(action: addcircle) {
                    Text("新增圓形")
                        .fontWeight(.bold)
                            //.font(.little)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .padding(5)
                            .border(Color.purple, width: 1)
                }
                Button(action: leaf) {
                    Text("新增葉子")
                        .fontWeight(.bold)
                            //.font(.little)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .padding(5)
                            .border(Color.purple, width: 1)
                }
                Button(action: addrec ) {
                    Text("新增正方形")
                        .fontWeight(.bold)
                            //.font(.little)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .padding(5)
                            .border(Color.purple, width: 1)
                }
            }
           
        }
    }
    func changeColor()
    {
        
        if(a==1)
        {
            
            self.color = Color.orange
            self.color1 = Color.gray
            self.color2 = Color.green
            self.color3 = Color.red
            a=a+1
        }
        else if (a==2)
        {
            self.color = Color.green
            self.color1 = Color.red
            self.color2 = Color.black
            self.color3 = Color.yellow
            a=a+1
        }
        else if (a==3)
        {
            self.color = Color.blue
            self.color1 = Color.yellow
            self.color2 = Color.red
            self.color3 = Color.blue
            a=a+1
        }
        else
        {
            self.color = Color.pink
            self.color1 = Color.purple
            self.color2 = Color.green
            self.color3 = Color.gray
            a=1
        }
    }
     func addrec()
    {

        rec.append(off(offset: CGSize(width: 3, height: 3), newPosition: CGSize(width: 1, height: 1),degrees: 0))
     
    
    }
    func leaf()
   {

        offs.append(off(offset: CGSize(width: 3, height: 3), newPosition: CGSize(width: 1, height: 1),degrees: 0))

   }
    func addcircle()
   {

        circ.append(off(offset: CGSize(width: 3, height: 3), newPosition: CGSize(width: 1, height: 1),degrees: 0))

   }
    func triangle()
   {

        trai.append(off(offset: CGSize(width: 3, height: 3), newPosition: CGSize(width: 1, height: 1),degrees: 0))

   }
   
}

struct playView_Previews: PreviewProvider {
    static var previews: some View {
        playView()
    }
}
