import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    
    
    var body: some View {
        VStack {
            Image("login")
                .resizable()
                .frame(height: 400)
            
            VStack {
                Text("Login")
                    .bold()
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
                
                HStack{
                    Image(systemName: "envelope")
                    TextField("Email", text: $email)
                }
                .padding(.vertical, 6)
                .background(Divider(), alignment: .bottom)
                .padding(.bottom, 8)
                
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
                
 // actions button
                Button(action: {}, label:{ Text("Login")
                    .bold()
                    .foregroundStyle(Color.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,15)
                    .background(Color.gray)
                    .cornerRadius(8)
                       }  )
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
