//
//  Second.swift
//  Belzidrpath
//
//  Created by Luiz Pedro Franciscatto Guerra on 11/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

let textArray = ["Lorem ipsum", "Dolor sit amet", "Consectetur adipiscing elit", "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", "Ut enim ad minim veniam"]

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // do your stuff here brother
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.backgroundColor = .white
    }
    
    @IBAction func switchAction(_ sender: Any) {
        var background = UIColor.white
        var labelsColors = UIColor.black
        if self.view.backgroundColor == .white {
            background = ApplicationColors.darkBackground!
            labelsColors = .white
        }
        UIView.animate(withDuration: 1, animations: {
            self.view.backgroundColor = background
            self.tableView.backgroundColor = background
            self.titleLabel.textColor = labelsColors
            self.tableView.visibleCells.forEach {
                if let cell = $0 as? TableCell {
                    cell.backgroundColor = background
                    cell.label.textColor = labelsColors
                }
            }
            
        })
    }
    
    
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableCell = self.tableView.dequeueReusableCell(withIdentifier: "cel") as! TableCell
        cell.setData(str: textArray[indexPath.row], index: indexPath.row)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        guard let cell = self.tableView.cellForRow(at: indexPath) as? TableCell else { return }
        cell.unselectCellAnimation()
    }
    
}

class TableCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    var circleStuff: CircleStuff!
    var circle: CAShapeLayer!
    var trackCircle: CAShapeLayer!
    var wasSelected = false
    
    func setData (str: String, index: Int) {
        self.label.text = str
        let circleStuff = CircleStuff(fillColor: .clear, strokeColor: ApplicationColors.ModerateCyan!, strokeSize: 3, radius: 18)
        self.circleStuff = circleStuff
        let position = CGPoint(x: 64, y: 27)
        self.trackCircle = circleStuff.createTrackLayer(position: position)
        self.circle = circleStuff.createCircle(position: position)
        self.contentView.layer.addSublayer(self.trackCircle)
        self.contentView.layer.addSublayer(self.circle)
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(index*50), execute: {
            circleStuff.animateToCreation(layer: self.circle)
        })
        self.contentView.layer.cornerRadius = 16
    }
    
    func unselectCellAnimation () {
        if self.wasSelected {
            self.wasSelected = false
            self.backgroundColor = .white
            self.circleStuff.animateToCreation(layer: circle)
            self.label.textColor = ApplicationColors.ModerateCyan
        } else {
            self.wasSelected = true
            self.label.textColor = .white
            self.backgroundColor = ApplicationColors.ModerateCyan
            self.trackCircle.strokeColor = UIColor.white.cgColor
            self.circleStuff.animateToCompletion(layer: circle)
        }
    }
    
}
