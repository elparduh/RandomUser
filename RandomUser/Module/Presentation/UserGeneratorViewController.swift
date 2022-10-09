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
  }

  private func layout() {
    view.addSubview(dataView)
    view.addSubview(userGenerateButton)
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
  func showError(message: String) {
    print(message)
  }

  func showLoader() {
    userGenerateButton.configuration?.showsActivityIndicator = true
  }

  func hideLoader() {
    userGenerateButton.configuration?.showsActivityIndicator = false
  }

  func diplayUserData(userData: UserData) {
    dataView.usernameLabel.text = (userData.firstName ?? "") + " " + (userData.lastName ?? "")
  }
}
