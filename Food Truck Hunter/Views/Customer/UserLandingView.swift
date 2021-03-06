import SwiftUI

struct LandingView: View {
    var body: some View {
        TabView {
            FavoriteListView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favourites")
                }
            MapView().tabItem {
                Image(systemName: "mappin.circle.fill")
                Text("Nearby")
            }
            AccountSettingView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Account")
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}


