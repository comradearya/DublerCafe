//
//  ChatView.swift
//  DublerCafe
//
//  Created by arina.panchenko on 12.01.2022.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var model = ChatModel()
    
    var body: some View {
        NavigationView{
            
            GeometryReader{
                geo in
                VStack{
                    //MARK:- ScrollView
                    ScrollView(scrollToEnd: true){
                        LazyVStack{
                            ForEach(0..<model.arrayOfMessages.count, id:\.self){ index in
                                ChatBubble(position: model.arrayOfPositions[index], color: model.arrayOfPositions[index] == BubblePosition.right ? .green : .blue){
                                    Text(model.arrayOfMessages[index])
                                }
                            }
                        }
                    }
                    .padding(.top)
                    //MARK:- TextEditor
                    HStack{
                        ZStack{
                            TextEditor(text: $model.text)
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .foregroundColor(.gray)
                        }
                        .frame(height: 50)
                        //.offset(x: 10, y: 10)
                        
                        Button("send"){
                            if model.text != "" {
                                model.position =/* model.position == BubblePosition.right ? BubblePosition.left :*/ BubblePosition.right
                                model.arrayOfPositions.append(model.position)
                                model.arrayOfMessages.append(model.text)
                                model.text = ""
                            }
                        }
                    }.padding()
                }
            }.navigationBarTitle("Запитай в нас")
                
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
