//
//  ContentView.swift
//  LBTASwiftUILoginPage
//
//  Created by Darya Yilmaz on 13.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
              
                VStack(spacing: 16) {
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    if !isLoginMode {
                    Button {
                        
                    } label: {
                        Image(systemName: "person.fill")
                        .font(.system(size: 80))
                        .padding()
                        .clipShape(Circle())
                                    .overlay {
                                        Circle().stroke(.gray, lineWidth: 2)
                                    }
                    }
                    }
                    Group {
                        TextField ("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            SecureField ("Password", text: $password)
                    }
                    .padding(12)
                        .background(Color.white)
                    
                    Button {
                       handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                               
                                            
                            
                            Spacer()
                        }.background(Color.blue)
                    }
                }
                    .padding()
               
                }
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
            .ignoresSafeArea())
        }
    }
    private func handleAction() {
        if isLoginMode {
            print("Should log into Database")
            
        } else {
            print("Register a new account inside of Database")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



