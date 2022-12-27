//
//  ResultsView.swift
//  BMI
//
//  Created by Misan Etchie on 01/12/2022.
//

import SwiftUI

struct ResultsView: View {
    
    var score: Double
    
    var body: some View {

        GeometryReader {geo in
            ZStack {
                
                Color.gray
                    .edgesIgnoringSafeArea(.all)
                
                Image("bmiBG2dark")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                
                VStack {
                    
                    Spacer()
                    
                    Text("Your BMI Result")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("Text"))
                        //.padding(.bottom, 8)
                    
                    
                    Text("\((String(format: "%.2f", score)))")
                        .font(.system(size: 80.0))
                        .bold()
                        .foregroundColor(Color("Text"))
                    
                    if (score < 18.5) {
                        Text("Eat More Pies") .font(.title)
                            .bold()
                            .foregroundColor(Color("Text"))
                            .padding(.bottom, 50)
                    } else if (score < 25){
                        Text("Just Enough Pies") .font(.title)
                            .bold()
                            .foregroundColor(Color("Text"))
                            .padding(.bottom, 50)
                    } else {Text("Eat Less Pies") .font(.title)
                            .bold()
                            .foregroundColor(Color("Text"))
                            .padding(.bottom, 50)
                    }

                    
                    Spacer()
                    
                }.padding(.horizontal, 24)
                
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(score: 20.00).preferredColorScheme(.dark)
        ResultsView(score: 17.83).preferredColorScheme(.light)
    }
}
