//
//  TimeTableViewController.swift
//  HealthNotification
//
//  Created by Rotach Roman on 07.11.2020.
//

import UIKit

//var time = TimeTableView()

final class TimeTableViewController: UIViewController, UITableViewDelegate {
    
    var times = ["10:00", "11:00", "12:00"]
    
    private var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
    }

    private func setupTableView(){
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
    
}

extension TimeTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = times[indexPath.row]
        return cell
    }
    
    
}
