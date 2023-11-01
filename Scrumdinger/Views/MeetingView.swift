//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Apoorv Yadav on 10/26/23.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value:10, total:15)
            HStack{
                VStack(alignment:.leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment:.trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children:.ignore)
            .accessibilityLabel("Time Remaining")
            .accessibilityLabel("10 minutes")
            Circle()
                .strokeBorder(lineWidth: 10)
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next Speaker")
            }
        }
        .padding()
    }
}

#Preview {
    MeetingView()
}
