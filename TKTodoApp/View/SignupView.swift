import SwiftUI

struct SignupView: View {
    
    @StateObject private var viewModel = SignupViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            VStack (alignment: .leading, spacing: 8) {
                Text("Complete Your Profile")
                    .font(.system(size: 25, weight: .medium))
                Text("Don't worry only you can see this information (personal data)")
            }
            .padding(.top,20)
            .padding()
            
            VStack {
                TKTextField(text: $viewModel.name, placeholder: "Name", image: "person")
                
                TKTextField(text: $viewModel.email, placeholder: "Email", image: "envelope")
                
                TKTextField(text: $viewModel.password, placeholder: "Password", image: "lock", isSecure: true)
                
                TKTextField(text: $viewModel.confirmPassword, placeholder: "Confirm Password", image: "lock", isSecure: true)
                
                TKButton(label: "Signup") {
                    viewModel.register()
                }
            }
            .padding()
        }
    }
}

#Preview {
    SignupView()
}
