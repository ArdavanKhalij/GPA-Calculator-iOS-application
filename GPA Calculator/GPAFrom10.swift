//
//  GPAFrom10.swift
//  GPA Calculator
//
//  Created by ardavan on 2/17/1398 AP.
//  Copyright © 1398 Ardavan. All rights reserved.
//

import UIKit
struct cellData2 {
    var courseName: String?
    var courseGrade: Double?
    var courseCredit: Int?
}
var myIndex10 = 0
var array2 = [cellData2]()
//var resultNumberUSA2: Double?
//var resultNumberGerman2: Double?
class GPAFrom10: UIViewController,UITableViewDataSource,UITableViewDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cellFor10")
        cell.textLabel?.text = array2[indexPath.row].courseName
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
        let item = array2[sourceIndexPath.row]
        array2.remove(at: sourceIndexPath.row)
        array2.insert(item, at: destinationIndexPath.row)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    @IBAction func back(_ sender: Any) {
        i=0
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet var editb: UIBarButtonItem!
    @IBAction func edit(_ sender: Any) {
        myTableView2.isEditing = !myTableView2.isEditing
        if(myTableView2.isEditing == true){
            editb.title = "Done"
        }else{
            editb.title = "Edit"
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else{ return }
        array2.remove(at: indexPath.row)
        myTableView2.deleteRows(at: [indexPath], with: .automatic)
        i = i-1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex10 = indexPath.row
        performSegue(withIdentifier: "segue2", sender: self)
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
            k = k + data100ForCalculate2[ii].credit!
            if(data100ForCalculate2[ii].grade! <= 10 && data100ForCalculate2[ii].grade! >= 8.5){
                res = res + 4.0 * Double(data100ForCalculate2[ii].credit!)
            }
            if(data100ForCalculate2[ii].grade! < 8.5 && data100ForCalculate2[ii].grade! >= 8){
                res = res + 3.7 * Double(data100ForCalculate2[ii].credit!)
            }
            if(data100ForCalculate2[ii].grade! < 8 && data100ForCalculate2[ii].grade! >= 7.5){
                res = res + 3.3 * Double(data100ForCalculate2[ii].credit!)
            }
            if(data100ForCalculate2[ii].grade! < 7.5 && data100ForCalculate2[ii].grade! >= 7){
                res = res + 3 * Double(data100ForCalculate2[ii].credit!)
            }
            if(data100ForCalculate2[ii].grade! < 7 && data100ForCalculate2[ii].grade! >= 6.5){
                res = res + 2.7 * Double(data100ForCalculate2[ii].credit!)
            }
            if(data100ForCalculate2[ii].grade! < 6.5 && data100ForCalculate2[ii].grade! >= 6){
                res = res + 2.3 * Double(data100ForCalculate2[ii].credit!)
            }
            if(data100ForCalculate2[ii].grade! < 6 && data100ForCalculate2[ii].grade! >= 5.5){
                res = res + 2 * Double(data100ForCalculate2[ii].credit!)
            }
            if(data100ForCalculate2[ii].grade! < 5.5 && data100ForCalculate2[ii].grade! >= 5){
                res = res + 1.7 * Double(data100ForCalculate2[ii].credit!)
            }
            if(data100ForCalculate2[ii].grade! < 5 && data100ForCalculate2[ii].grade! >= 4.5){
                res = res + 1.3 * Double(data100ForCalculate2[ii].credit!)
            }
            if(data100ForCalculate2[ii].grade! < 4.5 && data100ForCalculate2[ii].grade! >= 4){
                res = res + 1.0 * Double(data100ForCalculate2[ii].credit!)
            }
            if(data100ForCalculate2[ii].grade! < 4 && data100ForCalculate2[ii].grade! >= 0){
                res = res + 0 * Double(data100ForCalculate2[ii].credit!)
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
        var x = cellData2()
        x.courseName = course
        x.courseGrade = 0
        x.courseCredit = 1
        array2.insert(x, at: index)
        let indexPath = IndexPath(row: index, section: 0)
        myTableView2.insertRows(at: [indexPath], with: .automatic)
    }
    @IBOutlet var myTableView2: UITableView!
    @IBOutlet var Calculate: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Calculate.layer.cornerRadius = 10
        Calculate.layer.masksToBounds = true
        array2 = []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 0.6) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
}
