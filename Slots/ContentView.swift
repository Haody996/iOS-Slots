//
//  ContentView.swift
//  Slots
//
//  Created by Hao Qin on 4/26/22.
//

import SwiftUI




struct ContentView: View {
    
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var cardcolor = Array(repeating: Color.white, count: 9)
    @State private var numbers = [0, 0, 0, 0,0,0,0,0,0]
    @State private var credits = 1000
    @State private var hit = false
    
    private var betAmount = 5
    
    private var scale: Animation{
        Animation.easeOut
    }
    
    
    
    func checkSlot(slot1:Int,slot2:Int,slot3:Int){
        if self.numbers[slot1] == self.numbers[slot2] && self.numbers[slot1] == self.numbers[slot3]{
            self.cardcolor[slot1] = Color.green
            self.cardcolor[slot2] = Color.green
            self.cardcolor[slot3] = Color.green
            self.credits += betAmount*3
            self.hit = true
        }
    }
    
    
    
    
    var body: some View {
        ZStack{
            //background
            Rectangle()
                .foregroundColor(Color( red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            //foreground
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            //main elements
            VStack{
                
                Spacer()
                
                //title
                HStack{
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Text("Slots").bold().foregroundColor(.white)
                    
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    
                }.scaleEffect(2)
                
                Spacer()
                
                HStack{
                    Text("Credits:  ")
                        .bold()
                        .font(.title3)
                        .foregroundColor(.black)
                        
                    Text("\(credits)")
                        .bold()
                        .font(.title3)
                        .foregroundColor(hit ? .red : .black)
                        .scaleEffect(hit ? 2 : 1)
                        .animation(scale)
                        
                }.padding(.all,20).padding(.horizontal,20).background(Color.white.opacity(0.5)).cornerRadius(30)
                
                
                Spacer()
                
                VStack{
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[0]], background: $cardcolor[0])
                        
                        CardView(symbol: $symbols[numbers[1]], background: $cardcolor[1])
                        
                        CardView(symbol: $symbols[numbers[2]], background: $cardcolor[2])
                        
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[3]], background: $cardcolor[3])
                        
                        CardView(symbol: $symbols[numbers[4]], background: $cardcolor[4])
                        
                        CardView(symbol: $symbols[numbers[5]], background: $cardcolor[5])
                        
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[6]], background: $cardcolor[6])
                        
                        CardView(symbol: $symbols[numbers[7]], background: $cardcolor[7])
                        
                        CardView(symbol: $symbols[numbers[8]], background: $cardcolor[8])
                        
                        Spacer()
                    }
                }
                
                
                Spacer()
                
                Button(action: {
                    self.hit = false
                    self.credits -= betAmount
                    self.cardcolor = self.cardcolor.map({_ in
                        Color.white
                    })
                    
                    
                    self.numbers = self.numbers.map({_ in
                        Int.random(in: 0..<self.symbols.count)
                        
                    })
                    
                    checkSlot(slot1: 0, slot2: 1, slot3: 2)
                    checkSlot(slot1: 3, slot2: 4, slot3: 5)
                    checkSlot(slot1: 6, slot2: 7, slot3: 8)
                    checkSlot(slot1: 0, slot2: 3, slot3: 6)
                    checkSlot(slot1: 1, slot2: 4, slot3: 7)
                    checkSlot(slot1: 2, slot2: 5, slot3: 8)
                    checkSlot(slot1: 0, slot2: 4, slot3: 8)
                    checkSlot(slot1: 2, slot2: 4, slot3: 6)

                }){
                    Text("Spin")
                        .foregroundColor(.white)
                        .bold()
                        .padding(10)
                        .padding(.horizontal, 30.0)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                
                Spacer()
            }
        }
    }
    

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
