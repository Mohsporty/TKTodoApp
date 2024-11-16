import SwiftUI

struct SignupView: View {
    
    
    @StateObject private var viewModel= SignupViewModels()
    @State private var animateBackground: Bool = false
    
    
    
  /*  @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = "" */
    
    var body: some View {
        ZStack {
            // animations bacground 
            LinearGradient(
                gradient: Gradient(colors: animateBackground ? [Color.blue, Color.purple] : [Color.pink, Color.orange]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            .animation(
                Animation.easeInOut(duration: 4).repeatForever(autoreverses: true),
                value: animateBackground
            )
            .onAppear {
                animateBackground.toggle()
            }
            
            VStack(spacing: 20) {
                
                
            // signup text
                
                
                Text("Signup with Email")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white, Color.yellow]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .padding(.top, 40)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Complete Your Registration")
                        .font(.system(size: 25, weight: .medium))
                        .foregroundColor(.white)
                    Text("You only have access to this information.")
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.horizontal)
                
                VStack(spacing: 15) {
                    // informstion requet bar
                    TKTextField(text: $viewModel.name, placeholder: "Name", image: "person")
                    
                    TKTextField(text: $viewModel.email, placeholder: "Email", image: "envelope")
                    
                    TKTextField(text: $viewModel.password, placeholder: "Password", image: "lock", isSecure: true)
                    
                    TKTextField(text: $viewModel.confirmPassword, placeholder: "Confirm Password", image: "lock", isSecure: true)
                    
                    //  Suign up button
                    TKButton(label: "Signup") {
                         // action of the button
                    }
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.yellow, Color.orange]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .cornerRadius(8)
                    )
                }
                .padding()
                .background(
                    Color.white.opacity(0.2)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                )
                .padding(.horizontal)
            }
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    SignupView()
}
