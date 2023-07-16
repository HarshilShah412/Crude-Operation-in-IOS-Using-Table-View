//
//  ViewController.swift
//  TableViewPrac
//
//  Created by bmiit on 31/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    var List: [Student] = [Student("Harshil", "99"),Student("Steve", "95"),Student("Rahul", "70")]
    
    @IBOutlet var txtmarks: UITextField!
    @IBOutlet var txtname: UITextField!
    
    @IBOutlet var tableView: UITableView!

    @IBAction func btnadd(_ sender: Any) {
        let Sname = txtname.text ?? ""
        let Smarks = txtmarks.text ?? ""
        
        var item = Student(Sname, Smarks)
        List.append(item)
        
        txtname.text = ""
        txtmarks.text = ""
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            List.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? StudentDetail
        {
            destination.Stud = List[(tableView.indexPathForSelectedRow?.row) as! Int]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData();
    }
}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return List.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = List[indexPath.row].name
        cell.detailTextLabel?.text = List[indexPath.row].marks
        return cell
    }
}
