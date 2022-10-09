//
//  DataCardView.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import UIKit

class DataCardView: UIView {
  let stackView = UIStackView()
  let userImageView = UIImageView()
  let usernameLabel = UILabel()
  let userDataLabel = UILabel()
  let dividerView: UIView = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension DataCardView {
  func style() {
    backgroundColor = .secondarySystemBackground

    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 8

    userImageView.translatesAutoresizingMaskIntoConstraints = false
    userImageView.contentMode = .scaleAspectFit

    usernameLabel.translatesAutoresizingMaskIntoConstraints = false
    usernameLabel.textAlignment = .center
    usernameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    usernameLabel.adjustsFontForContentSizeCategory = true
    usernameLabel.numberOfLines = 0

    dividerView.translatesAutoresizingMaskIntoConstraints = false
    dividerView.backgroundColor = .secondarySystemFill

    userDataLabel.translatesAutoresizingMaskIntoConstraints = false
    userDataLabel.textAlignment = .center
    userDataLabel.font = UIFont.preferredFont(forTextStyle: .body)
    userDataLabel.adjustsFontForContentSizeCategory = true
    userDataLabel.numberOfLines = 0

    layer.cornerRadius = 5
    clipsToBounds = true
  }

  func layout() {
    stackView.addArrangedSubview(userImageView)
    stackView.addArrangedSubview(usernameLabel)
    stackView.addArrangedSubview(dividerView)
    stackView.addArrangedSubview(userDataLabel)

    addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
      trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
      bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
    ])
    dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
  }
}
