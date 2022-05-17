//
//  ContentView.swift
//  Practice
//
//  Created by Zhandos Baimurat on 16.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    @State var target = Int.random(in: 1...100)
    @State var sliderValue = 50.0
    
    @State var score = 0
    @State var round = 1
    
    var sliderTargetDifference: Int {
        abs(sliderValueRounded - target)
    }
    
    var sliderValueRounded: Int {
     Int(self.sliderValue.rounded())
   }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to: ")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Text("\(self.target)")
                    .font(Font.custom("Arial Rounded MT Bold", size: 24))
                    .foregroundColor(Color.yellow)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            }
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Button(action: {
                self.alertIsVisible = true
            }, label: {
                Text("Hit me!")
            })
            .alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text(self.alertTitle()),
                      message: Text(self.scoringMessage()),
                      dismissButton: .default(Text("Awesome")){
                    startNewRound()
                })
            }
            
            Spacer()
            HStack {
                Button(action: {
                    startNewGame()
                }, label: {
                    Text("Start over")
                })
                
                Spacer()
                Text("Score:")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Text("\(self.score)")
                    .font(Font.custom("Arial Rounded MT Bold", size: 24))
                    .foregroundColor(Color.yellow)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Spacer()
                Text("Round:")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Text("\(self.round)")
                    .font(Font.custom("Arial Rounded MT Bold", size: 24))
                    .foregroundColor(Color.yellow)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Spacer()
                Button(action: {}, label: {
                    Text("Info")
                })
            }.padding()
        }
        .onAppear() {
            self.startNewGame()
        }.background(Image("wood"))
        
    }
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = abs(self.sliderValueRounded - self.target)
        
        let points: Int
        if difference == 0 {
            points = 200
        } else if difference == 1 {
            points = 150
        } else {
            points = maximumScore - difference
        }
        return points
    }
    
    func alertTitle() -> String {
        let title: String
        let difference = abs(self.sliderValueRounded - self.target)
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame() {
        self.score = 0
        self.round = 1
        resetSliderAndTarget()
    }
    
    func startNewRound() {
        self.score = self.score + self.pointsForCurrentRound()
        self.round += 1
        resetSliderAndTarget()
    }
    
    func resetSliderAndTarget() {
        self.sliderValue = 50.0
        self.target = Int.random(in: 1...100)
    }
    
    func scoringMessage() -> String {
        return "The slider's value is \(sliderValueRounded).\n" +
        "The target value is \(self.target).\n" +
        "You scored \(self.pointsForCurrentRound()) points this round."
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
