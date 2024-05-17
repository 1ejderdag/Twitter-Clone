//
//  ImageUploader.swift
//  Twitter-Clone
//
//  Created by Ejder Dağ on 17.05.2024.
//

import FirebaseStorage
import Firebase
import UIKit

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) { // @escaping -> fonksiyon çalışmasını bitirdikten sonra çalışacaktır.
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image with Error: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl) //
            }
        }
        
    }
}


