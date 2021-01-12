    //
    //  ContentView.swift
    //  Funtastic 4
    //
    //  Created by mohamad on 1/10/21.
    //
    
    import SwiftUI
    
    struct ContentView: View {
        var body: some View {
            NavigationView(){
                VStack(){
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(width: 400, height: 400)
                    Spacer()
                    Spacer()
                    NavigationLink(
                        destination: playersNameView(),
                        label: {
                            Text("play")
                                .padding()
                        })
                    Spacer()
                    NavigationLink(
                        destination: recoredsView(),
                        label: {
                            Text("Games Recores")
                                .padding()
                        })
                    Spacer()
                    Spacer()
                }
            }
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewDevice("iPhone 11")
        }
    }
