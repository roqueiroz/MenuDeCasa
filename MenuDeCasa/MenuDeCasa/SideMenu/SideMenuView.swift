//
//  SideMenuView.swift
//  MenuDeCasa
//
//  Created by Rodrigo Queiroz on 09/08/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @State var showSheetPresented = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .orange]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                SideMenuHeaderView(isShowing: $isShowing)
                    .frame(height: 240)
                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                    switch option {
                        case .profile:
                            NavigationLink(destination: ProfileView()) {
                                SideMenuOptionView(viewModel: option)
                            }
                        case .messages:
                            NavigationLink(destination: MessagesView()) {
                                SideMenuOptionView(viewModel: option)
                            }
                        case .notifications:
                            NavigationLink(destination: NotificationsView()) {
                                SideMenuOptionView(viewModel: option)
                            }
                        case .logout:
                            Button(action: {
                                showSheetPresented.toggle()
                            }, label: {
                                SideMenuOptionView(viewModel: option)
                            })
                            .sheet(isPresented: $showSheetPresented, content: {
                                LogoutView(showSheetPresented: $showSheetPresented)
                            })
                    }
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true))
}
