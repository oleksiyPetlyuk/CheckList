//
//  ViewController.swift
//  CheckList
//
//  Created by Oleksiy Petlyuk on 24.11.2019.
//  Copyright © 2019 Oleksiy Petlyuk. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var todoList: TodoList
    
    required init?(coder: NSCoder) {
        todoList = TodoList()
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = todoList.todos[indexPath.row]
        
        configureText(for: cell, with: item)
        
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = todoList.todos[indexPath.row]
            
            configureCheckmark(for: cell, with: item)
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
        
        item.toggleChecked()
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item.text
        }
    }
}

