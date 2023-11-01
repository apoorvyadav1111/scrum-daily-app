//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Apoorv Yadav on 10/26/23.
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
