import SwiftUI

struct OnboardingView: View {
    
    var didOnboarding: (() -> Void)
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        ZStack {
            Image("mainBackground_color")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Button {
                        didOnboarding()
                    } label: {
                        Text("Skip")
                            .font(.system(size: 17, weight: .medium))
                            .foregroundStyle(.white)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .opacity(currentIndex != 2 ? 1 : 0)
                .padding(.top, 35)
                .padding(.trailing, 36)

                Spacer()
                
                VStack {
                    pageView(currentIndex)
                        .padding(.horizontal, 16)
                }
                
                Spacer()
                
                HStack {
                    Button {
                        withAnimation {
                            if currentIndex != 2 {
                                currentIndex += 1
                            } else {
                                didOnboarding()
                            }
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .overlay {
                                Image("onboarding_right-ic")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, 35)
                .padding(.trailing, 36)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func pageView(_ page: Int) -> some View {
        VStack {
            Image(getImageForPage(page))
                .resizable()
                .scaledToFill()
                .frame(width: 263, height: 263)
            
            VStack(spacing: 16) {
                Text(getTitleForPage(page))
                    .frame(maxWidth: 360)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                
                Text(getSubtitleForPage(page))
                    .frame(maxWidth: 360)
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 40)
        }
    }
    
    private func getImageForPage(_ page: Int) -> String {
        switch page {
        case 0:
            return "onboarding_checken_1"
        case 1:
            return "onboarding_2"
        case 2:
            return "onboarding_3"
        default:
            return ""
        }
    }
    
    private func getTitleForPage(_ page: Int) -> String {
        switch page {
        case 0:
            return "Your farm is under control"
        case 1:
            return "From seed to harvest"
        case 2:
            return "Caring and consideration"
        default:
            return ""
        }
    }
    
    private func getSubtitleForPage(_ page: Int) -> String {
        switch page {
        case 0:
            return "Manage your entire farm - track plantings, care for animals and analyze production"
        case 1:
            return "Plan plantings, monitor the growth of crops and record the volume of harvested crops"
        case 2:
            return "Monitor milk production, egg production and animal health"
        default:
            return ""
        }
    }
}
