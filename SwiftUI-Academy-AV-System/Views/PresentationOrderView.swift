//
//  PresentationOrderView.swift
//  SwiftUI-Academy-AV-System
//
//  Created by Jia Chen Yee on 7/9/23.
//

import SwiftUI

struct PresentationOrderView: View {
    
    @State private var typeWriterState = 0
    @State private var isRunButtonShown = false
    @State private var runButtonScale = 1.0
    
    @State private var isCodeShown = true
    @State private var isArrayPresented = false
    @State private var rotation = Angle.zero
    
    var groupsSnippet: AttributedString {
        var firstSquareBracket = AttributedString("[\n    ")
        firstSquareBracket.foregroundColor = .white
        
        var comma = AttributedString(", ")
        comma.foregroundColor = .white
        
        var watermelon = AttributedString("\"🍉\"")
        watermelon.foregroundColor = .xcRed
        
        var mango = AttributedString("\"🥭\"")
        mango.foregroundColor = .xcRed
        
        var strawberry = AttributedString("\"🍓\"")
        strawberry.foregroundColor = .xcRed
        
        var coconut = AttributedString("\"🥥\"")
        coconut.foregroundColor = .xcRed
        
        var orange = AttributedString("\"🍊\"")
        orange.foregroundColor = .xcRed
        
        var pineapple = AttributedString("\n    \"🍍\"")
        pineapple.foregroundColor = .xcRed
        
        var grapes = AttributedString("\"🍇\"")
        grapes.foregroundColor = .xcRed
        
        var lemon = AttributedString("\"🍋\"")
        lemon.foregroundColor = .xcRed
        
        var kiwi = AttributedString("\"🥝\"")
        kiwi.foregroundColor = .xcRed
        
        var lastSquareBracket = AttributedString("\n]")
        lastSquareBracket.foregroundColor = .white
        
        return firstSquareBracket + watermelon + comma + mango + comma + strawberry + comma + coconut + comma + orange + comma + pineapple + comma + grapes + comma + lemon + comma + kiwi + lastSquareBracket
    }
    
    @Namespace var namespace
    
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            let widthUnit = geometry.size.width / 1920
            
            Color.black
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("groups"[0..<min(6, typeWriterState)])
                        .foregroundStyle(.xcGreen)
                    Text("."[0..<max(0, min(1, typeWriterState - 6))])
                        .foregroundStyle(.white)
                    Text("shuffled"[0..<max(0, min(8, typeWriterState - 7))])
                        .foregroundStyle(.xcPurple)
                    Text("()"[0..<max(0, min(2, typeWriterState - 15))])
                        .foregroundStyle(.white)
                }
                .font(.system(size: widthUnit * 70, weight: .medium, design: .monospaced))
                
                if isRunButtonShown {
                    HStack(spacing: 0) {
                        Image(systemName: "play.fill")
                            .padding(.trailing, widthUnit * 32)
                        Text("Run My Code")
                    }
                    .foregroundStyle(.blue)
                    .font(.system(size: widthUnit * 64, weight: .medium))
                    .padding(widthUnit * 32)
                    .padding(.horizontal, widthUnit * 32)
                    .background(Color(.darkGray).opacity(0.3))
                    .clipShape(Capsule())
                    .scaleEffect(runButtonScale)
                    .padding(.top, widthUnit * 48)
                }
            }
            .scaleEffect(isCodeShown ? 1 : 0.001)
            .opacity(isCodeShown ? 1 : 0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            if !isCodeShown {
                ZStack {
                    Circle()
                        .trim(from: 0, to: 1 - 0.25)
                        .stroke(.angularGradient(colors: [.blue, .clear], center: .center, startAngle: .degrees(180), endAngle: .degrees(30)), style: .init(lineWidth: widthUnit * 48, lineCap: .round, lineJoin: .round))
                        .frame(width: widthUnit * 256, height: widthUnit * 256)
                        .rotationEffect(rotation)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onAppear {
                            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                                rotation.degrees = 360
                            }
                        }
                }
                .scaleEffect(isArrayPresented ? 0.001 : 1)
                .opacity(isArrayPresented ? 0 : 1)
            }
            
            Text(groupsSnippet)
                .scaleEffect(isArrayPresented ? 1 : 0.001)
                .opacity(isArrayPresented ? 1 : 0)
                .font(.system(size: widthUnit * 84, weight: .regular, design: .monospaced))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text("SUTD+SP SwiftUI Nano Academy")
                .foregroundStyle(.swiftUIAcademyGray)
                .font(.system(size: widthUnit * 24, weight: .regular, design: .default))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(widthUnit * 95)
        }
        .onReceive(timer) { _ in
            typeWriterState += 1
            
            if typeWriterState == 19 {
                withAnimation {
                    isRunButtonShown = true
                }
            } else if typeWriterState == 25 {
                withAnimation {
                    runButtonScale = 0.9
                }
            } else if typeWriterState == 27 {
                withAnimation {
                    runButtonScale = 1
                }
            } else if typeWriterState == 30 {
                withAnimation {
                    isCodeShown.toggle()
                }
            } else if typeWriterState == 36 {
                withAnimation {
                    isArrayPresented.toggle()
                }
            }
        }
    }
}

#Preview {
    PresentationOrderView()
}

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
