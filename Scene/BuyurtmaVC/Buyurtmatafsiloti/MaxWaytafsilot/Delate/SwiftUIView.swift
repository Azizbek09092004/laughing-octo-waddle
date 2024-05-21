//
//  SwiftUIView.swift
//  Uzum Tezkor App
//
//  Created by islombek on 14/02/24.
//

import SwiftUI

struct AddCardPage: View {
    @State private var cardNumber: String = ""
    @State private var expirationDate: String = ""
    @State private var cvv: String = ""
    @State private var isSavingCard = false
    @State private var navigateToOrderHistory = false
    @State private var isPresentingSafari = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.white // Set white background instead of LinearGradient
                VStack {
                    Spacer()

                    Image(systemName: "creditcard.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 300)
                        .foregroundColor(.red)
                        .padding(.top, 0)
                        .scaleEffect(isSavingCard ? 1.0 : 0.5)
                        .animation(.easeOut(duration: 0.5))
                        .offset(y: isSavingCard ? 200 : 0)
                        .animation(.spring(response: 0.5, dampingFraction: 0.7).delay(0.5))

                    Text("Karta qo'shish")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding(.top, 30)
                        .scaleEffect(isSavingCard ? 1.0 : 0.5)
                        .animation(.easeOut(duration: 0.5))
                        .offset(y: isSavingCard ? 200 : 0)
                        .animation(.spring(response: 0.5, dampingFraction: 0.7).delay(0.5))

                    VStack {
                        TextField("Card Number", text: $cardNumber)
                            .padding()
                            .background(Color.red.opacity(0.4)) // Purple background
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .keyboardType(.numberPad)
                            .padding(.horizontal)
                            .opacity(isSavingCard ? 0.0 : 1.0)
                            .animation(.easeOut(duration: 0.5))
                            .offset(y: isSavingCard ? 200 : 0)
                            .animation(.spring(response: 0.5, dampingFraction: 0.7).delay(0.5))

                        HStack {
                            TextField("Expiration Date", text: $expirationDate)
                                .padding()
                                .background(Color.red.opacity(0.5)) // Purple background
                                .cornerRadius(10)
                                .foregroundColor(.black)
                                .keyboardType(.numberPad)
                                .opacity(isSavingCard ? 0.0 : 1.0)
                                .animation(.easeOut(duration: 0.5))
                                .offset(y: isSavingCard ? 200 : 0)
                                .animation(.spring(response: 0.5, dampingFraction: 0.7).delay(0.5))

                            TextField("CVV", text: $cvv)
                                .padding()
                                .background(Color.red.opacity(0.5)) // Purple background
                                .cornerRadius(10)
                                .foregroundColor(.black)
                                .keyboardType(.numberPad)
                                .opacity(isSavingCard ? 0.0 : 1.0)
                                .animation(.easeOut(duration: 0.5))
                                .offset(y: isSavingCard ? 200 : 0)
                                .animation(.spring(response: 0.5, dampingFraction: 0.7).delay(0.5))
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)

                        NavigationLink(destination: PaymentSuccessView(), isActive: $navigateToOrderHistory) {
                            Button(action: {
                                isSavingCard.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    navigateToOrderHistory = true
                                }
                            }) {
                                Text("To'lash")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.black) 
                                    )
                                    .padding(.horizontal)
                                    .padding(.top, 20)
                                    .opacity(isSavingCard ? 0.0 : 1.0)
                                    .animation(.easeOut(duration: 0.5))
                                    .offset(y: isSavingCard ? 200 : 0)
                                    .animation(.spring(response: 0.5, dampingFraction: 0.7).delay(0.5))
                            }
                        }

                        if isSavingCard {
                            ProgressView()
                                .padding(.top, 20)
                                .scaleEffect(1.5)
                                .foregroundColor(.white)
                                .animation(.easeIn)
                        }
                    }
                    .padding(.top, 30)

                    Spacer()
                }
                .padding()
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
    }
}
