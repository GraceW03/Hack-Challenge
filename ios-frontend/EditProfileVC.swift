import UIKit

class EditProfileVC: UIViewController {
    
    // MARK: - Properties (view)
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let universityLabel = UILabel()
    private let universityTextField = UITextField()
    private let majorLabel = UILabel()
    private let majorTextField = UITextField()
    private let saveButton = UIButton()
    
    // MARK: - Properties (data)
    private var profileImage: UIImage?
    private var university: String = ""
    private var major: String = ""
    private weak var saveProfileDelegate: SaveProfileDelegate!
    
    // MARK: - viewDidLoad and init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Edit Profile"
        setupProfileImageView()
        setupUniversity()
        setupMajor()
        setupSaveButton()
    }
    
    init(university: String, major: String, saveProfileDelegate: ProfileVC) {
        super.init(nibName: nil, bundle: nil)
        self.university = university
        self.major = major
        self.saveProfileDelegate = saveProfileDelegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Set Up Views
    
    private func setupProfileImageView() {
        profileImageView.image = profileImage
        profileImageView.layer.borderWidth = 1.0
        profileImageView.layer.cornerRadius = 128
        profileImageView.clipsToBounds = true
        view.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(256)
        }
    }

    private func setupUniversity() {
        universityLabel.text = "University"
        universityLabel.font = .systemFont(ofSize: 16)
        universityLabel.textColor = .black
        view.addSubview(universityLabel)
        
        universityLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        
        universityTextField.text = university
        universityTextField.layer.borderWidth = 1.0
        view.addSubview(universityTextField)
        
        universityTextField.snp.makeConstraints { make in
            make.top.equalTo(universityLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }
    
    private func setupMajor() {
        // Set up major label
        majorLabel.text = "Major"
        majorLabel.font = .systemFont(ofSize: 16)
        majorLabel.textColor = .black
        view.addSubview(majorLabel)
        
        majorLabel.snp.makeConstraints { make in
            make.top.equalTo(universityTextField.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        // Set up major text field
        majorTextField.text = major
        majorTextField.layer.borderWidth = 1.0
        view.addSubview(majorTextField)
        
        majorTextField.snp.makeConstraints { make in
            make.top.equalTo(majorLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }
    
    private func setupSaveButton() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .green
        saveButton.layer.cornerRadius = 16
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.height.equalTo(56)
        }
    }
    
    // MARK: - Button Action
    
    @objc private func saveButtonTapped() {
        saveProfileDelegate?.saveProfile(university: universityTextField.text ?? "", major: majorTextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}
