//
//  playersNameView.swift
//  Funtastic 4
//
//  Created by mohamad on 1/10/21.
//

import SwiftUI

import Foundation



struct playersNameView: View {
    @State var p1 : String = ""
    @State var p2 : String = ""
    @State var showView = 0

    private func delay() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showView = 2
            }
        }
    var body: some View {
        ZStack{
            if self.showView == 2 {
                VStack {
                    gameView(p1: $p1, p2: $p2)
                   // testViewToo()
                }
            }
            else if self.showView == 1 {
                VStack{
                    loadingView()
                        .onAppear(perform : delay)
                }
            }
            else {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    VStack{
                        TextField("Player one name", text: $p1)
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 100, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Text("VS")
                            .font(.system(size: 200))
                            .foregroundColor(.white)
                        TextField("Player two name", text: $p2)
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 100, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button(action: {
                            self.showView = 1
                        }, label: {
                            Text("Lets play")
                                .padding()
                        })
                    }
                }
            }
        }
    }
}


struct playersNameView_Previews: PreviewProvider {
    static var previews: some View {
        playersNameView()
            .previewDevice("iPhone 11")
    }
}
