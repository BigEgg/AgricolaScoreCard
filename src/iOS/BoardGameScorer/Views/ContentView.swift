//
//  ContentView.swift
//  BoardGameScorer
//
//  Created by Jianming Xiao on 11/21/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = false
    @State private var askName: Bool = false
    @State private var showWelcomeBack: Bool = false
    
    @EnvironmentObject var userData: UserData
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            if self.isActive {
                HomeView()
            } else {
                SplashView()
            }
            if self.showWelcomeBack {
                WelcomeBackPopupView()
                    .position(x: screenWidth / 2, y: 35)
            }
            if self.askName {
                AskNamePopupView(closeAction: {
                    hideSplashView()
                })
            }
        }
        .onAppear {
            if userData.userId.isEmpty {
                self.askName = true
            } else {
                self.showWelcomeBack = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    hideSplashView()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.showWelcomeBack = false
                    }
                }
            }
        }
    }
    
    func hideSplashView() -> Void {
        withAnimation {
            self.askName = false
            self.isActive = true
        }
    }
}

struct WelcomeBackPopupView: View {
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var players: FetchedResults<Player>
    @EnvironmentObject private var userData: UserData

    var body: some View {
        let user = players.first(where: { $0.id == UUID(uuidString: userData.userId) })!
        
        ZStack {
            Color(UIColor.systemGray5)
            VStack {
                Text("Welcom Back")
                    .font(.headline)
                Text(user.name!)
            }.padding()
        }
        .frame(width: 200, height: 75)
        .cornerRadius(20).shadow(radius: 20)
        .opacity(0.8)
    }
}

struct AskNamePopupView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var userData: UserData
    @State private var name: String = ""

    var closeAction: () -> Void

    init(closeAction: @escaping () -> Void) {
        self.closeAction = closeAction
    }

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
            VStack {
                Text("Welcom New user")
                    .font(.headline)
                    .padding(.bottom)
                TextField("Enter your nick name", text: $name)
                    .multilineTextAlignment(.center)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color(UIColor.systemBlue).opacity(0.5), lineWidth: 2)
                    )
                Spacer()
                Button(action: {
                    let user = Player(context: viewContext)
                    user.id = UUID()
                    user.name = self.name
                    
                    do {
                        try self.viewContext.save()
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unable to save new user \(nsError), \(nsError.userInfo)")
                    }
                    self.userData.userId = user.id!.uuidString
                    
                    self.closeAction()
                }, label: {
                    Text("Save")
                }).disabled(self.name.isEmpty)
            }.padding()
        }
        .frame(width: 300, height: 200)
        .cornerRadius(20).shadow(radius: 20)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
                .environment(\.colorScheme, .dark)
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .previewDisplayName("iPhone 12 Pro Max (Dark)")
                .environment(\.colorScheme, .light)
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        .environmentObject(UserData.init(userId: "", forceEmpty: true))
        
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
                .environment(\.colorScheme, .light)
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .previewDisplayName("iPhone 12 Pro Max (Dark)")
                .environment(\.colorScheme, .dark)
        }
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        .environmentObject(UserData.preview)
    }
}
