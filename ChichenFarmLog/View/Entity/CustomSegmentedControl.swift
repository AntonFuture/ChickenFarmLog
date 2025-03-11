import SwiftUI

struct CustomSegmentedControl<T: Hashable>: View {
    let items: [T]
    
    @Binding var selectedItem: T
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(items, id: \.self) { item in
                Text("\(item)")
                    .font(.system(size: 17, weight: .medium))
                    .padding(.horizontal, 22)
                    .padding(.vertical, 11)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                    )
                    .foregroundColor(selectedItem == item ? Color(hex: "#7B0623") : .gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(selectedItem == item ? Color(hex: "#7B0623") : Color.white, lineWidth: 1.5)
                    )
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedItem = item
                        }
                    }
            }
        }
        .padding(4)
    }
    
    @Namespace private var animationNamespace
}

