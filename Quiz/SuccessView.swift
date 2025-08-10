//
//  SuccessView.swift
//  Quiz
//
//  Created by A S on 2025/08/10.
//

import SwiftUI

struct SuccessView: View {
    @Binding var currentScreen: Screen
    @Binding var score: Int
    
    var body: some View {
        ZStack {
            VStack {
                Text("Apple Quiz")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.top, 20)
                
                Spacer()
                
                VStack {
                    Text("結果")
                        .font(.system(size: 36, weight: .semibold))
                        .foregroundStyle(.white)
                    Text("\(score) / 10 問正解")
                        .font(.system(size: 28, weight: .medium))
                        .foregroundStyle(.white)
                    
                    Text("成功画面だよ〜")
                        .font(.system(size: 24, weight: .medium))
                }
                
                Spacer()
                
                Button {
                    score = 0
                    currentScreen = .start
                } label: {
                    Text("タイトルへ戻る")
                        .font(.system(size: 18, weight: .bold))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 70)
                        .background(.white)
                        .foregroundStyle(Color.background)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var currentScreen: Screen = .result
    @Previewable @State var score: Int = 4
    ZStack {
        Color(.background)
            .ignoresSafeArea()
        SuccessView(
            currentScreen: $currentScreen,
            score: $score,
        )
    }
}
