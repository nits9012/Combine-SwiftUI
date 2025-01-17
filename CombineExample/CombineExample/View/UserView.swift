//
//  UserView.swift
//  CombineExample
//
//  Created by Nitin Bhatt on 15/01/25.
//

import SwiftUI

struct UserView: View {
    @StateObject private var viewModel = UserViewModel()
    /// Default Image
    let defaultAvatarImage = "person.circle.fill"
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.users) { user in
                    HStack {
                        Image(systemName: defaultAvatarImage)
                            .resizable()
                            .modifier(ImageStyleModifier())
                        
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 12)
                    }
                }
            }
            .navigationTitle("Users")
        }.onAppear {
            // Fetch users when the view appears
            viewModel.fetchUsers()
        }
    }
}

#Preview {
    UserView()
}


// Define the custom view modifier
struct ImageStyleModifier: ViewModifier {
    // The body of the view modifier
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 50, height: 50)
            .foregroundColor(.gray)
            .clipShape(Circle())
            .shadow(radius: 5)
    }
}
