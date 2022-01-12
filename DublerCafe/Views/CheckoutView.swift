//
//  CheckoutView.swift
//  
//
//  Created by arina.panchenko on 15.12.2021.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order:Order
    let paymentTypes = ["Cash","Credic Card", "Points"]
    let tipAmounts = [10, 15,20, 25, 0]
    @State private var showingPaymentAlert = false
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    
    
    var totalPrice:String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
        
    }
    
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType){
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                }
                Toggle("Add loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails { TextField("Enter you ID", text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?"), content: {
                Picker("Percentage:", selection: $tipAmount){
                    ForEach(tipAmounts, id: \.self){
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            })
            
            Section(header: Text("Total: \(totalPrice)").font(.largeTitle)){
                Button("Confirm order"){
                    showingPaymentAlert.toggle()
                }
            }
            .navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showingPaymentAlert){
                Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) - thank you!"), dismissButton: .default(Text("OK")))            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
