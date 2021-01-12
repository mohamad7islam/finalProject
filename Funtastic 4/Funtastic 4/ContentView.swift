    //
    //  ContentView.swift
    //  Funtastic 4
    //
    //  Created by mohamad on 1/10/21.
    //
    
    import SwiftUI
    
    struct ContentView: View {
        @State var showingPopup = false
        @State var f1 = false
        @State var f2 = false
        var body: some View {
            ZStack {
                NavigationView(){
                    VStack(){
                        Spacer()
                        Image("logo")
                            .resizable()
                            .frame(width: 400, height: 400)
                            .onLongPressGesture {
                                f1 = true
                            }
                        Spacer()
                        Spacer()
                        NavigationLink(
                            destination: playersNameView(),
                            label: {
                                Text("play")
                                    .padding()
                            }).onLongPressGesture {
                                f2 = true
                            }
                        Spacer()
                        NavigationLink(
                            destination: recoredsView(),
                            label: {
                                Text("Games Recores")
                                    .padding()
                            }).onLongPressGesture {
                                if f1 && f2 {
                                    showingPopup = true
                                }
                            }
                        Spacer()
                        Spacer()
                    }
                }
            }.popup(isPresented: $showingPopup, autohideIn: 2) {
                HStack {
                    Text("Copied")
                }
                .frame(width: 200, height: 60)
                .background(Color(red: 1, green: 1, blue: 1))
                .cornerRadius(30.0)
}

        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewDevice("iPhone 11")
        }
    }
