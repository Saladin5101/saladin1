//  ContentView.swift
//  MyClean
//
//  Created by minmin on 2025/1/14.
//

import SwiftUI

struct ContentView: View {
    @State private var isDeleting = false
    
    var body: some View {
        VStack {
            Button("Clear Cache") {
                isDeleting = true
                deleteCacheFiles()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(isDeleting)
            
            if isDeleting {
                Text("Deleting cache files...")
            }
        }
        .frame(minWidth: 200, minHeight: 100)
    }
//UI
    func deleteCacheFiles() {
        let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        guard let url = cacheURL else { return }
        
        do {
            
            let fileURLs = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [])
            
            
            for fileURL in fileURLs {
                try FileManager.default.removeItem(at: fileURL)
            }
            
            print("Cache files deleted successfully.")
        } catch {
            print("Could not delete cache files: code\(error)")
        }
    }
}
//Clean
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
//UI
