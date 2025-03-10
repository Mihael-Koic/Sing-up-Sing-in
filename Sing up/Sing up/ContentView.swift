//
//  ContentView.swift
//  Sing up
//
//  Created by Mihael Koic on 08.03.2025..
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isTermsAccepted: Bool = false
    @State private var navigateToSecondView = false
    
    var body: some View {
       NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    Text("Email")
                        .font(.headline)
                        .bold()
                        .offset(x: -145, y: 10)
                        .foregroundColor(.primary)

                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        .padding(.horizontal)
                    
                    Text("Password")
                        .font(.headline)
                        .bold()
                        .offset(x: -125, y: 10)
                        .foregroundColor(.primary)
                    
                    HStack {
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
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    
                    HStack{
                        Button(action:{
                            isTermsAccepted.toggle()
                            print("Acepted")
                        }) {
                            Image(systemName: isTermsAccepted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(isTermsAccepted ? .primary : .gray)
                        }
                        
                        Text("I accept the terms and privacy policy")
                            .font(.footnote)
                    }
                    .offset(x: -45, y: 5)
                    .padding(.horizontal)
                    
                    Button(action:{
                        print("Sing up")
                    }) {
                        Text("Sing up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.primary)
                            .foregroundColor(Color(uiColor: .systemBackground) .opacity(0.9))
                            .cornerRadius(50)
                    }
                    .padding(.horizontal)
                    .offset(y: 10)
                    
                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray.opacity(0.5))
                        
                        Text("Or Register with")
                            .foregroundColor(.secondary)
                            .font(.footnote)
                            .padding(.horizontal, 1)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray.opacity(0.5))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    HStack(spacing: 20) {
                        Button (action: {
                            print("facebook")
                        }) {
                            Image("facebook")
                                .resizable()
                                .frame(width: 35, height: 30)
                        }
                        .frame(width: 100, height: 80)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
                        
                        Button (action: {
                            print("Google")
                        }) {
                            Image("google")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        .frame(width: 100, height: 80)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
                        
                        Button (action: {
                            print("Apple")
                        }) {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.primary)
                        }
                        .frame(width: 100, height: 80)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
                        
                    }
                    .offset(y: 10)
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        
                        NavigationLink(destination: Login()) {
                            Text("Sing in")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                        }
                    }
                    
                    .offset(y: 20)
                }
                .padding()
           }
            .navigationTitle("Sing up")
        }
       .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
