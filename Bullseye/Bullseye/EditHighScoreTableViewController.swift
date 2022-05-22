//
//  EditHighScoreTableViewController.swift
//  Bullseye
//
//  Created by Zhandos Baimurat on 22.05.2022.
//

import UIKit

protocol EditHighScoreViewControllerDelegate: AnyObject {
  func editHighScoreViewControllerDidCancel(
    _ controller: EditHighScoreTableViewController)
  func editHighScoreViewController(
    _ controller: EditHighScoreTableViewController,
    didFinishEditing item: HighScoreItem)
}


class EditHighScoreTableViewController:
    UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    //var highScoresViewController: HighScoresViewController
    weak var delegate: EditHighScoreViewControllerDelegate?
    var highScoreItem: HighScoreItem!
    var highScoresViewController: HighScoresViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
      return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      textField.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
        delegate?.editHighScoreViewControllerDidCancel(self)
        
    }
    @IBAction func done() {
        highScoreItem.name = textField.text!
        delegate?.editHighScoreViewController(self, didFinishEditing: highScoreItem)
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
          doneBarButton.isEnabled = false
        } else {
          doneBarButton.isEnabled = true
        }
        return true
    }

    
}
