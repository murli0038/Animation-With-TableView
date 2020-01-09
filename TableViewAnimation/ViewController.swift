//
//  ViewController.swift
//  TableViewAnimation
//
//  Created by Nikunj Prajapati on 09/01/20.
//  Copyright © 2020 Nikunj Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    var arr = ["Ahmedabad","Amreli district","Anand","Banaskantha","Bharuch","Bhavnagar","Dahod","The Dangs","Gandhinagar","Jamnagar","Junagadh","Kutch","Kheda","Mehsana","Narmada","Navsari","Patan","Panchmahal","Porbandar","Rajkot","Sabarkantha","Surendranagar","Surat","Vyara","Vadodara","Valsad"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.name.text = arr[indexPath.row]
        cell.layer.cornerRadius = 35
        cell.layer.borderColor = UIColor.systemTeal.withAlphaComponent(0.3).cgColor
        cell.layer.borderWidth = 1.5
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        guard  editingStyle == .delete
            else{return}
        arr.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        cell.alpha = 0

        UIView.animate(
            withDuration: 0.2,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    func animation()
    {
        self.tableView.reloadData()
        let cells = tableView.visibleCells
        let tableHeight:CGFloat = tableView.bounds.size.height
        for i in cells
        {
            let cell : UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        var index = 0
        for m in cells
        {
            let cell : UITableViewCell = m as UITableViewCell
            UIView.animate(withDuration: 1,delay: 0.05*Double(index) , usingSpringWithDamping: 0.8,initialSpringVelocity: 0, options: [] , animations:{
                cell.transform = CGAffineTransform.identity} , completion: nil)
            index += 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        animation()
        // Do any additional setup after loading the view.
    }

    @IBAction func refreshBtnTapped(_ sender: Any)
    {
        animation()
    }
    
}

