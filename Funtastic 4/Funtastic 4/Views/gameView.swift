//
//  gameView.swift
//  Funtastic 4
//
//  Created by mohamad on 1/10/21.
//

//import SwiftUI
//struct gameView: View {
//@State var circles : [[circle]] = .init(repeating: .init(repeating: circle() , count:7 ), count: 7)
//@State var flagx = 0
//@State var flagy = 0
//    var body: some View {
//        ZStack{
//            Color.black
//                .ignoresSafeArea()
//            VStack(spacing : 7){
//                Text("")
//                ForEach(0 ..< 7) { r in
//                    HStack(spacing : 7){
//                        ForEach(0 ..< 7) { c in
//                            Button(action: {
//                                for x in (0..<7).reversed() {
//                                    if circles[x][r].isEmpty == true
//                                    {
//                                        flagy = r
//                                        circles[x][r].isEmpty =	 false
//                                        flagx = x
//                                        circles[x][r].color = Color.blue
//                                        break
//                                    }
//                                }
//                            }, label: {
//                                Text("")
//                                    .font(.system(size: 60))
//                                    .foregroundColor(Color.black)
//                                    .frame(width: 50 , height: 50 , alignment : .center)
//                                    .background(circles[flagx][flagy].color)
//                                    .clipShape(Circle())
//                            })
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
import SwiftUI
struct gameView: View {
    
