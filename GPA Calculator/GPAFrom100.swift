//
//  GPAFrom100.swift
//  GPA Calculator
//
//  Created by ardavan on 2/13/1398 AP.
//  Copyright © 1398 Ardavan. All rights reserved.
//
import UIKit
struct cellData {
    var courseName: String?
    var courseGrade: Double?
    var courseCredit: Int?
}
var myIndex100 = 0
var I: Int?
var array = [cellData]()
var resultNumberUSA: Double?
var resultNumberGerman: Double?
class GPAFrom100: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBAction func onAddTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add Course", message: nil, preferredStyle: .alert)
        alert.addTextField { (courseTF) in
            courseTF.placeholder = "Enter course name"
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let course = alert.textFields?.first?.text else{return}
            print(course)
            self.add(course: course)
            //self.myTableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true)

    }
    
    func add(course: String){
        let index = 0
        var x = cellData()
        x.courseName = course
        x.courseGrade = 0
        x.courseCredit = 1
        array.insert(x, at: index)
        let indexPath = IndexPath(row: index, section: 0)
        myTableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBOutlet var myTableView: UITableView!
    
    @IBAction func edit(_ sender: Any) {
        myTableView.isEditing = !myTableView.isEditing
        if(myTableView.isEditing == true){
            editButton.title = "Done"
        }else{
            editButton.title = "Edit"
        }
    }
    @IBOutlet var editButton: UIBarButtonItem!
    
    //var numberOfRowsOfTheTable: Double = 10
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cellFor100")
        cell.textLabel?.text = array[indexPath.row].courseName
        cell.detailTextLabel?.text = "Push and Enter your Grade and Credit"
        cell.backgroundColor = #colorLiteral(red: 0.0862628296, green: 0.08628197759, blue: 0.08625862747, alpha: 1)
        cell.textLabel?.textColor = #colorLiteral(red: 0.9531772733, green: 0.5895730853, blue: 0.2420593798, alpha: 1)
        cell.detailTextLabel?.textColor = #colorLiteral(red: 0.9531772733, green: 0.5895730853, blue: 0.2420593798, alpha: 1)
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(item, at: destinationIndexPath.row)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    @IBOutlet var Calculate: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Calculate.layer.cornerRadius = 10
        Calculate.layer.masksToBounds = true
        //array = []
        array.removeAll()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidAppear(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else{ return }
        array.remove(at: indexPath.row)
        myTableView.deleteRows(at: [indexPath], with: .automatic)
        i = i-1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex100 = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
//////////*Actions*//////////
    @IBAction func Back(_ sender: Any) {
        i=0
        dismiss(animated: true, completion: nil)
    }
    @IBAction func CalculateAction(_ sender: Any) {
        
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
        //var res2 = 0.0
        //var k2 = 0
        var ii = 0
        //////////
        if(i == 0){
            displayMyAlertMessage(userMessage: "You should fill all the sections you made Or made one.")
            return
        }else{
            //var i = 0
            k = 0
            res = 0.0
            //res2 = 0.0
            //k2 = 0
            ii = 0
            while(ii<i){
                k = k + data100ForCalculate[ii].credit!
                if(data100ForCalculate[ii].grade! <= 100 && data100ForCalculate[ii].grade! >= 97){
                    res = res + 4.0 * Double(data100ForCalculate[ii].credit!)
                }
                if(data100ForCalculate[ii].grade! < 97 && data100ForCalculate[ii].grade! >= 93){
                    res = res + 4.0 * Double(data100ForCalculate[ii].credit!)
                }
                if(data100ForCalculate[ii].grade! < 93 && data100ForCalculate[ii].grade! >= 90){
                    res = res + 3.7 * Double(data100ForCalculate[ii].credit!)
                }
                if(data100ForCalculate[ii].grade! < 90 && data100ForCalculate[ii].grade! >= 87){
                    res = res + 3.3 * Double(data100ForCalculate[ii].credit!)
                }
                if(data100ForCalculate[ii].grade! < 86 && data100ForCalculate[ii].grade! >= 83){
                    res = res + 3.0 * Double(data100ForCalculate[ii].credit!)
                }
                if(data100ForCalculate[ii].grade! < 83 && data100ForCalculate[ii].grade! >= 80){
                    res = res + 2.7 * Double(data100ForCalculate[ii].credit!)
                }
                if(data100ForCalculate[ii].grade! < 80 && data100ForCalculate[ii].grade! >= 77){
                    res = res + 2.3 * Double(data100ForCalculate[ii].credit!)
                }
                if(data100ForCalculate[ii].grade! < 77 && data100ForCalculate[ii].grade! >= 73){
                    res = res + 2.0 * Double(data100ForCalculate[ii].credit!)
                }
                if(data100ForCalculate[ii].grade! < 73 && data100ForCalculate[ii].grade! >= 70){
                    res = res + 1.7 * Double(data100ForCalculate[ii].credit!)
                }
                if(data100ForCalculate[ii].grade! < 70 && data100ForCalculate[ii].grade! >= 67){
                    res = res + 1.3 * Double(data100ForCalculate[ii].credit!)
                }
                if(data100ForCalculate[ii].grade! < 67 && data100ForCalculate[ii].grade! >= 65){
                    res = res + 1.0 * Double(data100ForCalculate[ii].credit!)
                }
                if(data100ForCalculate[ii].grade! < 65 && data100ForCalculate[ii].grade! >= 0){
                    res = res + 0 * Double(data100ForCalculate[ii].credit!)
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
            var x = SwiftNewsVideo()
            for k in 0...i-1{
                x.showNumber = data100ForCalculate[k].name
                x.viewCount = data100ForCalculate[k].grade! * 60.0
                lastTenShows.append(x)
            }
        }
    }
//////////*Actions*//////////
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 0.6) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
    func displayMyAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Attention", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
