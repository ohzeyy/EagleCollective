// This code assumes Asset catalog has an image file named "logo"
// also assumes that the first View returned after successful login is called "ListView"
// After pasting this, be sure you update the "App" file so that it loads
// LoginView as the first View.

import SwiftUI
import Firebase

struct LoginView: View {
    enum Field {
        case email, password
    }
    
    @State private var email = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var buttonsDisabled = true
    @State private var presentSheet = false
    @FocusState private var focusField: Field?
    
    var body: some View {
        ZStack {
            
            Color.clear
                .ignoresSafeArea()
                .background(
                    Image("blurry")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                )
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                
                Text("Please use your BC email.")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                    .padding()
                    .padding(.top)
                
                
                Group {
                    TextField("E-mail", text: $email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .submitLabel(.next)
                        .focused($focusField, equals: .email) // this field is bound to the .email case
                        .onSubmit {
                            focusField = .password
                        }
                        .onChange(of: email) { _ in
                            enableButtons()
                        }
                        .padding(.bottom)
                    
                    SecureField("Password", text: $password)
                        .textInputAutocapitalization(.never)
                        .submitLabel(.done)
                        .focused($focusField, equals: .password) // this field is bound to the .password case
                        .onSubmit {
                            focusField = nil // will dismiss the keyboard
                        }
                        .onChange(of: password) { _ in
                            enableButtons()
                        }
                }
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                
                HStack {
                    Button {
                        register()
                    } label: {
                        Text("SIGN UP")
                    }
                    .padding(.trailing)
                    
                    Button {
                        login()
                    } label: {
                        Text("LOG IN")
                    }
                    .padding(.leading)
                }
                .disabled(buttonsDisabled)
                .font(.title2)
                .fontWeight(.black)
                .padding(.top)
                .tint(.white)
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {}
            }
            .onAppear {
                // if logged in when app runs, navigate to the new screen & skip login screen
                if Auth.auth().currentUser != nil {
                    print("🪵 Login Successful!")
                    presentSheet = true
                }
            }
            .fullScreenCover(isPresented: $presentSheet) {
                HomescreenView()
            }
        }
    }
    
    func enableButtons() {
        let emailIsGood = email.count >= 6 && email.contains("@bc.edu")
        let passwordIsGood = password.count >= 6
        buttonsDisabled = !(emailIsGood && passwordIsGood)
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error { // login error occurred
                print("😡 SIGN-UP ERROR: \(error.localizedDescription)")
                alertMessage = "SIGN-UP ERROR: \(error.localizedDescription)"
                showingAlert = true
            } else {
                print("😎 Registration success!")
                presentSheet = true
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error { // login error occurred
                print("😡 LOGIN ERROR: \(error.localizedDescription)")
                alertMessage = "LOGIN ERROR: \(error.localizedDescription)"
                showingAlert = true
            } else {
                print("🪵 Login Successful!")
                presentSheet = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
