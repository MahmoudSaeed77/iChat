//
//  SettingController.swift
//  iChat
//
//  Created by Mohamed Ibrahem on 7/8/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class SettingController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
//    let inst = CustomCell()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomCell
        
        cell.logoutButton.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        
        return cell
    }
    
    @objc func logoutAction(){
        print("logedout")
        
        FUser.logOutCurrentUser { (success) in
            if success {
                self.logout()
            }
        }
    }
    
    
    
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
            ])
        
        
        
        
    }
    
    
    
    func logout(){
        
        
        let vc = ViewController()
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
}

