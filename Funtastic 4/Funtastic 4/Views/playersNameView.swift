//
//  playersNameView.swift
//  Funtastic 4
//
//  Created by mohamad on 1/10/21.
//

import SwiftUI

struct playersNameView: View {
    @State var h : String = ""
    var body: some View {
        VStack{
            TextField("Player one name", text: $h)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("VS")
                .font(.system(size: 200))
            TextField("Player two name", text: $h)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Lets play")
                    .padding()
            })
        }
    }
}

struct playersNameView_Previews: PreviewProvider {
    static var previews: some View {
        playersNameView()
            .previewDevice("iPhone 11")
    }
}
