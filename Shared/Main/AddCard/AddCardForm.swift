//
//  AddCardForm.swift
//  MyBills (iOS)
//
//  Created by Carlos Henrique Pereira do Carmo on 20/08/22.
//

import SwiftUI

struct AddCardForm: View {
    
    @Environment(\.presentationMode) var presentationMode
//    @Binding var shouldPresentAddCardForm: Bool

    @State private var name = ""
    @State private var cardNumber = ""
    @State private var limit = ""
    
    @State private var cardType = "Visa"
    
    @State private var month = 1
    @State private var year = Calendar.current.component(.year, from: Date())
    
    @State private var color = Color.blue
    
    let currentYear = Calendar.current.component(.year, from: Date())

    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Card Info")) {
                    TextField("Name", text: $name)
                    TextField("Credi Card Number", text: $cardNumber)
                        .keyboardType(.numberPad)
                    TextField("Credit Limit", text: $limit)
                        .keyboardType(.numberPad)
                    
                    Picker("Type", selection: $cardType) {
                        ForEach(["Visa","Mastercard", "Discover"], id: \.self) { cardType in
                            Text(String(cardType)).tag(String(cardType))
                        }
//                        Text("Visa").tag("Visa")
//                        Text("Mastercard").tag("Mastercard")
//                        Text("Discover").tag("Discover")
                    }
                }
                
                Section(header: Text("Expiration")) {
                    Picker("Month", selection: $month) {
                        ForEach(1..<13, id: \.self) { num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                    
                    Picker("Year", selection: $year) {
                        ForEach(currentYear..<currentYear + 20, id: \.self) { num in
                            Text(String(num)).tag(String(num))
                        }
                    }
                }
                
                Section(header: Text("Color")) {
                    ColorPicker("Color", selection: $color)
                }
            }
            .navigationTitle("Add Credit Card")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
//                        shouldPresentAddCardForm.toggle()
                    }, label: {
                        Text("Cancel")
                    })
                }
            }
            // deprecated to iOS 14
//                            .navigationBarItems(leading:
//                                                    Button(action: {
//                                shouldPresentAddCardForm.toggle()
//                            }, label: {
//                                Text("Cancel")
//                            })
//                            )
        }
    }
}
struct AddCardForm_Previews: PreviewProvider {
    static var previews: some View {
        AddCardForm()
    }
}
