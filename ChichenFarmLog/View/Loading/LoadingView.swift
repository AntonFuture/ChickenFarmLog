import SwiftUI

struct LoadingView: View {

    var didLoad: (() -> Void)
    
    @State var progress: Double = 0.0
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            Image("mainBackground_color")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("loading_ig")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 455, maxHeight: 393)
                
                Spacer()
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white.opacity(0.5))
                            .frame(height: 16)
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(width: geometry.size.width * (progress / 100), height: 16)
                            .animation(.linear, value: progress)
                    }
                }
                .frame(height: 16)
                .padding(.horizontal, 16)
                .padding(.bottom, 60)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            startProgress()
        }
        .onChange(of: progress) { newValue in
            if newValue == 100 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    didLoad()
                }
            }
        }
    }
    
    private func startProgress() {
        progress = 0
        timer?.invalidate()
        
        let duration: Double = 1.0
        let stepTime: Double = 0.02
        let totalSteps = duration / stepTime
        let increment = 100 / totalSteps
        
        timer = Timer.scheduledTimer(withTimeInterval: stepTime, repeats: true) { timer in
            if progress < 100 {
                progress += increment
            } else {
                progress = 100
                timer.invalidate()
            }
        }
    }
}
