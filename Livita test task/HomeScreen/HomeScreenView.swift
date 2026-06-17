//
//  ContentView.swift
//  Livita test task
//
//  Created by Максим Грищенков on 16.06.2026.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var selectedTabID = "tools"
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color("app_light_gray").ignoresSafeArea()
                AppTabBar(selection: $selectedTabID) {
                    AppTab(id: "tools", title: "Tools", systemImageName: "sparkles")
                    {
                        ScrollView {
                            LazyVStack(spacing: 8) {
                                CardView(
                                    CardViewModel(
                                        images: [
                                            "1_card_image",
                                            "2_card_image",
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
                                        title: "Sketch to Render",
                                        description:
                                            "Refresh your space with a new interior look"
                                    )
                                )
                                CardView(
                                    CardViewModel(
                                        images: [
                                            "5_card_image",
                                            "6_card_image",
                                        ],
                                        title: "Design Transfer",
                                        description:
                                            "Refresh your space with a new interior look"
                                    )
                                )
                            }
                        }.padding(.horizontal, 16)
                            .contentMargins(
                                .top,
                                12,
                                for: .scrollContent
                            ).contentMargins(.bottom, 150, for: .scrollContent).scrollIndicators(.hidden)
                    }
                    AppTab(
                        id: "gallery",
                        title: "Gallery",
                        systemImageName: "photo.on.rectangle"
                    ) {
                        VStack {
                            Spacer()
                            Text("Gallery tab")
                            Spacer()
                        }
                    }
                    AppTab(
                        id: "discover",
                        title: "Discover",
                        systemImageName: "safari.fill"
                    ) {
                        VStack {
                            Spacer()
                            Text("Discover tab")
                            Spacer()
                        }
                    }
                }
            }.safeAreaInset(edge: .top) {
                HeaderView()
                    
            }}
    }
}

#Preview {
    HomeScreenView()
}
