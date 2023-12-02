import UIKit

class LogInVC: UIViewController {

    // MARK - Properties (view)
    private let pageHeader = UILabel()
    private let usernameText = UILabel()
    private let inputUsername = UITextField()
    private let passwordText = UILabel()
    private let inputPassword = UITextField()

    private let logInButton = UIButton()

    // MARK - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Helper methods for setting up views
        setupPageHeader()
        setupUsernameText()
        setupInputUsername()
        setupPasswordText()
        setupInputPassword()
        setupLogInButton()
    }

    // MARK - Set Up Views

    private func setupPageHeader() {
        // Customize pageHeader properties
        pageHeader.textAlignment = .center
        view.addSubview(pageHeader)
        // Set up constraints for pageHeader using SnapKit
        pageHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
    }

    private func setupUsernameText() {
        // Customize usernameText properties
        view.addSubview(usernameText)
        // Set up constraints for usernameText using SnapKit
        usernameText.snp.makeConstraints { make in
            make.top.equalTo(pageHeader.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputUsername() {
        // Customize inputUsername properties
        view.addSubview(inputUsername)
        // Set up constraints for inputUsername using SnapKit
        inputUsername.snp.makeConstraints { make in
            make.top.equalTo(usernameText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupPasswordText() {
        // Customize passwordText properties
        view.addSubview(passwordText)
        // Set up constraints for passwordText using SnapKit
        passwordText.snp.makeConstraints { make in
            make.top.equalTo(inputUsername.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputPassword() {
        // Customize inputPassword properties
        view.addSubview(inputPassword)
        // Set up constraints for inputPassword using SnapKit
        inputPassword.snp.makeConstraints { make in
            make.top.equalTo(passwordText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupLogInButton() {
        // Customize logInButton properties
        view.addSubview(logInButton)
        // Set up constraints for logInButton using SnapKit
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(inputPassword.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }

    // MARK: - Button Actions
    @objc private func logInButtonTapped() {
        guard let username = inputUsername.text,
              let password = inputPassword.text else {
            // Handle missing input
            return
        }

        // Call your login function from NetworkManager
        NetworkManager.shared.logIn(username: username, password: password) { success in
            if success {
                // Handle successful login, e.g., navigate to the next screen
                print("Login Successful")
                let homePageVC = HomePageVC()
                viewController.navigationController?.pushViewController(homePageVC, animated: true)
            } else {
                // Handle login failure, show an error message, etc.
                print("Login failed.")
            }
            completion(success)
        }
    }
}
