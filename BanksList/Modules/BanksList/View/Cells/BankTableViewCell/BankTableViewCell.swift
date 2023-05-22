//
//  BankTableViewCell.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import UIKit

class BankTableViewCell: UITableViewCell {

    // MARK: - UIVariables

    private let cellImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let extraInfoLabel = UILabel()

    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

extension BankTableViewCell {

    func configure(_ configFile: BankTableViewConfigFile) {
        titleLabel.text = configFile.title
        descriptionLabel.text = configFile.description
        extraInfoLabel.text = configFile.extraInfo
        
        cellImageView.imageLoader.load(from: configFile.cellImageURL)
    }
}

// MARK: - Setup

extension BankTableViewCell {

    private func setupViews() {
        setupContentView()
        setupCellImageView()
        setupTitleLabel()
        setupExtraInfoLabel()
        setupDescriptionLabel()
    }

    private func setupDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: LayoutConstant.descriptionFontSize)
        
        contentView.addSubview(descriptionLabel)
    }

    private func setupExtraInfoLabel() {
        extraInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        extraInfoLabel.font = .systemFont(ofSize: LayoutConstant.extraInfoFontSize)

        contentView.addSubview(extraInfoLabel)
    }

    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: LayoutConstant.titleFontSize)
        
        contentView.addSubview(titleLabel)
    }

    private func setupCellImageView() {
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(cellImageView)
    }

    private func setupContentView() {
        contentView.backgroundColor = .white
    }

    private func setupConstraints() {
        // bankImage
        cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: LayoutConstant.bankImageMargin).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: LayoutConstant.bankImageMargin).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: -LayoutConstant.bankImageMargin).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant: LayoutConstant.bankImageSize).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: LayoutConstant.bankImageSize).isActive = true
        
        // titleLabel
        titleLabel.topAnchor.constraint(equalTo:  cellImageView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor,
                                            constant: LayoutConstant.textsMargin).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: extraInfoLabel.leadingAnchor,
                                             constant: LayoutConstant.textsMargin).isActive = true
        
        // extraInfoLabel
        extraInfoLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        extraInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -LayoutConstant.textsMargin).isActive = true
        
        // descriptionLabel
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                              constant: LayoutConstant.descriptionTopMargin).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor,
                                                  constant: LayoutConstant.textsMargin).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                   constant: -LayoutConstant.textsMargin).isActive = true
    }
}
