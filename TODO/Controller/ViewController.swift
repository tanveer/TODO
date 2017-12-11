//
//  ViewController.swift
//  TODO
//
//  Created by Tanveer Bashir on 1/9/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase



class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        Auth.auth().addStateDidChangeListener { (auth, user) in
            guard let user = user  else { return }
            kUser = user
        }

        guard let id = kUser?.uid else { return }
        ref.child(id).observe(.value) { snapshot in
            var items: [Item] = []
            for item in snapshot.children {
                let newItem = Item(snapshot: (item as? DataSnapshot)!)
                items.append(newItem)
            }
            self.items = items
            self.tableView.reloadData()
        }
    }

    @IBAction func signOut(_ sender: UIBarButtonItem) {
        SignInService.logout()
        dismiss(animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].item
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = items[indexPath.row]
            item.ref?.removeValue()
        }
    }
}
