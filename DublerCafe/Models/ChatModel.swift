//
//  ChatModel.swift
//  DublerCafe
//
//  Created by arina.panchenko on 12.01.2022.
//

import Foundation

enum BubblePosition {
    case right, left
}

class ChatModel:ObservableObject {
    var text:String = ""
    @Published var arrayOfMessages:[String] = []
    @Published var arrayOfPositions:[BubblePosition] = []
    @Published var position = BubblePosition.right
}
