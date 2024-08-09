//
//  LogoutView.swift
//  MenuDeCasa
//
//  Created by Rodrigo Queiroz on 09/08/24.
//

import SwiftUI

struct SizeKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct LogoutView: View {
    @State private var sheetHeight: CGFloat = .zero
    @Binding var showSheetPresented: Bool
    
    var body: some View {
        GeometryReader(content: { geometry in
            let size = geometry.size
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 12, content: {
                    Text("Deseja realmente sair?")
                        .font(.title.bold())
                        .lineLimit(2)
                    HStack {
                        Button("Sair") {
                        }.buttonStyle(.borderedProminent)
                            .tint(.red)
                        
                        Button("Cancelar") {
                            showSheetPresented.toggle()
                        }.buttonStyle(.borderedProminent)
                            .tint(.black)
                    }
                    .padding(15)
                })
                .padding(15)
                .padding(.horizontal, 10)
                .padding(.top, 15)
                .frame(width: size.width, alignment: .leading)
                .heightChangePreference { height in
                    sheetHeight = height
                }
            }
        })
        .presentationDetents(sheetHeight == .zero ? [.medium] : [.height(sheetHeight)])
    }
}

extension View {
    @ViewBuilder
    func heightChangePreference(completion: @escaping(CGFloat) -> ()) -> some View {
        self.overlay {
            GeometryReader(content: { geometry in
                Color
                    .clear
                    .preference(key: SizeKey.self, value: geometry.size.height)
                    .onPreferenceChange(SizeKey.self, perform: { value in
                        completion(value)
                    })
            })
        }
    }
}

#Preview {
    LogoutView(showSheetPresented: .constant(false))
}
