import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    let tabs = [
        ("Home", "tabBar_home"),
        ("Plants", "tabBar_plants"),
        ("Animals", "tabBar_animal"),
        ("History", "tabBar_history")
    ]
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Button(action: {
                        withAnimation {
                            selectedTab = index
                        }
                    }) {
                        VStack {
                            Image(selectedTab == index ? "\(tabs[index].1)-selected" : "\(tabs[index].1)")
                                .resizable()
                                .frame(width: 26, height: 28)
                            
                            Text(tabs[index].0)
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(selectedTab == index ? Color(hex: "#FF3366") : .white)
                        }
                        .padding(.top, -20)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .frame(height: 84)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(hex: "#7B0623"))
            )
        }
        .frame(maxHeight: .infinity)
        .padding(.bottom, -35)
    }
}
