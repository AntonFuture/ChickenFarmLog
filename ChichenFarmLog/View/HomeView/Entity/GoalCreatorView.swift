import SwiftUI

struct GoalCreatorView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedCategory = "Plants"
    let categories = ["Plants", "Animals"]
    
    enum ChoseVarietiesPlanst: String, CaseIterable {
        case vegetables = "vegetables"
        case fruits = "Fruits"
        case cereals = "Cereals"
        case decorative = "Decorative"
        case spinning = "Spinning"
        case none = ""
        
        var imageName: String {
            switch self {
            case .vegetables: return "creator_vegetables"
            case .fruits: return "creator_fruits"
            case .cereals: return "creator_cereals"
            case .decorative: return "creator_decorative"
            case .spinning: return "creator_spinning"
            case .none: return ""
            }
        }
    }
    
    enum ChoseVarietiesAnimals: String, CaseIterable {
        case chickens = "Chickens"
        case cows = "Cows"
        case sheeps = "Sheeps"
        case pigs = "Pigs"
        case rabbits = "Rabbits"
        case none = ""
        
        var imageName: String {
            switch self {
            case .chickens: return "creator_chickens"
            case .cows: return "creator_cows"
            case .sheeps: return "creator_sheeps"
            case .pigs: return "creator_pigs"
            case .rabbits: return "creator_rabbits"
            case .none: return ""
            }
        }
    }
    
    @State private var selectedVarietiePlanst: ChoseVarietiesPlanst = .none
    @State private var selectedVarietieAnimals: ChoseVarietiesAnimals = .none

    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State var quantity: String = "250"
    
    var body: some View {
        
        ZStack {
            Image("mainBackground_color")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 5) {
                    Text("Varieties")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                        
                    HStack {
                        CustomSegmentedControl(
                            items: categories,
                            selectedItem: $selectedCategory)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, -5)
                }
                .frame(maxWidth: .infinity, alignment: .top)
                .padding(.top, 30)
                
                VStack {
                    Text("Choice")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.top, 24)
                        .padding(.bottom, 14)
                    
                    if selectedCategory == "Plants" {
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(ChoseVarietiesPlanst.allCases.filter { $0 != .none }, id: \.self) { item in
                                VStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .padding(.top, -15)
                                        .padding(.leading, -25)
                                    
                                    Text(item.rawValue)
                                        .font(.system(size: 17, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 12)
                                        .foregroundColor(selectedVarietiePlanst == item ? Color(hex: "#7B0623") : Color(hex: "#FF3366"))
                                    
                                }
                                .frame(width: 112, height: 112)
                                .background(Color.white)
                                .cornerRadius(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(selectedVarietiePlanst == item ? Color(hex: "#7B0623") : Color.clear, lineWidth: 2)
                                )
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedVarietiePlanst = item
                                    }
                                }
                            }
                        }
                        .padding(.leading, -5)
                    } else {
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(ChoseVarietiesAnimals.allCases.filter { $0 != .none }, id: \.self) { item in
                                VStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .padding(.top, -15)
                                        .padding(.leading, -25)
                                    
                                    Text(item.rawValue)
                                        .font(.system(size: 17, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 12)
                                        .foregroundColor(selectedVarietieAnimals == item ? Color(hex: "#7B0623") : Color(hex: "#FF3366"))
                                }
                                .frame(width: 112, height: 112)
                                .background(Color.white)
                                .cornerRadius(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(selectedVarietieAnimals == item ? Color(hex: "#7B0623") : Color.clear, lineWidth: 2)
                                )
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedVarietieAnimals = item
                                    }
                                }
                            }
                        }
                        .padding(.leading, -5)
                    }
                    
                }
                
                VStack {
                    Text("Data")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.top, 24)
                        .padding(.bottom, 14)
                    
                    QuantityInputView(quantity: $quantity)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, -5)
                }
                
                Spacer()
                
                Button {
                    print("Create")
                } label: {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(hex: "#FF4271"))
                        .frame(height: 50)
                        .overlay {
                            HStack {
                                Text("Add")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 17))
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Add monthly goals")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
            }
        }
    }
}


struct QuantityInputView: View {
    @Binding var quantity: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Quantity")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                // Само поле ввода
                TextField("", text: $quantity)
                    .keyboardType(.decimalPad)
                    .font(.system(size: 17))
                    .foregroundColor(Color(hex: "#FF3366"))
            }
            .padding()
        }
        .frame(height: 70)
    }
}
