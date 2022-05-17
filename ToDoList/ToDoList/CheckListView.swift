//
//  ContentView.swift
//  ToDoList
//
//  Created by Zhandos Baimurat on 17.05.2022.
//

import SwiftUI

struct CheckListView: View {
    
    @ObservedObject var checklist = Checklist()
    
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
        }.navigationBarItems(trailing: EditButton())
              .navigationBarTitle("Checklist")
      }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}
