//
//  ViewController.swift
//  To Do List Homework
//
//  Created by Serper Kurmanbek on 14.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var textfield2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            
    }

    
    @IBAction func addtask(_ sender: Any) {
        let defaults = UserDefaults.standard
                
                
        let contactName = textfield.text!
        let newNumber = textfield2.text!
                
        var newContact = ContactInfo()
                
        newContact.name = contactName
        newContact.number = newNumber
                
        do{
            if let data = defaults.data(forKey: "contactInformation"){
                var array = try JSONDecoder().decode([ContactInfo].self, from: data)
                array.append(newContact)
                
                
                let encodedata = try JSONEncoder().encode(array)
                defaults.set(encodedata, forKey: "contactInformation")
                
            }
            else {
                let encodedata = try JSONEncoder().encode([newContact])
                defaults.set(encodedata, forKey: "contactInformation")
            }

            
        }catch {
                    print("unble to encode \(error)")
                }

        textfield.text = " "
        textfield2.text = " "
                
            } 
            
        }

    
