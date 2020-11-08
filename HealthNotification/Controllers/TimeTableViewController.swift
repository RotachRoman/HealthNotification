//
//  TimeTableViewController.swift
//  HealthNotification
//
//  Created by Rotach Roman on 07.11.2020.
//

import UIKit

final class TimeTableViewController: UIViewController, UITableViewDelegate {
    
    private var tableView = UITableView()
    var timesModel: [TimeTableModel] = [TimeTableModel]()
//    var timesModel = Set<TimeTableModel>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        editNavigation()
        crateArray()
        setupTableView()
        setupConstraints()
    }
    
    private func editNavigation(){
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationItem.title = "Health"
    }

    private func setupTableView(){
        view.addSubview(tableView)
        
        tableView.register(CellHealtViewController.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupConstraints() {
        
        let safe = view.safeAreaLayoutGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: safe.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: safe.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: safe.rightAnchor).isActive = true
    }
    
    fileprivate func crateArray(){
        timesModel.append(TimeTableModel(time: "9:00"))
        timesModel.append(TimeTableModel(time: "10:00"))
        timesModel.append(TimeTableModel(time: "11:00"))
    }
    
}

extension TimeTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timesModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellHealtViewController
        let times = timesModel[indexPath.row]
        cell.time = times
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
