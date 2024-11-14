import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    
    
    var body: some View {
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
                
                
                
    // email pargraf and actions
                HStack{
                    Image(systemName: "envelope")
                    TextField("Email", text: $email)
                }
                .padding(.vertical, 6)
                .background(Divider(), alignment: .bottom)
                .padding(.bottom, 8)
                
                
                
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
        .background(Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    LoginView()
}
