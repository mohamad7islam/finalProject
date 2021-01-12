    //
    //  ContentView.swift
    //  Funtastic 4
    //
    //  Created by mohamad on 1/10/21.
    //
    
    import SwiftUI

    struct ContentView: View {
        @State var showingDetail = false
        var body: some View {
            VStack(){
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 250.0, height: 250.0)
                Spacer()
                Button(action: {
                            self.showingDetail.toggle()
                        }) {
                            Text("play")
                        }.sheet(isPresented: $showingDetail) {
                            playersNameView()
                        }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Games Recores")
                        .padding()
                })
                Spacer()
                
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewDevice("iPhone 11")
        }
    }
