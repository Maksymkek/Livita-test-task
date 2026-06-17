//
//  CardViewModel.swift
//  Livita test task
//
//  Created by Максим Грищенков on 16.06.2026.
//

internal import Combine
import Foundation

class CardViewModel: ObservableObject {
    @Published var images: [String] = []
    @Published var title: String
    @Published var description: String

    init(images: [String], title: String, description: String) {
        self.images = images
        self.title = title
        self.description = description
    }
}
