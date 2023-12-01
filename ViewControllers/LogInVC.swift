//MARK - Properties (view)
// MARK - viewDidLoad
// MARK - Set Up Views
// MARK: - Button Actions
//log in credentials page
import UIKit
import SnapKit



class LogInVC: UIViewController {
    
    // MARK - Properties (view)
    let pageHeader = UILabel()
    let usernameText = UILabel()
    let inputUsername = UITextField()
    let passwordText = UILabel()
    let inputPassword = UITextField()
    let logInButton = UIButton()

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
        pageHeader.translatesAutoresizingMaskIntoConstraints = false
        pageHeader.textAlignment = .center
        // Customize pageHeader properties
        view.addSubview(pageHeader)
        // Set up constraints for pageHeader using SnapKit
        pageHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
    }

    private func setupUsernameText() {
        usernameText.translatesAutoresizingMaskIntoConstraints = false
        // Customize usernameText properties
        view.addSubview(usernameText)
        // Set up constraints for usernameText using SnapKit
        usernameText.snp.makeConstraints { make in
            make.top.equalTo(pageHeader.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputUsername() {
        inputUsername.translatesAutoresizingMaskIntoConstraints = false
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
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        // Customize passwordText properties
        view.addSubview(passwordText)
        // Set up constraints for passwordText using SnapKit
        passwordText.snp.makeConstraints { make in
            make.top.equalTo(inputUsername.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputPassword() {
        inputPassword.translatesAutoresizingMaskIntoConstraints = false
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
        logInButton.translatesAutoresizingMaskIntoConstraints = false
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
        guard let username = inputUsername.text, !username.isEmpty,
              let password = inputPassword.text, !password.isEmpty else {
            // Show an alert or handle the case where either username or password is empty
            return
        }

        performLogin(username: username, password: password)
    }

    private func performLogin(username: String, password: String) {
        // Implement the logic to POST username and password to the backend
        // You can use URLSession, Alamofire, or any other networking library for this task
        // Example using URLSession:
        // - Construct your API endpoint URL
        // - Create a URLRequest with the endpoint
        // - Set the HTTP method to POST
        // - Set the Content-Type header to "application/json"
        // - Encode your username and password as JSON in the HTTP body
        // - Send the request, handle the response (success or failure)
    }
}



    
    
