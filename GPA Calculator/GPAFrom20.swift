//
//  GPAFrom20.swift
//  GPA Calculator
//
//  Created by ardavan on 2/17/1398 AP.
//  Copyright © 1398 Ardavan. All rights reserved.
//

import UIKit
struct cellData1 {
    var courseName: String?
    var courseGrade: Double?
    var courseCredit: Int?
}
var myIndex20 = 0
var array1 = [cellData1]()
//var resultNumberUSA1: Double?
//var resultNumberGerman1: Double?
class GPAFrom20: UIViewController, UITableViewDelegate, UITableViewDataSource {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBOutlet var myTableView1: UITableView!
    @IBAction func back(_ sender: Any) {
        i=0
        dismiss(animated: true, completion: nil)
    }
    @IBAction func editBottun(_ sender: Any) {
        myTableView1.isEditing = !myTableView1.isEditing
        if(myTableView1.isEditing == true){
            edit.title = "Done"
        }else{
            edit.title = "Edit"
        }
    }
    @IBOutlet var edit: UIBarButtonItem!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cellFor20")
        cell.textLabel?.text = array1[indexPath.row].courseName
        cell.detailTextLabel?.text = "Push and Enter your Grade and Credit"
        cell.backgroundColor = #colorLiteral(red: 0.0862628296, green: 0.08628197759, blue: 0.08625862747, alpha: 1)
        cell.textLabel?.textColor = #colorLiteral(red: 0.9531772733, green: 0.5895730853, blue: 0.2420593798, alpha: 1)
        cell.detailTextLabel?.textColor = #colorLiteral(red: 0.9531772733, green: 0.5895730853, blue: 0.2420593798, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array1[sourceIndexPath.row]
        array1.remove(at: sourceIndexPath.row)
        array1.insert(item, at: destinationIndexPath.row)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Calculat.layer.cornerRadius = 10
        Calculat.layer.masksToBounds = true
        array1 = []
    }
    @IBOutlet var Calculat: UIButton!
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else{ return }
        array1.remove(at: indexPath.row)
        myTableView1.deleteRows(at: [indexPath], with: .automatic)
        i = i-1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex20 = indexPath.row
        performSegue(withIdentifier: "segue1", sender: self)
    }
    @IBAction func calculateb(_ sender: Any) {
        let theButton = sender as! UIButton
        let bounds = theButton.bounds
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            theButton.bounds = CGRect(x: bounds.origin.x - 20,y:bounds.origin.y, width: bounds.size.width + 20, height: bounds.size.height)
        }) {(success:Bool) in
            if success{
                UIView.animate(withDuration: 0.4, animations: {
                    theButton.bounds = bounds
                })
            }
        }
        var k = 0
        var res = 0.0
        var res2 = 0.0
        var k2 = 0
        var ii = 0
        while(ii<i){
            k = k + data100ForCalculate1[ii].credit!
            if(data100ForCalculate1[ii].grade! <= 20 && data100ForCalculate1[ii].grade! >= 16){
                res = res + 4.0 * Double(data100ForCalculate1[ii].credit!)
            }
            if(data100ForCalculate1[ii].grade! < 16 && data100ForCalculate1[ii].grade! >= 14){
                res = res + 3.0 * Double(data100ForCalculate1[ii].credit!)
            }
            if(data100ForCalculate1[ii].grade! < 14 && data100ForCalculate1[ii].grade! >= 12){
                res = res + 2.0 * Double(data100ForCalculate1[ii].credit!)
            }
            if(data100ForCalculate1[ii].grade! < 12 && data100ForCalculate1[ii].grade! >= 10){
                res = res + 1.0 * Double(data100ForCalculate1[ii].credit!)
            }
            ii = ii+1
        }
        ii = 0
        /*while(ii<i){
         res2 = res2 + data100ForCalculate[ii].grade!
         k2 = k2 + data100ForCalculate[ii].credit!
         ii = ii+1
         }
         let avr = res2 / Double(k2)*/
        resultNumberUSA = res / Double(k)
        resultNumberGerman = 3*((4 - (res / Double(k)))/(4-0))+1
        //i=0
        
    }
    @IBAction func topToAdd(_ sender: Any) {
        let alert = UIAlertController(title: "Add Course", message: nil, preferredStyle: .alert)
        alert.addTextField { (courseTF) in
            courseTF.placeholder = "Enter course name"
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let course = alert.textFields?.first?.text else{return}
            print(course)
            self.add(course: course)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    func add(course: String){
        let index = 0
        var x = cellData1()
        x.courseName = course
        x.courseGrade = 0
        x.courseCredit = 1
        array1.insert(x, at: index)
        let indexPath = IndexPath(row: index, section: 0)
        myTableView1.insertRows(at: [indexPath], with: .automatic)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 0.6) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
}
