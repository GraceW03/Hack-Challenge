import SnapKit

class ProfileVC: UIViewController {
    // MARK: - Properties (view)
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let bioLabel = UILabel()
    private let universityLabel = UILabel()
    private let majorLabel = UILabel()
    private let seeStudySets = UIButton()
    private let editProfile = UIButton()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupProfileImageView()
        setupNameLabel()
        setupBioLabel()
        setupUniversityLabel()
        setupMajorLabel()
        setupSeeStudySetsButton()
        setupEditProfileButton()
    }

    // MARK: - Set Up Views

    private func setupNameLabel() {
        nameLabel.text = "Dwain"
        nameLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }

    private func setupProfileImageView() {
        profileImageView.image = UIImage(named: )
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

    private func setupBioLabel() {
        bioLabel.text = "this project is very difficult"
        bioLabel.font = .italicSystemFont(ofSize: 16)
        bioLabel.textColor = .black
        view.addSubview(bioLabel)
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }

    private func setupUniversityLabel() {
        // Set up university label using SnapKit
    }

    private func setupMajorLabel() {
        // Set up major label using SnapKit
    }

    private func setupSeeStudySetsButton() {
        // Set up seeStudySets button using SnapKit
    }

    private func setupEditProfileButton() {
        // Set up editProfile button using SnapKit
    }
}
