//
//  ItemRow.swift
//
//  Created by arina.panchenko on 12.12.2021.
//

import Foundation
import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    let colors:[String:Color] = ["D" : .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
                HStack{ ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(3)
                        .background(colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                }
            }
            Spacer()
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View{
        ItemRow(item: MenuItem.example)
    }
}
