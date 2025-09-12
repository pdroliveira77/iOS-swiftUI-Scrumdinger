//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Pedro Oliveira on 04/09/25.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var attendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Informações da Reunião")) {
                TextField("Título", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        // O text não aparece na tela, maso VoiceOver usa para identificar a finalidade do campo
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutos")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutos")
                        .accessibilityHidden(true)
                }
            }
            ThemePicker(selection: $scrum.theme)
            
            Section(header: Text("Participantes")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                
                HStack {
                    TextField("Novo Participante", text: $attendeeName)
                    Button {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: attendeeName)
                            scrum.attendees.append(attendee)
                            attendeeName = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Adicionar Participante")
                    }
                    .disabled(attendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    DetailEditView(scrum: $scrum)
}
