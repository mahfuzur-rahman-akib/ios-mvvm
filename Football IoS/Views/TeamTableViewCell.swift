//
//  TeamTableViewCell.swift
//  Football IoS
//
//  Created by Mahfuzur Rahman on 9/7/26.
//

import UIKit

protocol TeamTableViewCellDelegate: AnyObject {
    func didTapPlayBack(for team : Team)
}

class TeamTableViewCell: UITableViewCell {
    
    static let cellId = "TeamTableViewCell"
    
    // UI
    // Full Container
    private lazy var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // element to element gap
    private lazy var contentStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    //playButton
    private lazy var playBackButtonView : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    // icon
    private lazy var iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // name lable
    private lazy var nameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    
    // found lable
    private lazy var foundLabel : UILabel = {
        let foundLabel = UILabel()
        foundLabel.translatesAutoresizingMaskIntoConstraints = false
        foundLabel.font = .systemFont(ofSize: 12, weight: .bold)
        foundLabel.textColor = .white
        foundLabel.numberOfLines = 0
        return foundLabel
    }()
    
    // job lable
    private lazy var jobLabel : UILabel = {
        let jobLabel = UILabel()
        jobLabel.translatesAutoresizingMaskIntoConstraints = false
        jobLabel.font = .systemFont(ofSize: 12, weight: .light)
        jobLabel.textColor = .white
        jobLabel.numberOfLines = 0
        return jobLabel
    }()
    
    // info lable
    private lazy var infoLabel : UILabel = {
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = .systemFont(ofSize: 14, weight: .medium)
        infoLabel.textColor = .white
        infoLabel.numberOfLines = 0
        return infoLabel
    }()
    
    private weak var delegate : TeamTableViewCellDelegate?
    private var team : Team?
    
    // border radius
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegate = nil
        self.containerView.subviews.forEach({$0.removeFromSuperview()})
    }
    
    func configure(with item: Team, deligate : TeamTableViewCellDelegate) {
        self.delegate = deligate
        self.team = item
        
        playBackButtonView.addTarget(self, action: #selector(didTapPlayBack), for: .touchUpInside)
        
        containerView.backgroundColor = item.id.background
        iconImageView.image = item.id.badge
        playBackButtonView.setImage(item.isPlaying ? Assets.pause : Assets.play, for: .normal)
        nameLabel.text = item.name
        foundLabel.text = item.founded
        jobLabel.text = "Current \(item.manager.job.rawValue) :  \(item.manager.name)"
        infoLabel.text = item.info
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(contentStackView)
        
        containerView.addSubview(iconImageView)
        containerView.addSubview(playBackButtonView)
        
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(foundLabel)
        contentStackView.addArrangedSubview(jobLabel)
        contentStackView.addArrangedSubview(infoLabel)
        
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -8),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.topAnchor.constraint(equalTo : contentStackView.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo : containerView.leadingAnchor,constant: 8),
            
            contentStackView.topAnchor.constraint(equalTo : containerView.topAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo : containerView.bottomAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo : iconImageView.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo : playBackButtonView.leadingAnchor, constant: -12),
            
            playBackButtonView.heightAnchor.constraint(equalToConstant: 44),
            playBackButtonView.widthAnchor.constraint(equalToConstant: 44),
            playBackButtonView.trailingAnchor.constraint(equalTo : containerView.trailingAnchor, constant: -8),
            playBackButtonView.centerYAnchor.constraint(equalTo : containerView.centerYAnchor),
        ])
    }
    
    @objc func didTapPlayBack() {
        if let team = team {
            delegate?.didTapPlayBack(for: team)
        }
    }
}
