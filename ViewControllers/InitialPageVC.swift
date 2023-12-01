import UIKit
import SnapKit

class InitialPageVC: UIViewController {
    // MARK: - Properties (view)
    private let logoIcon = UIImageView()
    private let appName = UILabel()
    private let appDescription = UILabel()
    private let logInButton = UIButton()
    private let signUpButton = UIButton()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Helper methods for setting up views
        setupLogoIcon()
        setupAppName()
        setupAppDescription()
        setupLogInButton()
        setupSignUpButton()
    }

    // MARK: - Set Up Views
    private func setupLogoIcon() {
        logoIcon.image = UIImage(named: "placeholderlogo")
        logoIcon.contentMode = .scaleAspectFit
        logoIcon.layer.cornerRadius = logoIcon.frame.width / 2
        logoIcon.layer.masksToBounds = true

        view.addSubview(logoIcon)

        logoIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.width.height.equalTo(80)
        }
    }

    private func setupAppName() {
        appName.text = "QuizzRizz"
        appName.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(appName)

        appName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoIcon.snp.bottom).offset(20)
        }
    }

    private func setupAppDescription() {
        appDescription.text = "Rizz your crush with your top grades! Start studying with Quizz Rizz"
        appDescription.textAlignment = .center
        view.addSubview(appDescription)

        appDescription.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(appName.snp.bottom).offset(10)
        }
    }

    private func setupLogInButton() {
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.backgroundColor = .blue
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        view.addSubview(logInButton)

        logInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(appDescription.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }

    private func setupSignUpButton() {
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .green
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)

        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logInButton.snp.bottom).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }

    // MARK: - Button Actions
    @objc private func logInButtonTapped() {
        let logInVC = LogInViewController() // Replace with your actual LogInViewController
        navigationController?.pushViewController(logInVC, animated: true)
    }

    @objc private func signUpButtonTapped() {
        let signUpVC = SignUpViewController() // Replace with your actual SignUpViewController
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}


    
    
