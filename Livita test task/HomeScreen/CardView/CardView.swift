//
//  CardView.swift
//  Livita test task
//
//  Created by Максим Грищенков on 16.06.2026.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardViewModel
    @State private var showDetails = false

    private let imageHeight: CGFloat = 129
    private let imageScale: CGFloat = 2
    private let cropOffset: CGFloat = 28

    init(_ viewModel: CardViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 2) {
                ForEach(
                    Array(viewModel.images.prefix(2).enumerated()),
                    id: \.offset
                ) {
                    index,
                    imageName in
                    NavigationLink {
                        CardDetailsScreen(viewModel)
                    } label: {
                        GeometryReader { proxy in
                            let offset =
                                min(proxy.size.width * 0.30, 30)
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .scaleEffect(imageScale)
                                .offset(
                                    x: index == 0 ? offset : -offset,
                                    y: -20
                                )
                                .frame(
                                    width: proxy.size.width,
                                    height: imageHeight,
                                    alignment: .center
                                )
                                .clipped()
                                .contentShape(Rectangle())

                        }
                        .frame(height: imageHeight)
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            HStack(alignment: .bottom, spacing: 40) {
                VStack(alignment: .leading, spacing: 4) {

                    Text(viewModel.title)
                        .font(.system(size: 16, weight: .semibold))
                        .lineHeight(.exact(points: 24))
                    Text(viewModel.description)
                        .foregroundStyle(.appGray).font(
                            .system(size: 14)
                        )
                        .lineHeight(.exact(points: 22))
                }
                Spacer()
                NavigationLink {
                    CardDetailsScreen(viewModel)
                } label: {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 14))
                        .frame(width: 16, height: 16)

                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.black)
                        .clipShape(Capsule())

                }.shadow(color: .black.opacity(0.04), radius: 16, x: 5, y: 4)
            }

        }

        .padding(.all, 12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))

        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.appLightGray, lineWidth: 1).allowsHitTesting(false)
        }
    }

    private func horizontalOffset(for index: Int) -> CGFloat {
        index == 0 ? cropOffset : -cropOffset
    }
}

#Preview {
    NavigationStack {
        CardView(
            CardViewModel(
                images: [
                    "5_card_image",
                    "6_card_image",
                ],
                title: "Redesign",
                description: "Refresh your space with a new interior look"
            )
        ).padding(.horizontal, 12)
    }

}
