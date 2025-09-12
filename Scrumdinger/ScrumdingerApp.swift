//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Pedro Oliveira on 31/08/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
