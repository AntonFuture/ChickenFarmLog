import SwiftUI

struct HomeView: View {
    
    @State var isEmpty: Bool = true
    @State var actionToGoCreatorView: Bool = false
    
    var body: some View {
        ZStack {
            Image("mainBackground_color")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if isEmpty {
                    
                    Spacer()
                    
                    Image("mainScreen_empty")
                        .resizable()
                        .frame(width: 231, height: 260)
                    
                    Text("Hello! Let's start with your\nmonthly goals")
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: GoalCreatorView(),
                        isActive: $actionToGoCreatorView
                    ) {
                        Button {
                            actionToGoCreatorView.toggle()
                        } label: {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(hex: "#FF4271"))
                                .frame(height: 50)
                                .padding(.horizontal, 16)
                                .overlay {
                                    HStack {
                                        Text("Add monthly goals")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 17))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                }
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

