//
//  MainView.swift
//  MyBills (iOS)
//
//  Created by Carlos Henrique Pereira do Carmo on 20/08/22.
//

import SwiftUI

struct MainView: View {
    @State private var shouldPresentAddCardForm = false

    var body: some View {
        NavigationView {
            ScrollView {
                
                TabView {
                    ForEach(0..<5) { num in
                        CreditCardView()
                            .padding(.bottom, 50)
                        }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 280)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                // hack
//                .onAppear {
//                    shouldPresentAddCardForm.toggle()
//                }
                
                // bug in iOS 14.0 - 14.5 where you can't present multiple fullScreenCovers
                
                Spacer()
                    .fullScreenCover(isPresented: $shouldPresentAddCardForm, onDismiss: nil) {
                        AddCardForm()
//                      AddCardForm(shouldPresentAddCardForm: $shouldPresentAddCardForm)
                    }
                
                
            }
            .navigationTitle("Credit Cards")
            .navigationBarItems(trailing: addCardButton)
        }
    }
    
    struct CreditCardView: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Text("Apple Blue Visa Card")
                    .font(.system(size: 24, weight: .semibold))
                
                HStack {
                    Image("visa")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 44)
                        .clipped()
                    Spacer()
                    Text("Balance: $5,000")
                        .font(.system(size: 18, weight: .semibold))
                }
                
                Text("1234 1234 1234 1234")
                
                Text("Credit Limit: $50,000")
                HStack { Spacer () }
            }
            .foregroundColor(.white)
            .padding()
            .background(
                // iOS 14
                //                LinearGradient(gradient: .init(stops: [.init(color: .blue.opacity(0.6), location: 0),
                //                                                       .init(color: .blue, location: 1)]), startPoint: .top, endPoint: .bottom)

                LinearGradient(colors: [
                    Color.blue.opacity(0.6),
                    Color.blue
                ], startPoint: .center, endPoint: .bottom)
            )
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black.opacity(0.5), lineWidth: 1)
            )
            .cornerRadius(8)
            .shadow(radius: 5)
            .padding(.horizontal)
            .padding(.top)
            
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
    
    var addCardButton: some View {
        Button(action: {
           //  trigger action
            shouldPresentAddCardForm.toggle()
       }, label: {
           Text("+ Card")
               .foregroundColor(.white)
               .font(.system(size: 16, weight: .bold))
               .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
               .background(Color.black)
               .cornerRadius(5)
       })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
//        AddCardForm()
    }
}
