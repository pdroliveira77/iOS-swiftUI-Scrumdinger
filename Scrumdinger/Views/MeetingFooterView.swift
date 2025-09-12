//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Pedro Oliveira on 10/09/25.
//

import SwiftUI
import TimerKit

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "Não existem mais oradores" }
        return "Orador \(speakerNumber) de \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Último orador")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button {
                        skipAction()
                    } label: {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Proximo orador")
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable var speakers = DailyScrum.sampleData[0].attendees
        .map { $0.name }
        .map { ScrumTimer.Speaker(name: $0, isCompleted: false) }
    MeetingFooterView(speakers: speakers, skipAction: {})
}
