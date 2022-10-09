//
//  ViewController.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import UIKit

class UserGeneratorViewController: UIViewController {
  var safeArea: UILayoutGuide!
  let dataView: DataCardView = DataCardView()
  let userGenerateButton: UIButton = UIButton(type:.system)
  let errorMessageLabel = UILabel()
  private let assemblerInjector : RamdomUserAssemblerInjector = RamdomUserAssemblerInjector()
  private var presenter : UserGeneratorPresenterProtocol!

  override func viewDidLoad() {
    super.viewDidLoad()
    safeArea = view.layoutMarginsGuide
    navigationItem.title = "RandomUser"
    style()
    layout()
    initializePresenter()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.presenter.retrieveUserData()
  }
}

extension UserGeneratorViewController {
  private func style() {
    view.backgroundColor = .systemBackground
    dataView.translatesAutoresizingMaskIntoConstraints = false
    userGenerateButton.translatesAutoresizingMaskIntoConstraints = false
    userGenerateButton.configuration = .filled()
    userGenerateButton.configuration?.imagePadding = 8
    userGenerateButton.setTitle("Generate", for: [])
    userGenerateButton.addTarget(self, action: #selector(generateTapped), for: .primaryActionTriggered)
    errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
    errorMessageLabel.textAlignment = .center
    errorMessageLabel.textColor = .systemRed
    errorMessageLabel.numberOfLines = .zero
    errorMessageLabel.text = "Error failure"
    errorMessageLabel.isHidden = true
  }

  private func layout() {
    view.addSubview(dataView)
    view.addSubview(userGenerateButton)
    view.addSubview(errorMessageLabel)
    //DataView
    NSLayoutConstraint.activate([
      safeArea.topAnchor.constraint(equalTo: dataView.topAnchor),
      safeArea.trailingAnchor.constraint(equalToSystemSpacingAfter: dataView.trailingAnchor, multiplier: 1),
      dataView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeArea.leadingAnchor, multiplier: 1)
    ])
    //Button
    NSLayoutConstraint.activate([
      userGenerateButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8),
      userGenerateButton.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
      userGenerateButton.trailingAnchor.constraint(equalTo: dataView.trailingAnchor),
      userGenerateButton.heightAnchor.constraint(equalToConstant: 48)
    ])
    ///ErrorLabel
    NSLayoutConstraint.activate([
      errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: dataView.bottomAnchor, multiplier: 2),
      errorMessageLabel.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
      errorMessageLabel.trailingAnchor.constraint(equalTo: dataView.trailingAnchor)
    ])
  }

  private func initializePresenter() {
    self.presenter = self.assemblerInjector.resolve(userGeneratorViewProtocol: self)
  }
}

extension UserGeneratorViewController {
  @objc func generateTapped(sender: UIButton) {
    self.presenter.retrieveUserData()
  }

  private func configureErrorView(withMessage message: String) {
    errorMessageLabel.isHidden = false
    errorMessageLabel.text = message
    shakeButton()
  }

  private func shakeButton() {
    let animation = CAKeyframeAnimation()
    animation.keyPath = "position.x"
    animation.values = [0, 10, -10, 10, 0]
    animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
    animation.duration = 0.4
    animation.isAdditive = true
    userGenerateButton.layer.add(animation, forKey: "shake")
  }

}

extension UserGeneratorViewController: UserGeneratorViewProtocol {
  func showError(_ error: String) {
    configureErrorView(withMessage: error)
  }

  func showLoader() {
    userGenerateButton.configuration?.showsActivityIndicator = true
  }

  func hideLoader() {
    userGenerateButton.configuration?.showsActivityIndicator = false
  }

  func diplayUserData(userData: UserData) {
    guard let urlString = userData.picture else { return }
    dataView.userImageView.loadImageUsingCache(withUrl: urlString)
    dataView.usernameLabel.text = "I'm \(userData.firstName ?? "") \(userData.lastName ?? "")"
    dataView.userDataLabel.text = "I am \(userData.age ?? 0) years old.\nI am from \(userData.country ?? "").\nPlease call me at \(userData.phone ?? "") or send me an email to \(userData.email ?? "")"
    clearErrorMessageLabel()
  }

  func clearErrorMessageLabel() {
    if errorMessageLabel.text != ""{
      errorMessageLabel.text = String()
      errorMessageLabel.isHidden = true
    }
  }
}
