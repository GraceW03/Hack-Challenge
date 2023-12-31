import SnapKit

class SeeProfileVC: UIViewController {
    // MARK: - Properties (view)
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let bioLabel = UILabel()
    private let universityLabel = UILabel()
    private let majorLabel = UILabel()
    private let seeStudySetsButton = UIButton()
    private let editProfileButton = UIButton()

    private var university: String = ""
    private var major: String = ""

    weak var delegate: SaveProfileDelegate?

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupProfileImageView()
        setupNameLabel()
        setupUserNameLabel()
        setupBioLabel()
        setupUniversityLabel()
        setupMajorLabel()
        setupSeeStudySetsButton()
        setupEditProfileButton()
    }

    // MARK: - Set Up Views

    private func setupProfileImageView() {
        profileImageView.image = UIImage(named: "profile_image_name")
        view.addSubview(profileImageView)
        profileImageView.layer.borderWidth = 1.0
        profileImageView.layer.cornerRadius = 128
        profileImageView.clipsToBounds = true
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(256)
        }
    }

    private func setupNameLabel() {
        nameLabel.text = "Name"
        nameLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }

    private func setupUserNameLabel() {
        usernameLabel.text = "@username"
        usernameLabel.font = .systemFont(ofSize: 20, weight: .regular)
        usernameLabel.textColor = .black
        view.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }

    private func setupBioLabel() {
        bioLabel.text = "Welcome to my study sets page. This is my bio."
        bioLabel.font = .italicSystemFont(ofSize: 16)
        bioLabel.textColor = .black
        view.addSubview(bioLabel)
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }

    private func setupUniversityLabel() {
        universityLabel.text = "Your University" 
        universityLabel.font = .systemFont(ofSize: 20)
        universityLabel.textColor = .black
        view.addSubview(universityLabel)
        universityLabel.snp.makeConstraints { make in
            make.top.equalTo(bioLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }

    private func setupMajorLabel() {
        majorLabel.text = "Your Major" 
        majorLabel.font = .systemFont(ofSize: 20)
        majorLabel.textColor = .black
        view.addSubview(majorLabel)
        majorLabel.snp.makeConstraints { make in
            make.top.equalTo(universityLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }

    private func setupSeeStudySetsButton() {
        seeStudySetsButton.setTitle("See Study Sets", for: .normal)
        seeStudySetsButton.backgroundColor = .blue
        view.addSubview(seeStudySetsButton)
        seeStudySetsButton.snp.makeConstraints { make in
            make.top.equalTo(majorLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        seeStudySetsButton.addTarget(self, action: #selector(seeStudySetsButtonTapped), for: .touchUpInside)
    }

    private func setupEditProfileButton() {
        editProfileButton.setTitle("Edit Profile", for: .normal)
        editProfileButton.backgroundColor = .green
        view.addSubview(editProfileButton)
        editProfileButton.snp.makeConstraints { make in
            make.top.equalTo(seeStudySetsButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        editProfileButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)
    }

    // MARK: - Button Actions

    @objc private func seeStudySetsButtonTapped() {
        delegate?.saveProfile(university: university, major: major)
    }

    @objc private func editProfileButtonTapped() {
        let editProfileVC = EditProfileVC(university: university, major: major, saveProfileDelegate: self)
        navigationController?.pushViewController(editProfileVC, animated: true)
    }
}

extension SeeProfileVC: SaveProfileDelegate {
    func saveProfile(university: String, major: String) {
        self.university = university
        self.major = major
        universityLabel.text = university
        majorLabel.text = major
    }
}

protocol SaveProfileDelegate: AnyObject {
    func saveProfile(university: String, major: String)
}
