    //
    //  ContentView.swift
    //  Funtastic 4
    //
    //  Created by mohamad on 1/10/21.
    //
    // Main page
    import SwiftUI
    
    struct ContentView: View {
        @State var showingPopup = false //for easter egg
        @State var f1 = false //for easter egg
        @State var f2 = false //for easter egg
        var body: some View {
            ZStack {
                NavigationView(){
                    ZStack {
                        Color.black
                            .ignoresSafeArea()
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
                                        .font(.custom("BebasNeue-Regular", size:48))
                                        .foregroundColor(.red)
                                        .padding()
                                }).onLongPressGesture {
                                    f2 = true
                                }
                            Spacer()
                            NavigationLink(
                                destination: recoredsView(),
                                label: {
                                    Text("Games Records")
                                        .font(.custom("BebasNeue-Regular", size:48))
                                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
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
                }
            }.popup(isPresented: $showingPopup, autohideIn: 5) {
                VStack {
                    Text("🎉Congratulations🎉")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Text("you found the easter egg , send the sceenshoot to the discored channel to recive your prize  ")
                        .foregroundColor(.black)
                }
                .frame(width:300   , height: 300 )
                .background(Color(red: 1, green: 1, blue: 1))
                .cornerRadius(50.0)
}

        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewDevice("iPhone 11")
        }
    }
