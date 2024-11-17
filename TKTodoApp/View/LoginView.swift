import SwiftUI
import AuthenticationServices

struct LoginView: View {

    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isSignup: Bool = false
    @State private var animateBackground: Bool = false
    @StateObject private var viewModel = LoginViewModel()
    
    
    
    var body: some View {
        ZStack{
            
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
        
        VStack {
            Image("login")
                .resizable()
                .frame(width: 200,height: 200)
            
            VStack {
                Text("Login")
                    .bold()
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                }
                
                
    // email pargraf and actions
                TKTextField(text: $viewModel.email, placeholder: "Email", image: "envelope")
  
                
            // thisis is tessting to make simple the code with out show button of the password
                
                
                
                
                //  TKTextField(text: $password, placeholder: "Password", image: "lock", isSecure: true)
                
           
    // this is password pargraf
                
                
                
                HStack {
                    Image(systemName: "lock")
                    
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                        
                    } else {
                        SecureField("Password", text: $password)
                    }
             
                  
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 6)
                .background(Divider(), alignment: .bottom)
                .padding(.bottom, 8)
                
 // actions button press actions  with full informations
                
                
         
                    
                TKButton(label: "Login") {
                    viewModel.Login()
                        
                           }
                      
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            HStack{
                VStack{Divider()}
                Text("Or")
                    .bold()
                VStack{Divider()}
            }
            
            // sign up button for add from TKButton SwiftUI file 
            VStack(spacing: 10){
                TKButton(label: "SignUP With Email", iconName: "envelope") {
                    
                    isSignup.toggle()
                    
                       }
               
                TKButton(label: "Signin With Google", iconImage: Image("google")) {
                    
                }
                // apple signin button add from libery
                
                SignInWithAppleButton(.signIn) {
                    result in
                }onCompletion: { result in
                    
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .signInWithAppleButtonStyle(.whiteOutline)
                .shadow(color: .black, radius: 4, x: 0, y: 2)
              
            }
            .padding()
        }
        .padding()
                    .sheet(isPresented: $isSignup) {
                        SignupView()
                    }
                }
            }
        }

        #Preview {
            LoginView()
        }
