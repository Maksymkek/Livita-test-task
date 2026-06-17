//
//  HeaderView.swift
//  Livita test task
//
//  Created by Максим Грищенков on 16.06.2026.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: {
            }) {
                Text("Get pro".uppercased())
                    .font(.system(size: 14, weight: .bold))
                    .frame(height: 16)
                    .tracking(-0.07)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)

                    .background(
                        LinearGradient(
                            colors: [
                                Color("app_header_orange"),
                                Color("app_header_purple"),
                                Color("app_header_blue"),
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(Capsule())
            }
            .padding(.all, 6)
            Spacer()
            Button(action: {}) {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 24))
                    .foregroundStyle(.appGray).padding(.horizontal, 10)
            }
        }
        .padding(.leading, 10)
        .padding(.trailing, 6)
        .background(Color("app_light_gray").opacity(0.8))
        .background(.regularMaterial)
    }
}

#Preview {

    HeaderView().background(.red.opacity(0.2))
}
