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
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        return tableView
    }()
    
    private lazy var teamsViewModel = TeamsViewModel()
    private lazy var aurdioManagerViewModel = AudioManagerViewModel()
    
    override func loadView() {
        view = UIView()
        setup()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
    }
}

private extension ChantsViewController {
    func setup() {
        // appbar text
        self.navigationController?.navigationBar.topItem?.title = "Football Chants"
        // kindof sliver app bar
        self.navigationController?.navigationBar.prefersLargeTitles = true
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
        return teamsViewModel.teams.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
        let team = teamsViewModel.teams[indexPath.row]
        print(team)
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TeamTableViewCell.cellId,
            for: indexPath
        ) as! TeamTableViewCell
        
        cell.configure(with: team, deligate: self)
        return cell
    }
}

extension ChantsViewController : TeamTableViewCellDelegate {
    func didTapPlayBack(for team: Team) {
        aurdioManagerViewModel.playback(team)
        teamsViewModel.togglePlayback(for: team)
        tableView.reloadData()
    }
}
