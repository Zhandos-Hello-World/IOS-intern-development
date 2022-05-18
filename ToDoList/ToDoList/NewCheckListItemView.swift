//
//  NewCheckListItemView.swift
//  ToDoList
//
//  Created by Zhandos Baimurat on 17.05.2022.
//

import SwiftUI

struct NewCheckListItemView: View {
    @State var newItemName = ""
    var checklist: Checklist
    
    var body: some View {
      VStack {
        Text("Add new item")
        Form {
            TextField("Enter new item here", text: self.$newItemName)
            Button(action: {
                let newChecklistItem = ChecklistItem(name: self.newItemName)
                self.checklist.items.append(newChecklistItem)
                newItemName = ""
            }) {
            HStack {
              Image(systemName: "plus.circle.fill")
              Text("Add new item")
                }
            }
            .disabled(newItemName.count == 0)
        }
        Text("Swipe down to cancel.")
      }
    }
}
struct NewCheckListItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewCheckListItemView(checklist: Checklist())
    }
}
