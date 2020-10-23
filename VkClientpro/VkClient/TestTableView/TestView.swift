//
//  TestView.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 08.10.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit
import RealmSwift

class TestView: UIView {

   let tableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        super.updateConstraints()
    }
    
    func setup(){
        backgroundColor = .white
        setupTableView()
        setNeedsUpdateConstraints()
    }
    
    private func setupTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .blue
        addSubview(tableView)
    }
}