    func getRandStatment() -> String
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = " dd-MM-yyyy HH:mm "
        let currentDate = formatter.string(from: date)
        var statnment = ""
        let WinnerStatmentsLosserArr = [" DESTROIED " , " got an esay win against " , " SMACHED " , " totaly annihilated "]
        let LosserStatmentsWinnerArr = [" got the L against  " , " was compltitly destroied by  " , " tears was showwing whiel losing to  "]
        let rand = Int.random(in: 0..<2)
        if rand == 0
        {
            statnment = "In" + currentDate + winner + WinnerStatmentsLosserArr.randomElement()! + losser
        }
        else
        {
            statnment = "In" + currentDate + losser + LosserStatmentsWinnerArr.randomElement()! + winner
        }
        return statnment
    }
    
    @State var circles : [[circle]] = .init(repeating: .init(repeating: circle() , count:7 ), count: 7)
    @State var playerTurn: Color = Color.blue
    @State var shownPlayerTurn = ""
    @State var winner = ""
    @State var losser = ""
    @Binding var p1 : String
    @Binding var p2 : String
    @State var winTemp : Color = Color.white
    func getWinner() -> Color {
        if circles[0][0].color == Color.blue &&  circles[1][0].color == Color.blue &&  circles[2][0].color == Color.blue &&  circles[3][0].color == Color.blue {return Color.blue}
        if circles[0][0].color == Color.red &&  circles[1][0].color == Color.red &&  circles[2][0].color == Color.red &&  circles[3][0].color == Color.red {return Color.red}
        if circles[1][0].color == Color.blue &&  circles[2][0].color == Color.blue &&  circles[3][0].color == Color.blue &&  circles[4][0].color == Color.blue {return Color.blue}
        if circles[1][0].color == Color.red &&  circles[2][0].color == Color.red &&  circles[3][0].color == Color.red &&  circles[4][0].color == Color.red {return Color.red}
        if circles[2][0].color == Color.blue &&  circles[3][0].color == Color.blue &&  circles[4][0].color == Color.blue &&  circles[5][0].color == Color.blue {return Color.blue}
        if circles[2][0].color == Color.red &&  circles[3][0].color == Color.red &&  circles[4][0].color == Color.red &&  circles[5][0].color == Color.red {return Color.red}
        if circles[3][0].color == Color.blue &&  circles[4][0].color == Color.blue &&  circles[5][0].color == Color.blue &&  circles[6][0].color == Color.blue {return Color.blue}
        if circles[3][0].color == Color.red &&  circles[4][0].color == Color.red &&  circles[5][0].color == Color.red &&  circles[6][0].color == Color.red {return Color.red}
        if circles[0][1].color == Color.blue &&  circles[1][1].color == Color.blue &&  circles[2][1].color == Color.blue &&  circles[3][1].color == Color.blue {return Color.blue}
        if circles[0][1].color == Color.red &&  circles[1][1].color == Color.red &&  circles[2][1].color == Color.red &&  circles[3][1].color == Color.red {return Color.red}
        if circles[1][1].color == Color.blue &&  circles[2][1].color == Color.blue &&  circles[3][1].color == Color.blue &&  circles[4][1].color == Color.blue {return Color.blue}
        if circles[1][1].color == Color.red &&  circles[2][1].color == Color.red &&  circles[3][1].color == Color.red &&  circles[4][1].color == Color.red {return Color.red}
        if circles[2][1].color == Color.blue &&  circles[3][1].color == Color.blue &&  circles[4][1].color == Color.blue &&  circles[5][1].color == Color.blue {return Color.blue}
        if circles[2][1].color == Color.red &&  circles[3][1].color == Color.red &&  circles[4][1].color == Color.red &&  circles[5][1].color == Color.red {return Color.red}
        if circles[3][1].color == Color.blue &&  circles[4][1].color == Color.blue &&  circles[5][1].color == Color.blue &&  circles[6][1].color == Color.blue {return Color.blue}
        if circles[3][1].color == Color.red &&  circles[4][1].color == Color.red &&  circles[5][1].color == Color.red &&  circles[6][1].color == Color.red {return Color.red}
        if circles[0][2].color == Color.blue &&  circles[1][2].color == Color.blue &&  circles[2][2].color == Color.blue &&  circles[3][2].color == Color.blue {return Color.blue}
        if circles[0][2].color == Color.red &&  circles[1][2].color == Color.red &&  circles[2][2].color == Color.red &&  circles[3][2].color == Color.red {return Color.red}
        if circles[1][2].color == Color.blue &&  circles[2][2].color == Color.blue &&  circles[3][2].color == Color.blue &&  circles[4][2].color == Color.blue {return Color.blue}
        if circles[1][2].color == Color.red &&  circles[2][2].color == Color.red &&  circles[3][2].color == Color.red &&  circles[4][2].color == Color.red {return Color.red}
        if circles[2][2].color == Color.blue &&  circles[3][2].color == Color.blue &&  circles[4][2].color == Color.blue &&  circles[5][2].color == Color.blue {return Color.blue}
        if circles[2][2].color == Color.red &&  circles[3][2].color == Color.red &&  circles[4][2].color == Color.red &&  circles[5][2].color == Color.red {return Color.red}
        if circles[3][2].color == Color.blue &&  circles[4][2].color == Color.blue &&  circles[5][2].color == Color.blue &&  circles[6][2].color == Color.blue {return Color.blue}
        if circles[3][2].color == Color.red &&  circles[4][2].color == Color.red &&  circles[5][2].color == Color.red &&  circles[6][2].color == Color.red {return Color.red}
        if circles[0][3].color == Color.blue &&  circles[1][3].color == Color.blue &&  circles[2][3].color == Color.blue &&  circles[3][3].color == Color.blue {return Color.blue}
        if circles[0][3].color == Color.red &&  circles[1][3].color == Color.red &&  circles[2][3].color == Color.red &&  circles[3][3].color == Color.red {return Color.red}
        if circles[1][3].color == Color.blue &&  circles[2][3].color == Color.blue &&  circles[3][3].color == Color.blue &&  circles[4][3].color == Color.blue {return Color.blue}
        if circles[1][3].color == Color.red &&  circles[2][3].color == Color.red &&  circles[3][3].color == Color.red &&  circles[4][3].color == Color.red {return Color.red}
        if circles[2][3].color == Color.blue &&  circles[3][3].color == Color.blue &&  circles[4][3].color == Color.blue &&  circles[5][3].color == Color.blue {return Color.blue}
        if circles[2][3].color == Color.red &&  circles[3][3].color == Color.red &&  circles[4][3].color == Color.red &&  circles[5][3].color == Color.red {return Color.red}
        if circles[3][3].color == Color.blue &&  circles[4][3].color == Color.blue &&  circles[5][3].color == Color.blue &&  circles[6][3].color == Color.blue {return Color.blue}
        if circles[3][3].color == Color.red &&  circles[4][3].color == Color.red &&  circles[5][3].color == Color.red &&  circles[6][3].color == Color.red {return Color.red}
        if circles[0][4].color == Color.blue &&  circles[1][4].color == Color.blue &&  circles[2][4].color == Color.blue &&  circles[3][4].color == Color.blue {return Color.blue}
        if circles[0][4].color == Color.red &&  circles[1][4].color == Color.red &&  circles[2][4].color == Color.red &&  circles[3][4].color == Color.red {return Color.red}
        if circles[1][4].color == Color.blue &&  circles[2][4].color == Color.blue &&  circles[3][4].color == Color.blue &&  circles[4][4].color == Color.blue {return Color.blue}
        if circles[1][4].color == Color.red &&  circles[2][4].color == Color.red &&  circles[3][4].color == Color.red &&  circles[4][4].color == Color.red {return Color.red}
        if circles[2][4].color == Color.blue &&  circles[3][4].color == Color.blue &&  circles[4][4].color == Color.blue &&  circles[5][4].color == Color.blue {return Color.blue}
        if circles[2][4].color == Color.red &&  circles[3][4].color == Color.red &&  circles[4][4].color == Color.red &&  circles[5][4].color == Color.red {return Color.red}
        if circles[3][4].color == Color.blue &&  circles[4][4].color == Color.blue &&  circles[5][4].color == Color.blue &&  circles[6][4].color == Color.blue {return Color.blue}
        if circles[3][4].color == Color.red &&  circles[4][4].color == Color.red &&  circles[5][4].color == Color.red &&  circles[6][4].color == Color.red {return Color.red}
        if circles[0][5].color == Color.blue &&  circles[1][5].color == Color.blue &&  circles[2][5].color == Color.blue &&  circles[3][5].color == Color.blue {return Color.blue}
        if circles[0][5].color == Color.red &&  circles[1][5].color == Color.red &&  circles[2][5].color == Color.red &&  circles[3][5].color == Color.red {return Color.red}
        if circles[1][5].color == Color.blue &&  circles[2][5].color == Color.blue &&  circles[3][5].color == Color.blue &&  circles[4][5].color == Color.blue {return Color.blue}
        if circles[1][5].color == Color.red &&  circles[2][5].color == Color.red &&  circles[3][5].color == Color.red &&  circles[4][5].color == Color.red {return Color.red}
        if circles[2][5].color == Color.blue &&  circles[3][5].color == Color.blue &&  circles[4][5].color == Color.blue &&  circles[5][5].color == Color.blue {return Color.blue}
        if circles[2][5].color == Color.red &&  circles[3][5].color == Color.red &&  circles[4][5].color == Color.red &&  circles[5][5].color == Color.red {return Color.red}
        if circles[3][5].color == Color.blue &&  circles[4][5].color == Color.blue &&  circles[5][5].color == Color.blue &&  circles[6][5].color == Color.blue {return Color.blue}
        if circles[3][5].color == Color.red &&  circles[4][5].color == Color.red &&  circles[5][5].color == Color.red &&  circles[6][5].color == Color.red {return Color.red}
        if circles[0][0].color == Color.blue &&  circles[0][1].color == Color.blue &&  circles[0][2].color == Color.blue &&  circles[0][3].color == Color.blue {return Color.blue}
        if circles[0][0].color == Color.red &&  circles[0][1].color == Color.red &&  circles[0][2].color == Color.red &&  circles[0][3].color == Color.red {return Color.red}
        if circles[0][1].color == Color.blue &&  circles[0][2].color == Color.blue &&  circles[0][3].color == Color.blue &&  circles[0][4].color == Color.blue {return Color.blue}
        if circles[0][1].color == Color.red &&  circles[0][2].color == Color.red &&  circles[0][3].color == Color.red &&  circles[0][4].color == Color.red {return Color.red}
        if circles[0][2].color == Color.blue &&  circles[0][3].color == Color.blue &&  circles[0][4].color == Color.blue &&  circles[0][5].color == Color.blue {return Color.blue}
        if circles[0][2].color == Color.red &&  circles[0][3].color == Color.red &&  circles[0][4].color == Color.red &&  circles[0][5].color == Color.red {return Color.red}
        if circles[1][0].color == Color.blue &&  circles[1][1].color == Color.blue &&  circles[1][2].color == Color.blue &&  circles[1][3].color == Color.blue {return Color.blue}
        if circles[1][0].color == Color.red &&  circles[1][1].color == Color.red &&  circles[1][2].color == Color.red &&  circles[1][3].color == Color.red {return Color.red}
        if circles[1][1].color == Color.blue &&  circles[1][2].color == Color.blue &&  circles[1][3].color == Color.blue &&  circles[1][4].color == Color.blue {return Color.blue}
        if circles[1][1].color == Color.red &&  circles[1][2].color == Color.red &&  circles[1][3].color == Color.red &&  circles[1][4].color == Color.red {return Color.red}
        if circles[1][2].color == Color.blue &&  circles[1][3].color == Color.blue &&  circles[1][4].color == Color.blue &&  circles[1][5].color == Color.blue {return Color.blue}
        if circles[1][2].color == Color.red &&  circles[1][3].color == Color.red &&  circles[1][4].color == Color.red &&  circles[1][5].color == Color.red {return Color.red}
        if circles[2][0].color == Color.blue &&  circles[2][1].color == Color.blue &&  circles[2][2].color == Color.blue &&  circles[2][3].color == Color.blue {return Color.blue}
        if circles[2][0].color == Color.red &&  circles[2][1].color == Color.red &&  circles[2][2].color == Color.red &&  circles[2][3].color == Color.red {return Color.red}
        if circles[2][1].color == Color.blue &&  circles[2][2].color == Color.blue &&  circles[2][3].color == Color.blue &&  circles[2][4].color == Color.blue {return Color.blue}
        if circles[2][1].color == Color.red &&  circles[2][2].color == Color.red &&  circles[2][3].color == Color.red &&  circles[2][4].color == Color.red {return Color.red}
        if circles[2][2].color == Color.blue &&  circles[2][3].color == Color.blue &&  circles[2][4].color == Color.blue &&  circles[2][5].color == Color.blue {return Color.blue}
        if circles[2][2].color == Color.red &&  circles[2][3].color == Color.red &&  circles[2][4].color == Color.red &&  circles[2][5].color == Color.red {return Color.red}
        if circles[3][0].color == Color.blue &&  circles[3][1].color == Color.blue &&  circles[3][2].color == Color.blue &&  circles[3][3].color == Color.blue {return Color.blue}
        if circles[3][0].color == Color.red &&  circles[3][1].color == Color.red &&  circles[3][2].color == Color.red &&  circles[3][3].color == Color.red {return Color.red}
        if circles[3][1].color == Color.blue &&  circles[3][2].color == Color.blue &&  circles[3][3].color == Color.blue &&  circles[3][4].color == Color.blue {return Color.blue}
        if circles[3][1].color == Color.red &&  circles[3][2].color == Color.red &&  circles[3][3].color == Color.red &&  circles[3][4].color == Color.red {return Color.red}
        if circles[3][2].color == Color.blue &&  circles[3][3].color == Color.blue &&  circles[3][4].color == Color.blue &&  circles[3][5].color == Color.blue {return Color.blue}
        if circles[3][2].color == Color.red &&  circles[3][3].color == Color.red &&  circles[3][4].color == Color.red &&  circles[3][5].color == Color.red {return Color.red}
        if circles[4][0].color == Color.blue &&  circles[4][1].color == Color.blue &&  circles[4][2].color == Color.blue &&  circles[4][3].color == Color.blue {return Color.blue}
        if circles[4][0].color == Color.red &&  circles[4][1].color == Color.red &&  circles[4][2].color == Color.red &&  circles[4][3].color == Color.red {return Color.red}
        if circles[4][1].color == Color.blue &&  circles[4][2].color == Color.blue &&  circles[4][3].color == Color.blue &&  circles[4][4].color == Color.blue {return Color.blue}
        if circles[4][1].color == Color.red &&  circles[4][2].color == Color.red &&  circles[4][3].color == Color.red &&  circles[4][4].color == Color.red {return Color.red}
        if circles[4][2].color == Color.blue &&  circles[4][3].color == Color.blue &&  circles[4][4].color == Color.blue &&  circles[4][5].color == Color.blue {return Color.blue}
        if circles[4][2].color == Color.red &&  circles[4][3].color == Color.red &&  circles[4][4].color == Color.red &&  circles[4][5].color == Color.red {return Color.red}
        if circles[5][0].color == Color.blue &&  circles[5][1].color == Color.blue &&  circles[5][2].color == Color.blue &&  circles[5][3].color == Color.blue {return Color.blue}
        if circles[5][0].color == Color.red &&  circles[5][1].color == Color.red &&  circles[5][2].color == Color.red &&  circles[5][3].color == Color.red {return Color.red}
        if circles[5][1].color == Color.blue &&  circles[5][2].color == Color.blue &&  circles[5][3].color == Color.blue &&  circles[5][4].color == Color.blue {return Color.blue}
        if circles[5][1].color == Color.red &&  circles[5][2].color == Color.red &&  circles[5][3].color == Color.red &&  circles[5][4].color == Color.red {return Color.red}
        if circles[5][2].color == Color.blue &&  circles[5][3].color == Color.blue &&  circles[5][4].color == Color.blue &&  circles[5][5].color == Color.blue {return Color.blue}
        if circles[5][2].color == Color.red &&  circles[5][3].color == Color.red &&  circles[5][4].color == Color.red &&  circles[5][5].color == Color.red {return Color.red}
        if circles[6][0].color == Color.blue &&  circles[6][1].color == Color.blue &&  circles[6][2].color == Color.blue &&  circles[6][3].color == Color.blue {return Color.blue}
        if circles[6][0].color == Color.red &&  circles[6][1].color == Color.red &&  circles[6][2].color == Color.red &&  circles[6][3].color == Color.red {return Color.red}
        if circles[6][1].color == Color.blue &&  circles[6][2].color == Color.blue &&  circles[6][3].color == Color.blue &&  circles[6][4].color == Color.blue {return Color.blue}
        if circles[6][1].color == Color.red &&  circles[6][2].color == Color.red &&  circles[6][3].color == Color.red &&  circles[6][4].color == Color.red {return Color.red}
        if circles[6][2].color == Color.blue &&  circles[6][3].color == Color.blue &&  circles[6][4].color == Color.blue &&  circles[6][5].color == Color.blue {return Color.blue}
        if circles[6][2].color == Color.red &&  circles[6][3].color == Color.red &&  circles[6][4].color == Color.red &&  circles[6][5].color == Color.red {return Color.red}
        if circles[0][3].color == Color.blue &&  circles[1][2].color == Color.blue &&  circles[2][1].color == Color.blue &&  circles[3][0].color == Color.blue {return Color.blue}
        if circles[0][3].color == Color.red &&  circles[1][2].color == Color.red &&  circles[2][1].color == Color.red &&  circles[3][0].color == Color.red {return Color.red}
        if circles[3][3].color == Color.blue &&  circles[2][2].color == Color.blue &&  circles[1][1].color == Color.blue &&  circles[0][0].color == Color.blue {return Color.blue}
        if circles[3][3].color == Color.red &&  circles[2][2].color == Color.red &&  circles[1][1].color == Color.red &&  circles[0][0].color == Color.red {return Color.red}
        if circles[0][4].color == Color.blue &&  circles[1][3].color == Color.blue &&  circles[2][2].color == Color.blue &&  circles[3][1].color == Color.blue {return Color.blue}
        if circles[0][4].color == Color.red &&  circles[1][3].color == Color.red &&  circles[2][2].color == Color.red &&  circles[3][1].color == Color.red {return Color.red}
        if circles[3][4].color == Color.blue &&  circles[2][3].color == Color.blue &&  circles[1][2].color == Color.blue &&  circles[0][1].color == Color.blue {return Color.blue}
        if circles[3][4].color == Color.red &&  circles[2][3].color == Color.red &&  circles[1][2].color == Color.red &&  circles[0][1].color == Color.red {return Color.red}
        if circles[0][5].color == Color.blue &&  circles[1][4].color == Color.blue &&  circles[2][3].color == Color.blue &&  circles[3][2].color == Color.blue {return Color.blue}
        if circles[0][5].color == Color.red &&  circles[1][4].color == Color.red &&  circles[2][3].color == Color.red &&  circles[3][2].color == Color.red {return Color.red}
        if circles[3][5].color == Color.blue &&  circles[2][4].color == Color.blue &&  circles[1][3].color == Color.blue &&  circles[0][2].color == Color.blue {return Color.blue}
        if circles[3][5].color == Color.red &&  circles[2][4].color == Color.red &&  circles[1][3].color == Color.red &&  circles[0][2].color == Color.red {return Color.red}
        if circles[1][3].color == Color.blue &&  circles[2][2].color == Color.blue &&  circles[3][1].color == Color.blue &&  circles[4][0].color == Color.blue {return Color.blue}
        if circles[1][3].color == Color.red &&  circles[2][2].color == Color.red &&  circles[3][1].color == Color.red &&  circles[4][0].color == Color.red {return Color.red}
        if circles[4][3].color == Color.blue &&  circles[3][2].color == Color.blue &&  circles[2][1].color == Color.blue &&  circles[1][0].color == Color.blue {return Color.blue}
        if circles[4][3].color == Color.red &&  circles[3][2].color == Color.red &&  circles[2][1].color == Color.red &&  circles[1][0].color == Color.red {return Color.red}
        if circles[1][4].color == Color.blue &&  circles[2][3].color == Color.blue &&  circles[3][2].color == Color.blue &&  circles[4][1].color == Color.blue {return Color.blue}
        if circles[1][4].color == Color.red &&  circles[2][3].color == Color.red &&  circles[3][2].color == Color.red &&  circles[4][1].color == Color.red {return Color.red}
        if circles[4][4].color == Color.blue &&  circles[3][3].color == Color.blue &&  circles[2][2].color == Color.blue &&  circles[1][1].color == Color.blue {return Color.blue}
        if circles[4][4].color == Color.red &&  circles[3][3].color == Color.red &&  circles[2][2].color == Color.red &&  circles[1][1].color == Color.red {return Color.red}
        if circles[1][5].color == Color.blue &&  circles[2][4].color == Color.blue &&  circles[3][3].color == Color.blue &&  circles[4][2].color == Color.blue {return Color.blue}
        if circles[1][5].color == Color.red &&  circles[2][4].color == Color.red &&  circles[3][3].color == Color.red &&  circles[4][2].color == Color.red {return Color.red}
        if circles[4][5].color == Color.blue &&  circles[3][4].color == Color.blue &&  circles[2][3].color == Color.blue &&  circles[1][2].color == Color.blue {return Color.blue}
        if circles[4][5].color == Color.red &&  circles[3][4].color == Color.red &&  circles[2][3].color == Color.red &&  circles[1][2].color == Color.red {return Color.red}
        if circles[2][3].color == Color.blue &&  circles[3][2].color == Color.blue &&  circles[4][1].color == Color.blue &&  circles[5][0].color == Color.blue {return Color.blue}
        if circles[2][3].color == Color.red &&  circles[3][2].color == Color.red &&  circles[4][1].color == Color.red &&  circles[5][0].color == Color.red {return Color.red}
        if circles[5][3].color == Color.blue &&  circles[4][2].color == Color.blue &&  circles[3][1].color == Color.blue &&  circles[2][0].color == Color.blue {return Color.blue}
        if circles[5][3].color == Color.red &&  circles[4][2].color == Color.red &&  circles[3][1].color == Color.red &&  circles[2][0].color == Color.red {return Color.red}
        if circles[2][4].color == Color.blue &&  circles[3][3].color == Color.blue &&  circles[4][2].color == Color.blue &&  circles[5][1].color == Color.blue {return Color.blue}
        if circles[2][4].color == Color.red &&  circles[3][3].color == Color.red &&  circles[4][2].color == Color.red &&  circles[5][1].color == Color.red {return Color.red}
        if circles[5][4].color == Color.blue &&  circles[4][3].color == Color.blue &&  circles[3][2].color == Color.blue &&  circles[2][1].color == Color.blue {return Color.blue}
        if circles[5][4].color == Color.red &&  circles[4][3].color == Color.red &&  circles[3][2].color == Color.red &&  circles[2][1].color == Color.red {return Color.red}
        if circles[2][5].color == Color.blue &&  circles[3][4].color == Color.blue &&  circles[4][3].color == Color.blue &&  circles[5][2].color == Color.blue {return Color.blue}
        if circles[2][5].color == Color.red &&  circles[3][4].color == Color.red &&  circles[4][3].color == Color.red &&  circles[5][2].color == Color.red {return Color.red}
        if circles[5][5].color == Color.blue &&  circles[4][4].color == Color.blue &&  circles[3][3].color == Color.blue &&  circles[2][2].color == Color.blue {return Color.blue}
        if circles[5][5].color == Color.red &&  circles[4][4].color == Color.red &&  circles[3][3].color == Color.red &&  circles[2][2].color == Color.red {return Color.red}
        if circles[3][3].color == Color.blue &&  circles[4][2].color == Color.blue &&  circles[5][1].color == Color.blue &&  circles[6][0].color == Color.blue {return Color.blue}
        if circles[3][3].color == Color.red &&  circles[4][2].color == Color.red &&  circles[5][1].color == Color.red &&  circles[6][0].color == Color.red {return Color.red}
        if circles[6][3].color == Color.blue &&  circles[5][2].color == Color.blue &&  circles[4][1].color == Color.blue &&  circles[3][0].color == Color.blue {return Color.blue}
        if circles[6][3].color == Color.red &&  circles[5][2].color == Color.red &&  circles[4][1].color == Color.red &&  circles[3][0].color == Color.red {return Color.red}
        if circles[3][4].color == Color.blue &&  circles[4][3].color == Color.blue &&  circles[5][2].color == Color.blue &&  circles[6][1].color == Color.blue {return Color.blue}
        if circles[3][4].color == Color.red &&  circles[4][3].color == Color.red &&  circles[5][2].color == Color.red &&  circles[6][1].color == Color.red {return Color.red}
        if circles[6][4].color == Color.blue &&  circles[5][3].color == Color.blue &&  circles[4][2].color == Color.blue &&  circles[3][1].color == Color.blue {return Color.blue}
        if circles[6][4].color == Color.red &&  circles[5][3].color == Color.red &&  circles[4][2].color == Color.red &&  circles[3][1].color == Color.red {return Color.red}
        if circles[3][5].color == Color.blue &&  circles[4][4].color == Color.blue &&  circles[5][3].color == Color.blue &&  circles[6][2].color == Color.blue {return Color.blue}
        if circles[3][5].color == Color.red &&  circles[4][4].color == Color.red &&  circles[5][3].color == Color.red &&  circles[6][2].color == Color.red {return Color.red}
        if circles[6][5].color == Color.blue &&  circles[5][4].color == Color.blue &&  circles[4][3].color == Color.blue &&  circles[3][2].color == Color.blue {return Color.blue}
        if circles[6][5].color == Color.red &&  circles[5][4].color == Color.red &&  circles[4][3].color == Color.red &&  circles[3][2].color == Color.red {return Color.red}
        return Color.white
    }
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(spacing : 7){
                Text("\(shownPlayerTurn)" )
                    .foregroundColor(.white)
                Text("")
                    .foregroundColor(.white)
                ForEach(0 ..< 7) { r in
                    HStack(spacing : 7){
                        ForEach(0 ..< 7) { c in
                            Button(action: {
                                for x in (0..<7).reversed() {
                                    if circles[x][c].isEmpty == true
                                    {
                                        circles[x][c].isEmpty = false
                                        if playerTurn == Color.blue {
                                            circles[x][c].color = Color.blue
                                        }
                                        else{
                                            circles[x][c].color = Color.red
                                        }
                                        break
                                    }
                                }
                                if playerTurn == Color.blue {
                                    playerTurn = Color.red
                                    shownPlayerTurn = p2 + "Turn"
                                }
                                else {
                                    playerTurn = Color.blue
                                    shownPlayerTurn = p1 + "Turn"
                                }
                                let winTemp = getWinner()
                                if winTemp != Color.white {
                                    if winTemp == Color.blue {
                                        winner = p1
                                        losser = p2
                                        
                                    }
                                    else {
                                        winner = p2
                                        losser = p1
                                    }
                                }
                                
                            }, label: {
                                Text("")
                                    .font(.system(size: 60))
                                    .foregroundColor(Color.black)
                                    .frame(width: 50 , height: 50 , alignment : .center)
                                    .background(circles[r][c].color)
                                    .clipShape(Circle())
                            })
                            
                        }
                    }
                }
            }
        }
    }
}

//func circleColor() -> Color {
//    if circles
//}
//func fillcircles()
//{
//    for x in 1...7{
//        for y in 1...6 {
//            circles[x][y].x = x
//            circles[x][y].y = y
//        }
//    }
//
//
//}
//struct gameView_Previews: PreviewProvider {
//    static var previews: some View {
//        gameView(p1: "Test ", p2: "Test")
//            .previewDevice("iPhone 11")
//    }
//}
