//
//  CalendarioComponent.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 16/07/25.
//

import SwiftUI

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
