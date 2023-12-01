import UIKit
import SnapKit


class InitialPageVC: UIViewController {
    //MARK - Properties (view)
    
    private let logoIcon = UIImageView() // circular, upper center of the ios device
    private let appName = UILabel() // directly under the logo, centered on the screen in the scenter 
    private let appDescripation = UILabel() // directly under app name, the text is also centered
    private let logInButton = UIButton() // under app descrip 
    private let signUpButton = UIButton() // under 
   
    // MARK - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        //helper methods for setting up views
        setupLogoIcon()
        setupAppName() // title is Quizz Rizz
        setupAppDescription()
        setupLogInButton() // pushing this takes you to the next vc - log in
        setupSignUpButton() // pushing this takes you to the next 
        setupPushVCButton() //
    }
        
   
    }

    // MARK - Set Up Views
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
        appName.text = "Quizz Rizz"
        appName.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(appName)
        
        appName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoIcon.snp.bottom).offset(20)
        }
    }

    private func setupAppDescription() {
        appDescription.text = "Your app description goes here"
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
        // Implement log in button action here
        let logInVC = LogInViewController() // Replace with your actual LogInViewController
        navigationController?.pushViewController(logInVC, animated: true)
    }

    @objc private func signUpButtonTapped() {
        // Implement sign up button action here
        let signUpVC = SignUpViewController() // Replace with your actual SignUpViewController
        navigationController?.pushViewController(signUpVC, animated: true)
    }




    
    
