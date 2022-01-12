//
//  Popup+Extension.swift
//  
//
//  Created by arina.panchenko on 23.12.2021.
//

import SwiftUI

extension Popup{
    enum Direction{
        case top, bottom, center
        
        func offset(popupFrame:CGRect) -> CGFloat {
            switch self {
            case .top:
                let aboveEdgeScreen = -popupFrame.maxY
                return aboveEdgeScreen
            case .bottom:
                let belowEdgeScreen = UIScreen.main.bounds.height - popupFrame.minY
                return belowEdgeScreen
            case .center:
                let centerOfTheScreen = UIScreen.main.bounds.maxY / 2
                return centerOfTheScreen
            }
        }
    }
}

extension View {
    func popup<T: View>(
        isPresented: Bool,
        alignment: Alignment = .center,
        direction: Popup<T>.Direction = .center,
        @ViewBuilder content: () -> T
    ) -> some View {
        return modifier(Popup(isPresented: isPresented, alignment: alignment, direction: direction, content: content))
    }
}
