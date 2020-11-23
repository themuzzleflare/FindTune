import SwiftUI

struct InfoView: View {
    var itunes: iTunes
    let app = FindTuneApp()
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("iTunes \(itunes.version)").font(.custom(app.lucidaGrande.bold, size: 34))
            Text(itunes.platform.rawValue)
                .font(.custom(app.lucidaGrande.regular, size: 11))
                .opacity(0.65)
        }
        List {
            Text("Version: ").font(.custom(app.lucidaGrande.bold, size: 13)) + Text(itunes.version).font(.custom(app.lucidaGrande.regular, size: 13))
            Divider()
            Text("Platform: ").font(.custom(app.lucidaGrande.bold, size: 13)) + Text(itunes.platform.rawValue).font(.custom(app.lucidaGrande.regular, size: 13))
            Divider()
            if itunes.datefound != nil {
                Text("Date Found: ").font(.custom(app.lucidaGrande.bold, size: 13)) + Text(itunes.datefound!).font(.custom(app.lucidaGrande.regular, size: 13))
                Divider()
            }
            if itunes.uploaddate != nil {
                Text("Upload Date: ").font(.custom(app.lucidaGrande.bold, size: 13)) + Text(itunes.uploaddate!).font(.custom(app.lucidaGrande.regular, size: 13))
                Divider()
            }
            if itunes.releasedate != nil {
                Text("Release Date: ").font(.custom(app.lucidaGrande.bold, size: 13)) + Text(itunes.releasedate!).font(.custom(app.lucidaGrande.regular, size: 13))
                Divider()
            }
            Link(destination: URL(string: itunes.url)!) {
                Text("Download").font(.custom(app.lucidaGrande.bold, size: 13))
            }
        }
        .navigationTitle("iTunes \(itunes.version)")
        .navigationSubtitle(itunes.platform.rawValue)
    }
}
