//
//  CheckListItem.swift
//  ToDoList
//
//  Created by Zhandos Baimurat on 17.05.2022.
//

import Foundation

struct ChecklistItem: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
