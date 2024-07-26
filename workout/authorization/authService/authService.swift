//
//  authService.swift
//  workout
//
//  Created by vano Kvakhadze on 09.07.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import UIKit

class AuthService {
    public static let shared = AuthService()
    
   init() {}
    
    public func registerUser(with userRequest: RegisterUserRequest, completion: @escaping(Bool, Error?) -> Void) {
        let username = userRequest.username
        let weight = userRequest.weight
        let height = userRequest.height
        let email = userRequest.email
        let password = userRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            guard let resultUser = result?.user else{
                completion(false, nil)
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username" : username,
                    "mail" : email,
                    "height" : height,
                    "weight" : weight
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    completion(true, nil)
                }
        }
        
    }
    
    
    public func loginUser(with userRequest: LoginUserRequest, completion: @escaping (Error?) -> Void){
        Auth.auth().signIn(
            withEmail: userRequest.email,
            password: userRequest.password
        ) { result, error in
            if let error = error{
                completion(error)
                return
            }
            
            completion(nil)
        }
        
    }
    
    public func logOut(completion: @escaping (Error?)->Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
    
    public func fetchUser(completion: @escaping (UserInfo?, Error?) -> Void) {
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userUID)
            .getDocument { snapshot, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let snapshot = snapshot,
                   let snapshotData = snapshot.data(),
                   let username = snapshotData["username"] as? String,
                   let height = snapshotData["height"] as? Double,
                   let weight = snapshotData["weight"] as? Double {
                    let user = UserInfo(username: username, height: height, weight: weight, userUID: userUID)
                    completion(user, nil)
                }
                
            }
    }
    
    public func deleteUser(from viewController: UIViewController, completion: @escaping (Bool, Error?) -> Void) {
            guard let userUID = Auth.auth().currentUser?.uid else {
                completion(false, NSError(domain: "AuthService", code: 404, userInfo: [NSLocalizedDescriptionKey: "User not found"]))
                return
            }
            
            let db = Firestore.firestore()
            
            db.collection("users")
                .document(userUID)
                .delete { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
           
                    Auth.auth().currentUser?.delete { error in
                        if let error = error {
                            completion(false, error)
                            return
                        }
                        
                        completion(true, nil)
                        
                        DispatchQueue.main.async {
                            let VC = LoginVC()
                            VC.modalPresentationStyle = .fullScreen
                            viewController.present(VC, animated: true, completion: nil)
                        }
                    }
                }
        }
    
   public  func updateUser(username: String, height: Double, weight: Double, completion: @escaping (Bool, Error?) -> Void) {
          guard let userId = Auth.auth().currentUser?.uid else {
              completion(false, NSError(domain: "AuthService", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"]))
              return
          }

          let userRef = Firestore.firestore().collection("users").document(userId)
          userRef.updateData([
              "username": username,
              "height": height,
              "weight": weight
          ]) { error in
              if let error = error {
                  completion(false, error)
              } else {
                  completion(true, nil)
              }
          }
      }
}
