//
//  CalendarioComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 16/07/25.
//

import SwiftUI

/// Calendario responsavel por mostrar quais quests fazer em qual dia
struct CalendarioComponent: View {
    
    @State private var date = Date()

    var body: some View {
        DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
    }
    }

    #Preview {
        CalendarioComponent()
    }
