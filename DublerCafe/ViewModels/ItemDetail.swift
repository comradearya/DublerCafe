//
//  ItemDetail.swift
//
//  Created by arina.panchenko on 12.12.2021.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order:Order
    @State private var isOrderPressed = false
    @State private var okPressed = false
    let item: MenuItem
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
                Spacer()
            Button("Order This"){
                order.add(item: item)
                isOrderPressed = true
            }
            .buttonStyle(OrderButton())
            .popup(isPresented: isOrderPressed,
                   alignment: .top,
                   direction: .top,
                   content: {
                ZStack{
                    Text("Added")
                        .background(Color.white)
                        .foregroundColor(.orange)
                        .clipShape(Capsule())
                    
                }
            })
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OrderButton:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
