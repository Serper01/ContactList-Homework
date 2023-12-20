//
//  TableViewController.swift
//  To Do List Homework
//
//  Created by Serper Kurmanbek on 15.12.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayOfContacts: [ContactInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        do {
            if let data = defaults.data(forKey: "contactInformation"){
            let array = try JSONDecoder().decode([ContactInfo].self, from: data )
            
                arrayOfContacts = array
            }
        }
        catch{
            print ("Unable to encode\(error)")
        }
        tableView.reloadData()
    }
    
    func saveTasks(){
        let defaults = UserDefaults.standard
        
        do {
            let encodedata = try JSONEncoder().encode(arrayOfContacts)
            defaults.set(encodedata, forKey: "contactInformation")
        }
        
        catch{
            print ("unable to encode\(error)")
        }
//        defaults.set(arrayTasks, forKey: "taskArray")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfContacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        // Configure the cell...
        cell.textLabel?.text = arrayOfContacts[indexPath.row].name
        cell.detailTextLabel?.text = arrayOfContacts[indexPath.row].number
        
        
        
        
        
     //   cell.detailTextLabel?.text = arrayTasks[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayOfContacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveTasks()
             
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
