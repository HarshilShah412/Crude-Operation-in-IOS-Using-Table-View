//
//  StudentDetail.swift
//  TableViewPrac
//
//  Created by bmiit on 31/03/23.
//

import UIKit

class StudentDetail: UIViewController {

    var Stud: Student?
    
    @IBOutlet var lblname: UITextField!
    @IBOutlet var lblmarks: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblname.text = "\((Stud?.name)!)"
        lblmarks.text = "\((Stud?.marks)!)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Stud?.name = lblname.text!
        Stud?.marks = lblmarks.text!
    }
}
