//
//  AppTab.swift
//  Livita test task
//
//  Created by Максим Грищенков on 16.06.2026.
//
import SwiftUI

struct AppTab<Content: View> {
    let id: String
    let title: String
    let systemImageName: String
    let content: Content

    init(
        id: String,
        title: String,
        systemImageName: String,
        @ViewBuilder content: () -> Content
    ) {
        self.id = id
        self.title = title
        self.systemImageName = systemImageName
        self.content = content()
    }
}

@resultBuilder
struct AppTabBuilder {
    static func buildExpression<Content: View>(_ expression: AppTab<Content>)
        -> AnyAppTab
    {
        expression.eraseToAnyTab()
    }

    static func buildBlock(_ components: AnyAppTab...) -> [AnyAppTab] {
        components
    }
}

struct AnyAppTab: Identifiable {
    let id: String
    let tab: AppTab<AnyView>
}

extension AppTab {
    func eraseToAnyTab() -> AnyAppTab {
        AnyAppTab(
            id: id,
            tab: AppTab<AnyView>(
                id: id,
                title: title,
                systemImageName: systemImageName
            ) {
                AnyView(content)
            }
        )
    }
}
