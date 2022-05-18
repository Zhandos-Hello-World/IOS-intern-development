//
//  RowView.swift
//  ToDoList
//
//  Created by Zhandos Baimurat on 18.05.2022.
//
import SwiftUI

struct RowView: View {
    @Binding var item: ChecklistItem
    
    var body: some View {
        NavigationLink(destination: {
            EditCheckListItemView(item: $item)
        }, label: {
            HStack {
                Text(item.name)
                Spacer()
                Text(item.isChecked ? "✅" : "◻️")
            }
        })
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(item: .constant(ChecklistItem(name: "Sample item")))
    }
}
