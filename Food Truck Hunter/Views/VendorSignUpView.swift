import SwiftUI

struct VendorSignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var form = SignUpViewModel(formModel: FormModel(email: "", password: ""), type: "vendor")
    
    @State private var showPassword: Bool = false
    @State private var showReenterPassword: Bool = false
    @State private var isTextFieldClear: Bool = false
    @State private var isClicked: Bool = false
    
    func signUpUser() {
        self.isClicked.toggle()
        self.form.signUpAction()
        self.isClicked.toggle()
    }
     
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height:100)
                Text("Vendor Registration")
                    .font(.system(size:35))
                    .bold()
                Spacer()
                    .frame(height:15)
                Text("Helping small business grow. Sign up today!")
                    .font(.system(size: 14))
                    .padding(.bottom, 18)
                
                Section(header: Text("Owner Information").font(.system(size: 14)).opacity(0.6).padding(.bottom, 2)) {
                    Group {
                        Text("First Name").padding(.bottom, 0)
                        ZStack(alignment: .trailing) {
                            TextField("", text: self.$form.firstName)
                                .keyboardType(.alphabet)
                                .autocapitalization(.none)
                                .padding(.all)
                                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                .cornerRadius(5)

                            if (!self.form.firstName.isEmpty && !self.isTextFieldClear) {
                                Button(action: {
                                    self.isTextFieldClear.toggle()
                                    self.form.firstName = ""
                                    self.form.setFirstName("")
                                    self.isTextFieldClear.toggle()
                                }) {
                                    Image(systemName: "multiply").foregroundColor(Color(UIColor.opaqueSeparator))
                                }.padding(.trailing, 20)
                            }
                        }.padding(.vertical, 0)
                        
                        Text(self.form.getFirstNameHintLabel())
                            .font(.system(size: 14))
                            .foregroundColor(Color.red)
                            .padding(.bottom, 2.0)
                            .animation(.easeInOut)
                        
                        Text("Last Name").padding(.bottom, 0)
                        ZStack(alignment: .trailing) {
                            TextField("", text: self.$form.lastName)
                                .keyboardType(.alphabet)
                                .autocapitalization(.none)
                                .padding(.all)
                                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                .cornerRadius(5)

                            if (!self.form.lastName.isEmpty && !self.isTextFieldClear) {
                                Button(action: {
                                    self.isTextFieldClear.toggle()
                                    self.form.lastName = ""
                                    self.form.setLastName("")
                                    self.isTextFieldClear.toggle()
                                }) {
                                    Image(systemName: "multiply").foregroundColor(Color(UIColor.opaqueSeparator))
                                }.padding(.trailing, 20)
                            }
                        }.padding(.vertical, 0)
                        
                        Text(self.form.getLastNameHintLabel())
                            .font(.system(size: 14))
                            .foregroundColor(Color.red)
                            .padding(.bottom, 2.0)
                            .animation(.easeInOut)
                    }
                }.padding(.bottom, 4)
                
                Section(header: Text("Truck Information").font(.system(size: 14)).opacity(0.6).padding(.bottom, 2)) {
                    Group {
                        Text("Truck Name").padding(.bottom, 0)
                        ZStack(alignment: .trailing) {
                            TextField("", text: self.$form.truckName)
                                .padding(.all)
                                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                .cornerRadius(5)

                            if (!self.form.truckName.isEmpty && !self.isTextFieldClear) {
                                Button(action: {
                                    self.isTextFieldClear.toggle()
                                    self.form.truckName = ""
                                    self.form.setTruckName("")
                                    self.isTextFieldClear.toggle()
                                }) {
                                    Image(systemName: "multiply").foregroundColor(Color(UIColor.opaqueSeparator))
                                }.padding(.trailing, 20)
                            }
                        }.padding(.vertical, 0)
                        
                        Text(self.form.getTruckNameHintLabel())
                            .font(.system(size: 14))
                            .foregroundColor(Color.red)
                            .padding(.bottom, 2.0)
                            .animation(.easeInOut)
                            
                        Text("Phone Number").padding(.bottom, 0)
                        ZStack(alignment: .trailing) {
                            TextField("", text: self.$form.phoneNumber)
                                .keyboardType(.phonePad)
                                .padding(.all)
                                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                .cornerRadius(5)
                            
                            if (!self.form.phoneNumber.isEmpty && !self.isTextFieldClear) {
                                Button(action: {
                                    self.isTextFieldClear.toggle()
                                    self.form.setPhoneNumber("")
                                    self.isTextFieldClear.toggle()
                                }) {
                                    Image(systemName: "multiply").foregroundColor(Color(UIColor.opaqueSeparator))
                                }.padding(.trailing, 20)
                            }
                        }.padding(.vertical, 0)
                        
                        Text(self.form.getPhoneNumberHintLabel())
                            .font(.system(size: 14))
                            .foregroundColor(Color.red)
                            .padding(.bottom, 2.0)
                            .animation(.easeInOut)
                    }
                    
                    Group {
                        Group {
                            Text("Email Address").padding(.bottom, 0)
                            ZStack(alignment: .trailing) {
                                TextField("", text: self.$form.email)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                    .padding(.all)
                                    .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                    .cornerRadius(5)

                                if (!self.form.email.isEmpty && !self.isTextFieldClear) {
                                    Button(action: {
                                        self.isTextFieldClear.toggle()
                                        self.form.email = ""
                                        self.form.setEmail("")
                                        self.isTextFieldClear.toggle()
                                    }) {
                                        Image(systemName: "multiply").foregroundColor(Color(UIColor.opaqueSeparator))
                                    }.padding(.trailing, 20)
                                }
                            }.padding(.vertical, 0)

                            Text(self.form.getEmailHintLabel())
                                .font(.system(size: 14))
                                .foregroundColor(Color.red)
                                .padding(.bottom, 2.0)
                                .animation(.easeInOut)
                        }
                        
                        Group {
                            Text("Password").padding(.bottom, 0)
                            ZStack(alignment: .trailing) {
                                if showPassword {
                                    TextField("", text: self.$form.password)
                                        .autocapitalization(.none)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        .cornerRadius(5)
                                }
                                else {
                                    SecureField("", text: self.$form.password)
                                        .autocapitalization(.none)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        .cornerRadius(5)
                                }

                                Button(action: {
                                    self.showPassword.toggle()
                                }) {
                                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill").foregroundColor(Color(UIColor.opaqueSeparator))
                                }.padding(.trailing, 20)
                            }.padding(.vertical, 0)
                            
                            if(self.form.getPasswordHintLabel().isEmpty) {
                                Text("7+ Characters, 1 Capital Letter, 1 Special Character")
                                    .font(.system(size: 14))
                                    .opacity(0.5)
                            }
                            
                            // Password Hint Label
                            Text(self.form.getPasswordHintLabel())
                                .font(.system(size: 14))
                                .foregroundColor(Color.red)
                                .padding(.bottom, 2.0)
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(.easeInOut)
                        }
                        
                        Group {
                            Text("Confirm Password").padding(.bottom, 0)
                            ZStack(alignment: .trailing) {
                                if showReenterPassword {
                                    TextField("", text: self.$form.retypedPassword)
                                        .autocapitalization(.none)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        .cornerRadius(5)
                                }
                                else {
                                    SecureField("", text: self.$form.retypedPassword)
                                        .autocapitalization(.none)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        .cornerRadius(5)
                                }

                                Button(action: {
                                    self.showReenterPassword.toggle()
                                }) {
                                    Image(systemName: showReenterPassword ? "eye.slash.fill" : "eye.fill").foregroundColor(Color(UIColor.opaqueSeparator))
                                }.padding(.trailing, 20)
                            }.padding(.vertical, 0)
                            
                            if (self.form.getPasswordRetypedHintLabel().isEmpty) {
                                Text("Both passwords must match")
                                    .font(.system(size: 14))
                                    .opacity(0.5)
                            }
                            
                            // Confirm Password Hint Label
                            Text(self.form.getPasswordRetypedHintLabel())
                                .font(.system(size: 14))
                                .foregroundColor(Color.red)
                                .padding(.bottom, 2)
                                .animation(.easeInOut)
                        }
                    }
                }
                
                if(!self.isClicked) {
                    DefaultButton(label: "Create account", function: self.signUpUser)
                }
                
            }.padding(.horizontal, 22)
        }
        .background(Color(UIColor(red: 0.15, green: 0.80, blue: 0.97, alpha: 1.00)))
        .ignoresSafeArea(edges:.bottom)
        .ignoresSafeArea(edges:.top)
       // .navigationTitle(("Vendor Registration"))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.form.resetForm()
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(Color.red)
                Text("Account")
                    .foregroundColor(Color.red)
            }
        })
    }
}
