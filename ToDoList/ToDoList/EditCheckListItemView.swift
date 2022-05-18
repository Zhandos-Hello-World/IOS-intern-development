//
//  EditCheckListItemView.swift
//  ToDoList
//
//  Created by Zhandos Baimurat on 17.05.2022.
//

import SwiftUI

struct EditCheckListItemView: View {
    @Binding var item: ChecklistItem
    
    var body: some View {
        Form {
            TextField("name", text: $item.name)
            Toggle("Completed", isOn: $item.isChecked)
        }
    }
}

struct EditCheckListItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditCheckListItemView(item: .constant(ChecklistItem(name: "Sample item")))
    }
}
