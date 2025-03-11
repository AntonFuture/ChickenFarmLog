import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            Image("mainBackground_color")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                TabContent(selectedTab: selectedTab)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                CustomTabBar(selectedTab: $selectedTab)
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct TabContent: View {
    let selectedTab: Int
    
    var body: some View {
        switch selectedTab {
        case 0:
            NavigationView {
                HomeView()
                    .navigationTitle("Farm management")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing: rightButton())
            }
        case 1:
            NavigationView {
                EmptyView()
                    .navigationTitle("Plants")
            }
        case 2:
            NavigationView {
                EmptyView()
                    .navigationTitle("Animals")
            }
        case 3:
            NavigationView {
                EmptyView()
                    .navigationTitle("Statistics")
            }
        default:
            NavigationView {
                HomeView()
                    .navigationTitle("Farm management")
                    .navigationBarItems(trailing: rightButton())
            }
        }
    }
    
    @ViewBuilder
    private func rightButton() -> some View {
        Button {
            print("Tap")
        } label: {
            Image("settings_app")
                .resizable()
                .frame(width: 24, height: 24)
        }
        .frame(width: 50, height: 50)
    }
}
