//
//  GPAFrom6.swift
//  GPA Calculator
//
//  Created by ardavan on 2/18/1398 AP.
//  Copyright © 1398 Ardavan. All rights reserved.
//

import UIKit
struct cellData3 {
    var courseName: String?
    var courseGrade: Double?
    var courseCredit: Int?
}
var myIndex6 = 0
var array3 = [cellData3]()
//var resultNumberUSA3: Double?
//var resultNumberGerman3: Double?
class GPAFrom6: UIViewController,UITableViewDataSource,UITableViewDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array3.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cellFor6")
        cell.textLabel?.text = array3[indexPath.row].courseName
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
        let item = array3[sourceIndexPath.row]
        array3.remove(at: sourceIndexPath.row)
        array3.insert(item, at: destinationIndexPath.row)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else{ return }
        array3.remove(at: indexPath.row)
        myTableView3.deleteRows(at: [indexPath], with: .automatic)
        i = i-1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex6 = indexPath.row
        performSegue(withIdentifier: "segue3", sender: self)
    }
    @IBAction func edit(_ sender: Any) {
        myTableView3.isEditing = !myTableView3.isEditing
        if(myTableView3.isEditing == true){
            editb.title = "Done"
        }else{
            editb.title = "Edit"
        }
    }
    @IBOutlet var editb: UIBarButtonItem!
    
    @IBAction func tapToAdd(_ sender: Any) {
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
        var x = cellData3()
        x.courseName = course
        x.courseGrade = 0
        x.courseCredit = 1
        array3.insert(x, at: index)
        let indexPath = IndexPath(row: index, section: 0)
        myTableView3.insertRows(at: [indexPath], with: .automatic)
    }
    @IBAction func Calculateb(_ sender: Any) {
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
            k = k + data100ForCalculate3[ii].credit!
            if(data100ForCalculate3[ii].grade! <= 10*(6/10) && data100ForCalculate3[ii].grade! >= 8.5*(6/10)){
                res = res + 4.0 * Double(data100ForCalculate3[ii].credit!)
            }
            if(data100ForCalculate3[ii].grade! < 8.5*(6/10) && data100ForCalculate3[ii].grade! >= 8*(6/10)){
                res = res + 3.7 * Double(data100ForCalculate3[ii].credit!)
            }
            if(data100ForCalculate3[ii].grade! < 8*(6/10) && data100ForCalculate3[ii].grade! >= 7.5*(6/10)){
                res = res + 3.3 * Double(data100ForCalculate3[ii].credit!)
            }
            if(data100ForCalculate3[ii].grade! < 7.5*(6/10) && data100ForCalculate3[ii].grade! >= 7*(6/10)){
                res = res + 3 * Double(data100ForCalculate3[ii].credit!)
            }
            if(data100ForCalculate3[ii].grade! < 7*(6/10) && data100ForCalculate3[ii].grade! >= 6.5*(6/10)){
                res = res + 2.7 * Double(data100ForCalculate3[ii].credit!)
            }
            if(data100ForCalculate3[ii].grade! < 6.5*(6/10) && data100ForCalculate3[ii].grade! >= 6*(6/10)){
                res = res + 2.3 * Double(data100ForCalculate3[ii].credit!)
            }
            if(data100ForCalculate3[ii].grade! < 6*(6/10) && data100ForCalculate3[ii].grade! >= 5.5*(6/10)){
                res = res + 2 * Double(data100ForCalculate3[ii].credit!)
            }
            if(data100ForCalculate3[ii].grade! < 5.5*(6/10) && data100ForCalculate3[ii].grade! >= 5*(6/10)){
                res = res + 1.7 * Double(data100ForCalculate3[ii].credit!)
            }
            if(data100ForCalculate3[ii].grade! < 5*(6/10) && data100ForCalculate3[ii].grade! >= 4.5*(6/10)){
                res = res + 1.3 * Double(data100ForCalculate3[ii].credit!)
            }
            if(data100ForCalculate3[ii].grade! < 4.5*(6/10) && data100ForCalculate3[ii].grade! >= 4*(6/10)){
                res = res + 1.0 * Double(data100ForCalculate3[ii].credit!)
            }
            if(data100ForCalculate3[ii].grade! < 4*(6/10) && data100ForCalculate3[ii].grade! >= 0*(6/10)){
                res = res + 0 * Double(data100ForCalculate3[ii].credit!)
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
    @IBOutlet var Calculate: UIButton!
    @IBOutlet var myTableView3: UITableView!
    @IBAction func back(_ sender: Any) {
        i=0
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Calculate.layer.cornerRadius = 10
        Calculate.layer.masksToBounds = true
        array3 = []
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
