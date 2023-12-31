import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    // MARK: - Signup Method
    func signUp(email: String, phoneNumber: String, username: String, password: String, confirmPassword: String, completion: @escaping (Bool) -> Void) {
        let endpoint = "http://34.150.222.142/register/"
        
        let parameters: [String: Any] = [
            "email": email,
            "phoneNumber": phoneNumber,
            "username": username,
            "password": password,
            "confirmPassword": confirmPassword
        ]

        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    // Signup successful
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.signUp: \(error.localizedDescription)")
                    completion(false)
                }
            }
    }

    // MARK: - Login Method
    func logIn(username: String, password: String, completion: @escaping (Bool) -> Void) {
        let endpoint = "http://34.150.222.142/login/"
        
        let parameters: [String: Any] = [
            "username": username,
            "password": password
        ]

        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    // Login successful
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.logIn: \(error.localizedDescription)")
                    completion(false)
                }
            }
    }

    // MARK: - Logout Method
    func logOut(completion: @escaping (Bool) -> Void) {
        let endpoint = "http://34.150.222.142/logout/"
        
        AF.request(endpoint, method: .post)
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.logOut: \(error.localizedDescription)")
                    completion(false)
                }
            }
    }

    // MARK: - Category API Methods

    // Get all categories
    func getAllCategories(completion: @escaping ([Category]) -> Void) {
        let endpoint = "http://34.150.222.142/api/categories/"

        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Category].self) { response in
                switch response.result {
                case .success(let categories):
                    completion(categories)
                case .failure(let error):
                    print("Error in NetworkManager.getAllCategories: \(error.localizedDescription)")
                    completion([])
                }
            }
    }

    // Create a category
    func createCategory(name: String, description: String, folder: String, completion: @escaping (Category?) -> Void) {
        let endpoint = "http://34.150.222.142/api/categories/"

        let parameters: [String: Any] = [
            "name": name,
            "description": description,
            "folder": folder
        ]

        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Category.self) { response in
                switch response.result {
                case .success(let category):
                    completion(category)
                case .failure(let error):
                    print("Error in NetworkManager.createCategory: \(error.localizedDescription)")
                    completion(nil)
                }
            }
    }

    // Delete a category by ID
    func deleteCategoryByID(id: Int, completion: @escaping (Bool) -> Void) {
        let endpoint = "http://34.150.222.142/api/categories/\(id)/"

        AF.request(endpoint, method: .delete)
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.deleteCategoryByID: \(error.localizedDescription)")
                    completion(false)
                }
            }
    }

    // Update a category's name or description by ID
    func updateCategoryByID(id: Int, name: String?, description: String?, completion: @escaping (Category?) -> Void) {
        let endpoint = "http://34.150.222.142/api/categories/\(id)/"

        var parameters: [String: Any] = [:]
        if let name = name {
            parameters["name"] = name
        }
        if let description = description {
            parameters["description"] = description
        }

        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Category.self) { response in
                switch response.result {
                case .success(let category):
                    completion(category)
                case .failure(let error):
                    print("Error in NetworkManager.updateCategoryByID: \(error.localizedDescription)")
                    completion(nil)
                }
            }
    }

    // MARK: - Flashcard API Methods

    // Get all flashcards in a specified category by ID
    func getAllFlashcards(categoryID: Int, completion: @escaping ([Flashcard]) -> Void) {
        let endpoint = "http://34.150.222.142/api/flashcards/\(categoryID)/"

        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Flashcard].self) { response in
                switch response.result {
                case .success(let flashcards):
                    completion(flashcards)
                case .failure(let error):
                    print("Error in NetworkManager.getAllFlashcards: \(error.localizedDescription)")
                    completion([])
                }
            }
    }

    // Get a random flashcard in a specified category by ID
    func getRandomFlashcard(categoryID: Int, completion: @escaping (Flashcard?) -> Void) {
        let endpoint = "http://34.150.222.142/api/flashcards-random/\(categoryID)/"

        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: Flashcard.self) { response in
                switch response.result {
                case .success(let flashcard):
                    completion(flashcard)
                case .failure(let error):
                    print("Error in NetworkManager.getRandomFlashcard: \(error.localizedDescription)")
                    completion(nil)
                }
            }
    }

    // Create a flashcard in a specified category by ID
    func createFlashcard(categoryID: Int, content: String, answer: String, completion: @escaping (Flashcard?) -> Void) {
        let endpoint = "http://34.150.222.142/api/flashcards/\(categoryID)/"

        let parameters: [String: Any] = [
            "content": content,
            "answer": answer
        ]

        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Flashcard.self) { response in
                switch response.result {
                case .success(let flashcard):
                    completion(flashcard)
                case .failure(let error):
                    print("Error in NetworkManager.createFlashcard: \(error.localizedDescription)")
                    completion(nil)
                }
            }
    }

    // Delete a flashcard by ID
    func deleteFlashcardByID(id: Int, completion: @escaping (Bool) -> Void) {
        let endpoint = "http://34.150.222.142/api/flashcards/\(id)/"

        AF.request(endpoint, method: .delete)
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.deleteFlashcardByID: \(error.localizedDescription)")
                    completion(false)
                }
            }
    }

    // Update a flashcard's content or answer by ID
    func updateFlashcardByID(id: Int, content: String?, answer: String?, completion: @escaping (Flashcard?) -> Void) {
        let endpoint = "http://34.150.222.142/api/flashcards-update/\(id)/"

        var parameters: [String: Any] = [:]
        if let content = content {
            parameters["content"] = content
        }
        if let answer = answer {
            parameters["answer"] = answer
        }

        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Flashcard.self) { response in
                switch response.result {
                case .success(let flashcard):
                    completion(flashcard)
                case .failure(let error):
                    print("Error in NetworkManager.updateFlashcardByID: \(error.localizedDescription)")
                    completion(nil)
                }
            }
    }
    // MARK: - Folder API Methods

    // Make a folder for a user
    func makeFolderForUser(name: String, completion: @escaping (Bool) -> Void) {
        let endpoint = "http://34.150.222.142/api/folders/"

        let parameters: [String: Any] = [
            "name": name
        ]

        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.makeFolderForUser: \(error.localizedDescription)")
                    completion(false)
                }
            }
    }

    // Get all folders for a user
    func getAllFoldersForUser(completion: @escaping ([Folder]) -> Void) {
        let endpoint = "http://34.150.222.142/api/folders/"

        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Folder].self) { response in
                switch response.result {
                case .success(let folders):
                    completion(folders)
                case .failure(let error):
                    print("Error in NetworkManager.getAllFoldersForUser: \(error.localizedDescription)")
                    completion([])
                }
            }
    }

    // Get all categories within a folder
    func getAllCategoriesInFolder(folderName: String, completion: @escaping ([Category]) -> Void) {
        let endpoint = "http://34.150.222.142/api/folders/\(folderName)/"

        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Category].self) { response in
                switch response.result {
                case .success(let categories):
                    completion(categories)
                case .failure(let error):
                    print("Error in NetworkManager.getAllCategoriesInFolder: \(error.localizedDescription)")
                    completion([])
                }
            }
    }

    }
