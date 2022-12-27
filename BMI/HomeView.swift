//
//  HomeView.swift
//  BMI
//
//  Created by Misan Etchie on 01/12/2022.
//

import SwiftUI

struct HomeView: View {
    @State var weightSliderValue: Double = 60
    @State var heightSliderValue: Double = 1.70
    @State private var sheetPresented = false
    
    //let bmix = (String(format: "%.2f", bmi))
    
    var body: some View {
        
        let bmi = weightSliderValue / (heightSliderValue * heightSliderValue)
            
        NavigationView{
            GeometryReader {geo in
                ZStack {
                    Image("bmiBg")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    
                    VStack {
                        
                        Spacer()
                        
                        HStack {
                            Text("Height").foregroundColor(Color("Text")).bold()
                            Spacer()
                            Text("\(heightSliderValue, specifier: "%.2f")m").foregroundColor(Color("Text")).bold()
                        }
                        
                        Slider(value: $heightSliderValue, in: 1.00...3.00).accentColor(Color("DarkGreen")).padding(.bottom, 12)
                        
                        HStack {
                            Text("Weight").foregroundColor(Color("Text")).bold()
                            Spacer()
                            Text("\(weightSliderValue, specifier: "%.0f")kg").foregroundColor(Color("Text")).bold()
                        }
                        
                        Slider(value: $weightSliderValue, in: 30...300).accentColor(Color("DarkGreen")).padding(.bottom, 28)
                        
                        Button("Calculate")
                        {
                                        sheetPresented.toggle()
                                    }.sheet(isPresented: $sheetPresented) {
                                        ResultsView(score: bmi)
                                    }
                                    
                                    .foregroundColor(Color("ButtonText"))
                                    .font(.title2)
                                    //.fontWeight(weight: .bold)
                                .padding(16)
                                .frame(width: 300)
                                .background(Color("DarkGreen"))
                                .cornerRadius(16)
                                .padding(.bottom, 20)
                        
                        /*NavigationLink(destination: ResultsView(score: bmi), label: {
                            Text("CALCULATE")
                                .foregroundColor(Color("ButtonText"))
                                .bold()
                                .font(.title2)
                                    .padding(16)
                                    .frame(width: 300)
                                    .background(Color("DarkGreen"))
                                    .cornerRadius(16)
                        }
                        ).padding(.bottom, 20)*/
                        
                    }.padding(.horizontal, 24)
                }
        }.navigationBarTitle("BMI Calculator")
    }
            
        }
    }




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

/*ZStack {
 Image("bmiBg")
 .resizable()
 .scaledToFill()
 .edgesIgnoringSafeArea(.all)
 VStack {
 Text("BMI Calculator").foregroundColor(.white)
 Spacer()
 }
 }*/
