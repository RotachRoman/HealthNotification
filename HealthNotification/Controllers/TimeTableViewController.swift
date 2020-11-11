//
//  TimeTableViewController.swift
//  HealthNotification
//
//  Created by Rotach Roman on 07.11.2020.
//

import UIKit


final class TimeTableViewController: UIViewController, UITableViewDelegate {
    
    private var tableView = UITableView()
    public var timesArray: [TimeTableModel] = [TimeTableModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        editNavigation()
        setupTableView()
        setupConstraints()
    }
    
    @objc private func addTapped (){
        let alertController = UIAlertController(title: "Add time", message: "Enter new time for new notifications", preferredStyle: .alert)
        let addTime = UIAlertAction(title: "Add", style: .default) { action in
            let timeField = alertController.textFields?.first
            if let newTime = timeField?.text {
                self.timesArray.append(TimeTableModel(time: newTime))
                self.tableView.reloadData()
            }
        }
        alertController.addTextField{ _ in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        
        alertController.addAction(addTime)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Settings Navigation
    private func editNavigation(){
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationItem.title = "Health"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }

    //MARK: - Settings view
    private func setupTableView(){
        view.addSubview(tableView)
        
        tableView.register(CellHealtViewController.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - Settings Constraint
    private func setupConstraints() {
        let safe = view.safeAreaLayoutGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safe.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: safe.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: safe.rightAnchor).isActive = true
    }
}

// MARK: - Table view data source
extension TimeTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellHealtViewController
        let times = timesArray[indexPath.row]
        cell.time = times
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
