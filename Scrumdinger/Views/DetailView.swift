//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Apoorv Yadav on 10/29/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State var editingScrum: DailyScrum = DailyScrum.emptyScrum
    @State private var showEditView = false
    var body: some View {
        List{
            Section(header: Text("Meeting info")){
                NavigationLink(destination: MeetingView()){
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                    
                }.accessibilityElement(children:.combine)
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    
                }.accessibilityElement(children: .combine)
                
            }
            Section(header:Text("Attendees")){
                ForEach(scrum.attendees){
                    attendee in 
                        Label(attendee.name, systemImage: "person")
                }

            }
        }
            .navigationTitle(scrum.title)
            .toolbar{
                Button{
                    showEditView = true
                    editingScrum = scrum
                }label:{
                    Text("Edit")
                }
            }
            .sheet(isPresented: $showEditView){
                NavigationStack{
                    DetailEditView(scrum: $editingScrum)
                        .navigationTitle(scrum.title)
                        .toolbar{
                            ToolbarItem(placement: .cancellationAction){
                                Button("Cancel"){
                                    showEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction){
                                Button("Done"){
                                    showEditView = false
                                    scrum = editingScrum
                                }
                            }
                        }
                }
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
