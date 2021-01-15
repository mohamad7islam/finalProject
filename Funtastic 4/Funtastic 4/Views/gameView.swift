//
//  gameView.swift
//  Funtastic 4
//
//  Created by mohamad on 1/10/21.
//

import SwiftUI
let userDefaults = UserDefaults.standard
struct gameView: View {
    func getRandStatment() -> String
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = " dd-MM-yyyy HH:mm "
        let currentDate = formatter.string(from: date)
        var statnment = ""
        let WinnerStatmentsLosserArr = [" DESTROYED " , " got an easy win against " , " SMASHED " , " totally annihilated " ," got the W against  "]
        let LosserStatmentsWinnerArr = [" got the L against  " , " was completely destroyed by  " , " tears was showing while losing to  "]
        let rand = Int.random(in: 0..<2)
        if rand == 0
        {
            statnment = "In " + currentDate + " " + winner + WinnerStatmentsLosserArr.randomElement()! + losser
        }
        else
        {
            statnment = "In " + currentDate + " " + losser + LosserStatmentsWinnerArr.randomElement()! + winner
        }
        return statnment
    }
    func isDraw() -> Bool {
        for r in 0..<7 {
            for c in 0..<6 {
                if circles[r][c].color == Color.white {
                    return false
                }
            }
        }
        return true
    }
    @State var circles : [[circle]] = .init(repeating: .init(repeating: circle() , count:6 ), count: 7)
    @State var playerTurn: Color = Color.blue
    @State var shownPlayerTurn = ""
    @State var winner = ""
    @State var losser = ""
    @Binding var p1 : String
    @Binding var p2 : String
    @State var winTemp : Color = Color.white
    @State private var showingAlert = false
    @State var alertbody = ""
    @State var colorFlag = true
    func restart(){
        circles  = [[circle]](repeating: [circle](repeating: circle() , count:6 ), count: 7)
        playerTurn = Color.blue
        shownPlayerTurn = p1
        winner = ""
        losser = ""
        winTemp = Color.white
        alertbody = ""
    }
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(spacing : 12){
                HStack(spacing : 2){
                    Text("\(shownPlayerTurn)")
                        .font(.custom("BebasNeue-Regular", size:70))
                        .foregroundColor(colorFlag ? .blue : .red)
                    Text(" Turn")
                        .font(.custom("BebasNeue-Regular", size:70))
                        .foregroundColor(colorFlag ? .blue : .red)
                }
                ForEach(0 ..< 7) { r in
                    HStack(spacing : 7){
                        ForEach(0 ..< 6) { c in
                            Button(action: {
                                colorFlag.toggle()
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
                                if isDraw(){
                                    alertbody = "what a boaring game 😑"
                                    showingAlert = true
                                }
                                if playerTurn == Color.blue {
                                    playerTurn = Color.red
                                    shownPlayerTurn = p2
                                }
                                else {
                                    playerTurn = Color.blue
                                    shownPlayerTurn = p1
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
                                    var strings = userDefaults.object(forKey: "myKey") as? [String]
                                    if strings == nil {
                                        let newTempArr = [getRandStatment()]
                                        userDefaults.set(newTempArr, forKey: "myKey")
                                    }
                                    else{
                                    strings!.append(getRandStatment())
                                    userDefaults.set(strings, forKey: "myKey")
                                    }
                                    alertbody = winner + " wins"
                                    showingAlert = true
                                }
                            }, label: {
                                Text("")
                                    .font(.system(size: 60))
                                    .foregroundColor(Color.black)
                                    .frame(width: 55 , height: 55 , alignment : .center)
                                    .background(circles[r][c].color)
                                    .clipShape(Circle())
                            })
                            
                        }
                    }
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Game Over"), message: Text(alertbody),
                          dismissButton: Alert.Button.default(
                              Text("play again"), action: { restart() }
                          )
                      )
                }
            }
        }.onAppear(perform: {
            shownPlayerTurn = p1
            restart()
        })
    }
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
//} .alert(isPresented:$showingAlert) {
//Alert(title: Text("Are you sure you want to delete this?"), message: Text("There is no undo"), primaryButton: .destructive(Text("Delete")) {
//        print("Deleting...")
//}, secondaryButton: .cancel())
//}
//}
