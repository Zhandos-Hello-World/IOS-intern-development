//
//  CheckList.swift
//  ToDoList
//
//  Created by Zhandos Baimurat on 17.05.2022.
//

import Foundation

class Checklist: ObservableObject {
    
    @Published var items = [
      ChecklistItem(name: "Walk the dog"),
      ChecklistItem(name: "Brush my teeth"),
      ChecklistItem(name: "Learn iOS development", isChecked: true),
      ChecklistItem(name: "Soccer practice"),
      ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]
    
    func printChecklistContents() {
      for item in items {
        print(item)
      }
      print("===================")
    }
    
    func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
    }
    func moveListItem(whichElement: IndexSet, destination: Int) {
      items.move(fromOffsets: whichElement, toOffset: destination)
    }
}
