//
//  PreviewRenderView.swift
//  Livita test task
//
//  Created by Максим Грищенков on 17.06.2026.
//

import SwiftUI

struct PreviewRenderView: View {
    @State private var sliderPosition: CGFloat = 0.5
    let imageBefore: String
    let imageAfter: String

    init(before imageBefore: String, after imageAfter: String) {
        self.imageBefore = imageBefore
        self.imageAfter = imageAfter
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Image(imageAfter)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                    .clipped()

                Image(imageBefore)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                    .clipped()
                    .mask(
                        HStack(spacing: 0) {
                            Rectangle()
                                .frame(
                                    width: geometry.size.width * sliderPosition
                                )
                            Spacer(minLength: 0)
                        }
                    )

                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 4)

                    Circle()
                        .fill(Color.white)
                        .frame(width: 44, height: 44)
                        .shadow(
                            color: .black.opacity(0.25),
                            radius: 4,
                            x: 0,
                            y: 4
                        )
                        .overlay(
                            HStack(spacing: 0) {
                                Image(systemName: "chevron.up.chevron.down")
                                    .font(.system(size: 20)).rotationEffect(
                                        .degrees(90)
                                    )

                            }
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        )
                }
                .position(
                    x: geometry.size.width * sliderPosition,
                    y: geometry.size.height / 2
                )
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let newPercent =
                                value.location.x / geometry.size.width
                            sliderPosition = min(max(newPercent, 0), 1)
                        }
                )
                VStack {
                    HStack {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                sliderPosition = 0
                            }
                        }) {
                            Text("Before")
                                .font(.system(size: 14, weight: .semibold))
                                .frame(height: 14)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(.white.opacity(0.8))
                                .background(.ultraThinMaterial)
                                .clipShape(Capsule())
                                .padding(16)
                        }
                        Spacer()
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                sliderPosition = 1
                            }
                        }) {
                            Text("After")
                                .font(.system(size: 14, weight: .semibold))
                                .frame(height: 14)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(.white.opacity(0.8))
                                .background(.ultraThinMaterial)
                                .clipShape(Capsule())
                                .padding(16)

                        }
                    }.tint(.black)
                    Spacer()
                }
            }
        }
        .frame(height: 436)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    PreviewRenderView(before: "1_card_image", after: "2_card_image")
        .padding()
}
