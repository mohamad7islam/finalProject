//
//  testView.swift
//  Funtastic 4
//
//  Created by mohamad on 1/11/21.
//

//import SwiftUI
//
//struct testView: View {
//    @State private var isBirthday = false
//    @State private var age = ""
//    @State private var name = ""
//
//    private let defaults = UserDefaults.standard
//
//    var body: some View {
//        VStack {
//            Spacer()
//            TextField("Enter your name", text: $name)
//            TextField("Enter your age.", text: $age)
//            Toggle(isOn: $isBirthday) {
//                Text("Is it your birthday?")
//            }.padding()
//            Spacer()
//
//            Text("\(name)")
//            Text("\(age)")
//            Text(isBirthday ? "Happy Birthday!" : "Hello \(name)")
//            Spacer()
//            HStack {
//                Button("Save") {
//                    self.save()
//                }
//                .padding(30)
//                .border(Color.blue)
//
//                Button("Load") {
//                    self.load()
//                }
//                .padding(30)
//                .border(Color.green)
//
//            }
//        }
//    //      .onAppear(perform: load)
//        .textFieldStyle(RoundedBorderTextFieldStyle())
//    }
//
//    func save() {
//        defaults.set(isBirthday, forKey: "birthday")
//        defaults.set(age, forKey: "age")
//        defaults.set(name, forKey: "name")
//    }
//
//    func load() {
//        let savedName = defaults.string(forKey: "name")
//        let savedAge = defaults.string(forKey: "age")
//        let savedBirthday = defaults.bool(forKey: "birthday")
//
//        isBirthday = savedBirthday
//        // using nil coalescing operator as a guard for the optional values but there are other ways to handle this.
//        age = savedAge ?? ""
//        name = savedName ?? ""
//      }
//    }
//
//
//
//
//struct testView_Previews: PreviewProvider {
//    static var previews: some View {
//        testView()
//    }
//}
//

//
//{
//        @State var showView = false
//
//        var body: some View {
//            GeometryReader { proxy in
//                ZStack {
//                    if self.showView {
//                        VStack {
//                            gameView()
//                            Button(action: {
//                                withAnimation {
//                                    self.showView.toggle()
//                                }
//                            }, label: {
//                                Text("Back")
//                            })
//                        }
//                        .frame(width: proxy.size.width, height: proxy.size.height)
//                        .background(Color.red)
//                        .transition(.move(edge: .trailing))
//                    } else {
//                        VStack {
//                            Text("Home View")
//                            Button(action: {
//                                withAnimation {
//                                    self.showView.toggle()
//                                }
//                            }, label: {
//                                Text("Settings")
//                            })
//                        }
//                        .frame(width: proxy.size.width, height: proxy.size.height)
//                        .background(Color.green)
//                    }
//                }
//            }
//        }
//}

