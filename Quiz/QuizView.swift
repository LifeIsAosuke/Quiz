import SwiftUI


struct QuizView: View {
    @Binding var currentScreen: Screen
    @Binding var score: Int
    
    // ここにクイズの問題と選択肢、正解を定義します
    let quizItems: [QuizItem] = [
        QuizItem(question: "iPhoneを開発している企業はどこ？", options: ["Google", "Apple", "Samsung"], correctAnswerIndex: 1),
        QuizItem(question: "Appleの共同創業者は誰？（一人選んでください）", options: ["ビル・ゲイツ", "スティーブ・ウォズニアック", "ラリー・ペイジ"], correctAnswerIndex: 1),
        QuizItem(question: "最初のMacintoshが発表された年は？", options: ["1976年", "1984年", "1998年"], correctAnswerIndex: 1),
        QuizItem(question: "Appleの本社があるカリフォルニア州の都市は？", options: ["サンフランシスコ", "パロアルト", "クパチーノ"], correctAnswerIndex: 2),
        QuizItem(question: "SwiftUIが最初に発表されたWWDCの年は？", options: ["2017", "2019", "2021"], correctAnswerIndex: 1),
        QuizItem(question: "AppleのCEOを2023年時点で務めているのは誰？", options: ["ティム・クック", "スティーブ・ジョブズ", "ジェフ・ベゾス"], correctAnswerIndex: 0),
        QuizItem(question: "Appleの創業年は？", options: ["1976年", "1980年", "1984年"], correctAnswerIndex: 0),
        QuizItem(question: "Appleの有名なノートパソコンブランドは？", options: ["ThinkPad", "MacBook", "Chromebook"], correctAnswerIndex: 1),
        QuizItem(question: "iPodが初めて発売された年は？", options: ["2001年", "2004年", "1999年"], correctAnswerIndex: 0),
        QuizItem(question: "Appleが買収した音楽配信サービスは？", options: ["Spotify", "Beats Music", "Pandora"], correctAnswerIndex: 1),
        QuizItem(question: "macOSの前身であるOSの名前は？", options: ["Mac OS X", "System Software", "NeXTSTEP"], correctAnswerIndex: 1),
        QuizItem(question: "Appleが開発したプログラミング言語は？", options: ["Swift", "Kotlin", "Go"], correctAnswerIndex: 0),
        QuizItem(question: "Apple Pencilはどの製品向け？", options: ["MacBook", "iPad", "iPhone"], correctAnswerIndex: 1),
        QuizItem(question: "Apple Watchの初代モデルが発売されたのはいつ？", options: ["2014年", "2015年", "2016年"], correctAnswerIndex: 1),
        QuizItem(question: "Appleが提供する動画配信サービスは？", options: ["Apple TV+", "Apple Video", "Apple Movies"], correctAnswerIndex: 0),
        QuizItem(question: "Appleの音声アシスタントの名前は？", options: ["Alexa", "Siri", "Cortana"], correctAnswerIndex: 1),
        QuizItem(question: "App Storeが開始されたのは何年？", options: ["2008年", "2010年", "2006年"], correctAnswerIndex: 0),
        QuizItem(question: "Appleのスマートスピーカーは？", options: ["HomePod", "Echo", "Nest Audio"], correctAnswerIndex: 0),
        QuizItem(question: "iPhone Xが発表された年は？", options: ["2016年", "2017年", "2018年"], correctAnswerIndex: 1),
        QuizItem(question: "Appleの創業地はどこ？", options: ["カリフォルニア州クパチーノ", "カリフォルニア州ロスアルトス", "カリフォルニア州サンノゼ"], correctAnswerIndex: 1),
        QuizItem(question: "Appleが買収した音楽イヤホンブランドは？", options: ["Bose", "Beats", "Sony"], correctAnswerIndex: 1),
        QuizItem(question: "Appleの主要開発者会議は？", options: ["WWDC", "Google I/O", "F8"], correctAnswerIndex: 0),
        QuizItem(question: "Appleが初めてIntel製CPUを採用したのはいつ？", options: ["2005年", "2006年", "2007年"], correctAnswerIndex: 1),
        QuizItem(question: "Appleのロゴがリンゴの形なのはなぜ？", options: ["ジョブズの好物", "知識の象徴", "偶然"], correctAnswerIndex: 1),
        QuizItem(question: "Appleが開発したチップのブランド名は？", options: ["Snapdragon", "M1", "Exynos"], correctAnswerIndex: 1),
        QuizItem(question: "Appleが最初に発売したスマートフォンは？", options: ["iPhone", "Newton", "iPod touch"], correctAnswerIndex: 0),
        QuizItem(question: "Appleが開発した初のタブレット製品は？", options: ["iPad", "Newton MessagePad", "Mac Tablet"], correctAnswerIndex: 1),
        QuizItem(question: "Appleの決算は何月に終了する？", options: ["9月", "12月", "6月"], correctAnswerIndex: 0),
        QuizItem(question: "macOS Big Surのバージョン番号は？", options: ["10.15", "11", "12"], correctAnswerIndex: 1),
        QuizItem(question: "Appleが買収したAR企業は？", options: ["Metaio", "Oculus", "Magic Leap"], correctAnswerIndex: 0),
        QuizItem(question: "iTunesが発表された年は？", options: ["2000年", "2001年", "2003年"], correctAnswerIndex: 1),
        QuizItem(question: "AppleのApp Storeにあるアプリ数はおよそ？（2023年時点）", options: ["200万", "300万", "500万"], correctAnswerIndex: 0),
        QuizItem(question: "Appleの初代iPhoneのストレージ最大容量は？", options: ["4GB", "8GB", "16GB"], correctAnswerIndex: 1),
        QuizItem(question: "Appleが提供するクラウドサービスは？", options: ["iCloud", "Google Drive", "Dropbox"], correctAnswerIndex: 0),
        QuizItem(question: "Appleの株式ティッカーシンボルは？", options: ["AAPL", "APPL", "APPLE"], correctAnswerIndex: 0),
        QuizItem(question: "Appleが買収したAIスタートアップは？", options: ["Siri", "DeepMind", "OpenAI"], correctAnswerIndex: 0),
        QuizItem(question: "Appleの製品発表イベントが行われる場所は？", options: ["スティーブ・ジョブズ・シアター", "アップルパーク・ホール", "モスコーンセンター"], correctAnswerIndex: 0),
        QuizItem(question: "Appleの最初のロゴは誰がデザインした？", options: ["ロナルド・ウェイン", "スティーブ・ジョブズ", "ジョナサン・アイブ"], correctAnswerIndex: 0),
        QuizItem(question: "Apple Watchの血中酸素濃度測定機能が追加されたのは？", options: ["Series 4", "Series 6", "Series 5"], correctAnswerIndex: 1),
        QuizItem(question: "Appleの共同創業者の一人で後に会社を去った人物は？", options: ["ロナルド・ウェイン", "スティーブ・ウォズニアック", "スティーブ・ジョブズ"], correctAnswerIndex: 0),
        QuizItem(question: "Appleが提供するゲームサブスクリプションは？", options: ["Apple Arcade", "Apple Play", "Apple Fun"], correctAnswerIndex: 0),
        QuizItem(question: "iMacの「i」は何を意味する？", options: ["Internet", "Innovation", "Individual"], correctAnswerIndex: 0),
        QuizItem(question: "Appleが最初に採用した有機ELディスプレイ搭載iPhoneは？", options: ["iPhone X", "iPhone 8", "iPhone 7"], correctAnswerIndex: 0),
        QuizItem(question: "Appleが初めて5Gに対応したiPhoneは？", options: ["iPhone 11", "iPhone 12", "iPhone 13"], correctAnswerIndex: 1),
        QuizItem(question: "Appleの有名な広告スローガンは？", options: ["Think Different", "Just Do It", "I'm Lovin' It"], correctAnswerIndex: 0),
        QuizItem(question: "Apple Parkの建設が完了したのはいつ？", options: ["2016年", "2017年", "2018年"], correctAnswerIndex: 1),
        QuizItem(question: "Appleが提供するフィットネスサービスは？", options: ["Apple Fit", "Apple Fitness+", "Apple Health"], correctAnswerIndex: 1),
        QuizItem(question: "Apple IIが発売された年は？", options: ["1977年", "1978年", "1979年"], correctAnswerIndex: 0),
        QuizItem(question: "AppleのRetinaディスプレイが初めて搭載された製品は？", options: ["iPhone 4", "iPad 3", "MacBook Pro"], correctAnswerIndex: 0),
        QuizItem(question: "Appleが発表したAirTagは何に使う？", options: ["位置追跡", "健康管理", "音楽再生"], correctAnswerIndex: 0)
    ]
    
