//
//  tolandi.swift
//  Uzum Tezkor App
//
//  Created by islombek on 14/02/24.
//

import SwiftUI



struct PaymentSuccessView: View {
    @State private var isShowingDetails = false
    
    var body: some View {
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 450, height: 300)
                    .foregroundColor(.green)
                    .padding(.top, 50)
                    .scaleEffect(1.0)
                    .animation(.spring(response: 0.5, dampingFraction: 0.7), value: isShowingDetails)

                
                Text("Muvoffaqiyatli to'landi")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.top, 30)
                    .scaleEffect(1.0)
                    .animation(.spring(response: 0.5, dampingFraction: 0.7), value: isShowingDetails)
                
                Button(action: {
                    withAnimation {
                        isShowingDetails.toggle()
                    }
                }) {
                    Text("Tafsilotlar")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                        )
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .scaleEffect(1.0)
                        .animation(.spring(), value: isShowingDetails)
                }
                
                if isShowingDetails {
                    PaymentDetailsView()
                        .transition(.move(edge: .bottom))
                }
            }
            
            Spacer()
        }
    
    }


struct PaymentDetailsView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Use Link to open the URL in Safari
            Link(destination: URL(string: "https://ofd.soliq.uz/epi?t=EP000000000236&r=232896985&c=20231221230725&s=905061317915")!) {
                Text("Chekni ko'rish")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Button(action: {
            }) {
              
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
}

