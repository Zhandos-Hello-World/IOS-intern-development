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
            ForEach(checklist.items.indices) { index in
                RowView(item: self.$checklist.items[index])
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}
