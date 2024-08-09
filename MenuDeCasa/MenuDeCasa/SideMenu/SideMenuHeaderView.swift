//
//  SideMenuHeaderView.swift
//  MenuDeCasa
//
//  Created by Rodrigo Queiroz on 09/08/24.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack(alignment: .topTrailing) {
                Button {
                    withAnimation(.spring) {
                        isShowing.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 32, height: 32)
                        .foregroundColor(.white)
                        .padding()
                }
           
                VStack(alignment: .leading) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                        .padding(.bottom, 16)
                    
                    Text("Rodrigo Queiroz")
                        .font(.system(size: 24, weight: .semibold))
                        .padding(.bottom, 5)
                    Text("@roqueiroz")
                        .font(.system(size: 14))
                    HStack(spacing: 12) {
                        HStack(spacing: 4) {
                        
                        }
                        
                        HStack(spacing: 4) {
                        
                        }
                        
                        Spacer()
                    }
                    Spacer()
                }
        }
        .padding()
        .foregroundColor(.white)
    }
}

#Preview {
    SideMenuHeaderView(isShowing: .constant(true))
}
