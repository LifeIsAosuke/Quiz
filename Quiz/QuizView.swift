import SwiftUI

struct QuizView: View {
    @Binding var currentScreen: Screen
    @Binding var score: Int
    @Binding var totalQuestions: Int
    
    // ここにクイズの問題と選択肢、正解を定義します
    let quizItems: [QuizItem] = [
        QuizItem(question: "iPhoneを開発している企業はどこ？", options: ["Google", "Apple", "Samsung"], correctAnswerIndex: 1),
        QuizItem(question: "日本の首都はどこ？", options: ["大阪", "東京", "名古屋"], correctAnswerIndex: 1),
        QuizItem(question: "地球は太陽の周りを何年で一周する？", options: ["1年", "30日", "10年"], correctAnswerIndex: 0),
        QuizItem(question: "プログラミング言語Swiftを開発した企業は？", options: ["Apple", "Microsoft", "Google"], correctAnswerIndex: 0),
        QuizItem(question: "富士山の高さに最も近い数値は？", options: ["1,500m", "3,776m", "5,000m"], correctAnswerIndex: 1),
        QuizItem(question: "円の面積を求める公式は？", options: ["πr²", "2πr", "πd"], correctAnswerIndex: 0),
        QuizItem(question: "世界で最も話されている言語は？", options: ["英語", "スペイン語", "中国語"], correctAnswerIndex: 2),
        QuizItem(question: "電気の単位「V」は何の略？", options: ["ボルテージ", "バイタル", "ビジョン"], correctAnswerIndex: 0),
        QuizItem(question: "日本の通貨単位は？", options: ["ウォン", "円", "ドル"], correctAnswerIndex: 1),
        QuizItem(question: "「WWW」は何の略？", options: ["World Wide Web", "Web Window World", "Wide Web World"], correctAnswerIndex: 0)
    ]
    
    @State private var currentQuestionIndex = 0
    @State private var isCorrect: Bool = false
    @State private var isShowingFeedback = false
    
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
                
                
                // Feedback Message Area
                
                
                // Answer Options
                
            }
            .padding()
        }
        .onAppear {
            // QuizViewが表示された際に、問題総数をContentViewに伝える
            totalQuestions = quizItems.count
        }
    }
    // ボタンがタップされたときの処理
    
}

// MARK: - Preview
#Preview {
    @Previewable @State var currentScreen: Screen = .quiz
    @Previewable @State var score: Int = 0
    @Previewable @State var totalQuestions: Int = 5
    ZStack {
        Color(.background)
            .ignoresSafeArea()
        QuizView(
            currentScreen: $currentScreen,
            score: $score,
            totalQuestions: $totalQuestions
        )
    }
}

