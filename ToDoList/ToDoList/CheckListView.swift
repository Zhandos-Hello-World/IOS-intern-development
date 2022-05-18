//
//  ContentView.swift
//  ToDoList
//
//  Created by Zhandos Baimurat on 17.05.2022.
//

import SwiftUI

struct CheckListView: View {
    
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
      NavigationView {
        List {
            ForEach(checklist.items, id: \.self) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.isChecked ? "✅" : "◻️")
                }
                .background(.white)
                .onTapGesture {
                    if let matchingIndex = self.checklist.items.firstIndex(where: {
                        $0.id == item.id }) {
                      self.checklist.items[matchingIndex].isChecked.toggle()
                    }
                }
            }
            .onDelete(perform: checklist.deleteListItem)
            .onMove(perform: checklist.moveListItem)
        }
        .navigationBarItems(
            leading: Button(
                action: {
                    self.newChecklistItemViewIsVisible = true
                },
                label: {
                    Image(systemName: "plus.circle.fill")
                    Text("Add item")
                }),
            trailing: EditButton())
        .navigationBarTitle("Checklist", displayMode: .inline)
      }
      .sheet(isPresented: $newChecklistItemViewIsVisible) {
          NewCheckListItemView(checklist: self.checklist)
        }
    }
}
func alertTitle() -> String {
    return "This is the alert title."
}
func scoringMessage() -> String {
    return "This is the alert message."
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}
