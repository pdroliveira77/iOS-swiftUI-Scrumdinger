//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Pedro Oliveira on 01/09/25.
//

import Foundation
import ThemeKit

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(id: UUID(),
                   title: "Design",
                   attendees: ["Társilla", "Pedro", "João", "Jéssica"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(id: UUID(),
                   title: "App Dev",
                   attendees: ["Heloisa", "Wilton", "Gabriel"],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(id: UUID(),
                   title: "Web Dev",
                   attendees: ["Deborah", "Junior", "Maria Isabel", "Roselene"],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
}