    @State private var currentQuestionIndex: Int = 0
    @State private var isCorrect: Bool = false
    @State private var isShowingFeedback = false
    
    @State private var answeredQuestions: Int = 0 // 回答した問題数
    
    var currentQuestion: QuizItem {
        quizItems[currentQuestionIndex]
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Apple Quiz")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.white))
                    .padding(.top, 20)
                
                Spacer()
                
                // Question Text
                Text(currentQuestion.question)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(minHeight: 100, alignment: .center)
                
                Spacer()
                
                // Feedback Message Area
                Text(isCorrect ? "正解！" : "不正解... 正解は「\(currentQuestion.options[currentQuestion.correctAnswerIndex])」")
                         .font(.headline)
                         .padding(10)
                         .background(.thinMaterial)
                         .foregroundStyle(Color(isCorrect ? .green : .red))
                         .clipShape(.rect(cornerRadius: 10))
                         .opacity(isShowingFeedback ? 1 : 0)
                     
                Spacer()
                
                // Answer Options
                VStack(spacing: 16) {
                    ForEach(0..<currentQuestion.options.count, id: \.self) { index in
                        Button {
                            answerTapped(index)
                        } label: {
                            Text(currentQuestion.options[index])
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color(.background))
                                .frame(maxWidth: .infinity, minHeight: 70)
                                .background(.white)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                        .disabled(isShowingFeedback)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            currentQuestionIndex = Int.random(in: 0..<quizItems.count) // ランダムに
        }
    }
    // ボタンがタップされたときの処理
    private func answerTapped(_ index: Int) {
        isShowingFeedback = true
        
        if index == currentQuestion.correctAnswerIndex {
            isCorrect = true
            score += 1
        } else {
            isCorrect = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            isShowingFeedback = false
            
            if answeredQuestions < 10 {
                answeredQuestions += 1 // 回答した数をカウント
                currentQuestionIndex = Int.random(in: 0..<quizItems.count) // ランダムに
                isShowingFeedback = false
            } else {
                // 全問終了
                if score > 5 {
                    currentScreen = .success
                } else {
                    currentScreen = .failure
                }
            }
        }
    }
}


// MARK: - Preview
#Preview {
    @Previewable @State var currentScreen: Screen = .quiz
    @Previewable @State var score: Int = 0
    ZStack {
        Color(.background)
            .ignoresSafeArea()
        QuizView(
            currentScreen: $currentScreen,
            score: $score,
            
        )
    }
}
