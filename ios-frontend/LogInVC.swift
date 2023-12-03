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

        setupPageHeader()
        setupUsernameText()
        setupInputUsername()
        setupPasswordText()
        setupInputPassword()
        setupLogInButton()
    }

    // MARK - Set Up Views

    private func setupPageHeader() {
        pageHeader.textAlignment = .center
        view.addSubview(pageHeader)
        pageHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
    }

    private func setupUsernameText() {
        view.addSubview(usernameText)
        usernameText.snp.makeConstraints { make in
            make.top.equalTo(pageHeader.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputUsername() {
        view.addSubview(inputUsername)
        inputUsername.snp.makeConstraints { make in
            make.top.equalTo(usernameText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupPasswordText() {
        view.addSubview(passwordText)
        passwordText.snp.makeConstraints { make in
            make.top.equalTo(inputUsername.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputPassword() {
        view.addSubview(inputPassword)
        inputPassword.snp.makeConstraints { make in
            make.top.equalTo(passwordText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupLogInButton() {
        view.addSubview(logInButton)
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
            return
        }

        NetworkManager.shared.logIn(username: username, password: password) { success in
            if success {
                print("Login Successful")
                let homePageVC = HomePageVC()
                viewController.navigationController?.pushViewController(homePageVC, animated: true)
            } else {
                print("Login failed.")
            }
            completion(success)
        }
    }
}
