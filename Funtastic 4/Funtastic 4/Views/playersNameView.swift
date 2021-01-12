//
//  playersNameView.swift
//  Funtastic 4
//
//  Created by mohamad on 1/10/21.
//

import SwiftUI

import Foundation

let userDefaults = UserDefaults.standard


struct playersNameView: View {
    @State var p1 : String = ""
    @State var p2 : String = ""
    @State var showView = false
    var body: some View {
        ZStack{
            if self.showView {
                
                VStack {
                    gameView(p1: $p1, p2: $p2)
                   // testViewToo()
                }
            } else {
                VStack{
                    TextField("Player one name", text: $p1)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Text("VS")
                        .font(.system(size: 200))
                    TextField("Player two name", text: $p2)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action: {
                        self.showView.toggle()
                        let array = [p1,p2]
                        userDefaults.set(array, forKey: "myKey")
                    }, label: {
                        Text("Lets play")
                            .padding()
                    })
                }
            }
        }
    }
}

func savenames() {
    
}
struct playersNameView_Previews: PreviewProvider {
    static var previews: some View {
        playersNameView()
            .previewDevice("iPhone 11")
    }
}
