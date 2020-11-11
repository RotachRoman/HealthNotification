//
//  CellHealtViewController.swift
//  HealthNotification
//
//  Created by Rotach Roman on 08.11.2020.
//

import UIKit

class CellHealtViewController: UITableViewCell {
    
    var time : TimeTableModel? {
        didSet {
            timeL.text = time?.timeLable
            toggle.setOn(time?.iDistributer ?? true, animated: true)
        }
    }
    
    private let timeL : UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.boldSystemFont(ofSize: 32)
        lable.textAlignment = .left
        return lable
    }()
    
    private var toggle: UISwitch = {
        let swch = UISwitch()
        swch.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        return swch
    }()
    
    @objc func switchValueDidChange(_ sender: UISwitch)
    {
        if (sender.isOn == true){
            time?.iDistributer = false
        }
        else{
            time?.iDistributer = true
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
                 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Settings view
    private func setupViews() {
        addSubview(timeL)
        contentView.addSubview(toggle)
    }
    
    //MARK: - Settings Constraint
    private func setupConstraints(){
        
        timeL.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 8, paddingLeft: 24, paddingBottom: 5, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        toggle.anchor(top: topAnchor, left: timeL.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 120, paddingBottom: 0, paddingRight: 18, width: frame.size.width / 2, height: 0, enableInsets: false)

        
    }
    

}
