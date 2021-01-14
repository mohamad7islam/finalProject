//
//  loadingView.swift
//  Funtastic 4
//
//  Created by mohamad on 1/13/21.
//



// ### NOT MY WORK ###
// but I edited it 
import SwiftUI
import Foundation
struct loadingView: View {
    @State private var isBallSwaping = false
    
    var body: some View {
       // Color.getBGColor()
        ZStack {
            Color.black
                .ignoresSafeArea()
            ZStack {
                HStack {
                    Circle()
                        .fill(Color.getFirstBallColor())
                        .frame(width: 30, height: 30)
                    Circle()
                        .fill(Color.getFirstBallColor())
                        .frame(width: 30, height: 30)
                       
                } .offset(x: CGFloat(40),y: isBallSwaping ? -40 : 0)
                HStack {
                    Circle()
                        .fill(Color.getSecondBallColor())
                        .frame(width: 30, height: 30)
                    Circle()
                        .fill(Color.getSecondBallColor())
                        .frame(width: 30, height: 30)
                        
             }.offset(x: CGFloat(40),y: isBallSwaping ? 40 : 0)
            }.frame(width: 320, height: 60, alignment: .center)
            .offset(x: -35)
            .animation(Animation.linear(duration: 1).repeatForever())
            .onAppear() {
                isBallSwaping.toggle()
        }
        }
    }
}


extension Color {
    
    static
    func getBGColor() -> Color {
        return Color(red: 0/255, green: 0/255, blue: 0/255)
    }
        
    static
    func getFirstBallColor() -> LinearGradient {
        let colors = [Color.init(red: 1, green: 0, blue: 0), Color.init(red: 1, green: 0, blue: 0)]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }

    static
    func getSecondBallColor() -> LinearGradient {
        let colors = [Color.init(red: 0, green: 0, blue: 1), Color.init(red: 0, green: 0, blue: 1)]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
}

