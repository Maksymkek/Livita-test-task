//
//  BottomTabBar.swift
//  Livita test task
//
//  Created by Максим Грищенков on 16.06.2026.
//

import SwiftUI

struct AppTabBar: View {
    let tabs: [AnyAppTab]
    @Binding private var selectedTabID: String

    init(selection: Binding<String>, @AppTabBuilder content: () -> [AnyAppTab])
    {
        self.tabs = content()
        self._selectedTabID = selection
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                tabs
                    .first(where: { $0.id == selectedTabID })!.tab.content
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .top
                    )
                LinearGradient(
                    colors: [
                        .white.opacity(0),
                        .white.opacity(0.8),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(maxWidth: .infinity)
                .frame(height: 62 + proxy.safeAreaInsets.bottom)
                .padding(.bottom, -proxy.safeAreaInsets.bottom)
                .allowsHitTesting(false)

                HStack {
                    ForEach(tabs) { tab in
                        Button(action: {
                            selectedTabID = tab.id
                        }) {
                            AppTabView(
                                tab: tab.tab,
                                isSelected: selectedTabID == tab.id
                            )
                        }

                        if tab.id != tabs.last?.id {
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 6)
                .background {
                    Capsule()
                        .fill(Color.white.opacity(0.9))
                }
                .background(.regularMaterial, in: Capsule())
                .overlay {
                    Capsule()
                        .stroke(.white, lineWidth: 1)
                }
                .shadow(color: .black.opacity(0.04), radius: 8, x: 2, y: 2)
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    BottomTabBarPreview()
}

private struct BottomTabBarPreview: View {
    @State private var selectedTabID = "tools"

    var body: some View {
        ZStack(alignment: .top) {
            Color("app_light_gray").ignoresSafeArea()
            AppTabBar(selection: $selectedTabID) {
                AppTab(id: "tools", title: "Tools", systemImageName: "sparkles")
                {
                    ScrollView {
                        LazyVStack {
                            CardView(
                                CardViewModel(
                                    images: [
                                        "3_card_image",
                                        "4_card_image",
                                    ],
                                    title: "Redesign",
                                    description:
                                        "Refresh your space with a new interior look"
                                )

                            )
                            CardView(
                                CardViewModel(
                                    images: [
                                        "3_card_image",
                                        "4_card_image",
                                    ],
                                    title: "Redesign",
                                    description:
                                        "Refresh your space with a new interior look"
                                )

                            )
                        }
                    }.padding(.horizontal, 12)
                }
                AppTab(
                    id: "gallery",
                    title: "Gallery",
                    systemImageName: "photo.on.rectangle"
                ) {
                    Image(systemName: "sparkles")
                }
                AppTab(
                    id: "discover",
                    title: "Discover",
                    systemImageName: "safari.fill"
                ) {
                    Button(action: {}) {
                        Text("Discovery")
                    }
                }
            }
        }
    }
}

private struct AppTabView<Content: View>: View {
    let tab: AppTab<Content>
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 3) {
            Image(systemName: tab.systemImageName).font(.system(size: 24))
            Text(tab.title).font(.system(size: 10))
                .fontWeight(.medium).tracking(-0.24)
        }
        .foregroundStyle(isSelected ? .black : Color("app_gray"))
        .padding(.horizontal, 24)
        .padding(.vertical, 3).frame(height: 50)
    }
}
