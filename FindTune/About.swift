import SwiftUI

struct About: View {
    let app = FindTuneApp()
    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 5) {
                Image("FindTune_Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(app.displayName ?? app.name ?? "FindTune")
                    .font(.custom(app.lucidaGrande.bold, size: 34))
            }
            Divider()
            Text("Version: ").font(.custom(app.lucidaGrande.bold, size: 13)) + Text(app.version ?? "Unknown").font(.custom(app.lucidaGrande.regular, size: 13))
            Divider()
            Text("Build: ").font(.custom(app.lucidaGrande.bold, size: 13)) + Text(app.build ?? "Unknown").font(.custom(app.lucidaGrande.regular, size: 13))
            Divider()
            Link(destination: URL(string: "mailto:feedback@tavitian.cloud?subject=Feedback%20for%20FindTune")!) {
                HStack(alignment: .center, spacing: 5) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text("Contact Developer")
                        .font(.custom(app.lucidaGrande.regular, size: 13))
                }
            }
            Divider()
            Text(app.copyright ?? "Copyright © 2020 Paul Tavitian")
                .opacity(0.65)
                .font(.custom(app.lucidaGrande.regular, size: 10))
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
