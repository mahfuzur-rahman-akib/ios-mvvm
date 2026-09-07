//
//  ChantsViewController.swift
//  Football IoS
//
//  Created by Mahfuzur Rahman on 9/5/26.
//

import UIKit

class ChantsViewController: UIViewController {
    
    // ui table view (laxu load)
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: "TeamTableViewCell")
        return tableView
    }()
    
    override func loadView() {
        view = UIView()
        setup()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemBlue
        
    }
}

private extension ChantsViewController {
    func setup() {
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
}

extension ChantsViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TeamTableViewCell.cellId,
            for: indexPath
        ) as! TeamTableViewCell
        
        cell.configure()
        return cell
    }
}
