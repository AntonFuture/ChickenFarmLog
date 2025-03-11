import SwiftUI

@main
struct ChichenFarmLogApp: App {

    @AppStorage("wasOnboarded") var wasOnboarded: Bool = false
    @State private var didLoad: Bool = false
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if !didLoad {
                    LoadingView {
                        withAnimation {
                            didLoad = true
                        }
                    }
                } else {
                    if !wasOnboarded {
                        OnboardingView {
                            wasOnboarded = true
                        }
                    } else {
                        MainView()
                    }
                }
            }
        }
    }
}
