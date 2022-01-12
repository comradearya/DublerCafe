//
//  Popup.swift
//  
//
//  Created by arina.panchenko on 23.12.2021.
//

import SwiftUI

struct Popup<T:View>: ViewModifier{
    let popup:T
    let isPresented: Bool
    let alignment: Alignment
    let direction:Direction
    
    init(isPresented:Bool, alignment:Alignment, direction:Direction, @ViewBuilder content:() -> T){
        self.isPresented = isPresented
        self.alignment = alignment
        self.direction = direction
        self.popup = content()
    }
    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }
    
    @ViewBuilder private func popupContent() -> some View {
        GeometryReader {
            geometry in
            if isPresented {
                popup
                    .animation(.spring())
                    .transition(.offset(x: 0, y: geometry.belowScreenEdge))
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: alignment)
            }
        }
    }
}

private extension GeometryProxy {
    var belowScreenEdge: CGFloat{
        UIScreen.main.bounds.height - frame(in: .global).minY
    }
}

struct Popup_Previews: PreviewProvider {

    static var previews: some View {
        Preview()
            .previewDevice("iPod touch")
    }

    // Helper view that shows a popup
    struct Preview: View {
        @State var isPresented = false

        var body: some View {
            ZStack {
                Color.clear
                VStack {
                    Button("Toggle", action: { isPresented.toggle() })
                    Spacer()
                }
            }
            .modifier(Popup(isPresented: isPresented,
                            alignment: .center,
                            direction: .top,
                            content: { Color.yellow.frame(width: 100, height: 100) }))
        }
    }
}
