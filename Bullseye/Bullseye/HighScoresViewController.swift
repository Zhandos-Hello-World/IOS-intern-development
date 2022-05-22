//
//  HighScoresViewController.swift
//  Bullseye
//
//  Created by Zhandos Baimurat on 19.05.2022.
//

import UIKit

class HighScoresViewController: UITableViewController, EditHighScoreViewControllerDelegate {
    var items = [HighScoreItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = PersistencyHelper.loadHighScores()
        if (items.count == 0) {
          resetHighScores()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        let nameLabelUI = cell.viewWithTag(1000) as! UILabel
        let scoreLabelUI = cell.viewWithTag(2000) as! UILabel
        
        nameLabelUI.text = item.name
        scoreLabelUI.text = String(item.score)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
         
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
     }
    
    
    @IBAction func resetHighScores() {
        items.removeAll()
        let item1 = HighScoreItem()
        item1.name = "The reader of this book"
        item1.score = 50000
        items.append(item1)
        let item2 = HighScoreItem()
        item2.name = "Manda"
        item2.score = 10000
        items.append(item2)
        let item3 = HighScoreItem()
        item3.name = "Joey"
        item3.score = 5000
        items.append(item3)
        let item4 = HighScoreItem()
        item4.name = "Adam"
        item4.score = 1000
        items.append(item4)
        let item5 = HighScoreItem()
        item5.name = "Eli"
        item5.score = 500
        items.append(item5)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let controller = segue.destination as! EditHighScoreTableViewController
      controller.delegate = self
      if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
        controller.highScoreItem = items[indexPath.row]
      }
    }
    
    func editHighScoreViewControllerDidCancel(_ controller: EditHighScoreTableViewController) {
        navigationController?.popViewController(animated:true)
    }
    
    func editHighScoreViewController(_ controller: EditHighScoreTableViewController, didFinishEditing item: HighScoreItem) {
        if let index = items.firstIndex(of: item) {
          let indexPath = IndexPath(row: index, section: 0)
          let indexPaths = [indexPath]
          tableView.reloadRows(at: indexPaths, with: .automatic)
        }
        PersistencyHelper.saveHighScores(items)
        navigationController?.popViewController(animated:true)
    }
    
}
