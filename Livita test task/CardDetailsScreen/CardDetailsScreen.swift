//
//  CardDetailsScreen.swift
//  Livita test task
//
//  Created by Максим Грищенков on 17.06.2026.
//

import SwiftUI

struct CardDetailsScreen: View {
    @ObservedObject var viewModel: CardViewModel

    init(_ viewModel: CardViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            PreviewRenderView(
                before: viewModel.images[0],
                after: viewModel.images[1]
            )
            .padding(.top, 48)
            .padding([.leading, .trailing, .bottom], 16)
            Spacer()
            VStack(spacing: 16) {
                HStack {
                    bottomButton(
                        title: "Resize",
                        systemName: "arrow.up.and.down.and.sparkles",
                        action: {}
                    )
                    bottomButton(
                        title: "Save",
                        systemName: "square.and.arrow.down",
                        action: {}
                    )
                }
                Button {
                } label: {
                    HStack(spacing: 8) {
                        Spacer()
                        Image(systemName: "arrow.counterclockwise")
                            .font(.system(size: 22))
                            .frame(width: 24, height: 24)
                        Text("Regenerate")
                            .font(.system(size: 16, weight: .medium))
                            .frame(height: 24)
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    .padding(.all, 14)
                    .frame(height: 56)
                    .background(.black).clipShape(
                        Capsule()
                    ).contentShape(Capsule())
                }
            }.padding(.horizontal, 16)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("app_light_gray"))
    }

    func bottomButton(
        title: String,
        systemName: String,
        action: @escaping () -> Void
    ) -> some View {
        return Button {
            action()
        } label: {
            HStack(spacing: 6) {
                Spacer()
                Image(systemName: systemName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(title)
                    .font(.system(size: 14, weight: .medium)).lineHeight(
                        .exact(points: 16)
                    )
                    .frame(height: 20)
                    .tracking(-0.063)
                Spacer()
            }
            .foregroundStyle(.black)
            .padding(.all, 14).background(.white).clipShape(
                Capsule()
            ).contentShape(Capsule()).overlay {
                Capsule().stroke(lineWidth: 1).foregroundStyle(.appThinGray)
            }
        }
    }
}

#Preview {
    CardDetailsScreen(
        CardViewModel(
            images: [
                "5_card_image",
                "6_card_image",
            ],
            title: "Redesign",
            description: "Refresh your space with a new interior look"
        )
    )
}
