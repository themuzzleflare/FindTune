import SwiftUI

struct ContentView: View {
    @State var itunesDataWin = [iTunes]()
    @State var itunesDataMac = [iTunes]()
    let app = FindTuneApp()
    var homeRefreshButton: some View {
        Button(action: { self.sendWinRequest(); self.sendMacRequest() }) {
            Image(systemName: "arrow.clockwise.circle")
                .accessibility(label: Text("Refresh"))
        }
    }
    
    var body: some View {
        List {
            HStack(alignment: .center, spacing: 15) {
                Text("Versions")
                    .font(.custom(app.lucidaGrande.bold, size: 34))
                homeRefreshButton
            }
            Text("Windows")
                .font(.custom(app.lucidaGrande.regular, size: 17))
            ForEach(itunesDataWin, id: \.version) { itunes in
                NavigationLink(destination: InfoView(itunes: itunes)) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(itunes.version)
                            .font(.custom(app.lucidaGrande.bold, size: 13))
                        Text(itunes.platform.rawValue)
                            .font(.custom(app.lucidaGrande.regular, size: 11))
                            .opacity(0.65)
                    }
                }
            }
            Divider()
            Text("macOS")
                .font(.custom(app.lucidaGrande.regular, size: 17))
            ForEach(itunesDataMac, id: \.version) { itunes in
                NavigationLink(destination: InfoView(itunes: itunes)) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(itunes.version)
                            .font(.custom(app.lucidaGrande.bold, size: 13))
                        Text(itunes.platform.rawValue)
                            .font(.custom(app.lucidaGrande.regular, size: 11))
                            .opacity(0.65)
                    }
                }
            }
            Divider()
            NavigationLink(destination: About()) {
                Text("About")
                    .font(.custom(app.lucidaGrande.regular, size: 13))
            }
        }
        .onAppear(perform: sendWinRequest)
        .onAppear(perform: sendMacRequest)
        .listStyle(SidebarListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
