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
    
    var body: some View {
        NavigationView {
            Form {
                Text("Add Card Form")
                
                TextField("Name", text: $name)
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
