import SwiftUI

@main
struct FindTuneApp: App {
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    let name = Bundle.main.infoDictionary?["CFBundleName"] as? String
    let displayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
    let copyright = Bundle.main.infoDictionary?["NSHumanReadableCopyright"] as? String
    let encryption = Bundle.main.infoDictionary?["ITSAppUsesNonExemptEncryption"] as? Bool
    let package = Bundle.main.infoDictionary?["CFBundlePackageType"] as? String
    let deploymentTarget = Bundle.main.infoDictionary?["LSMinimumSystemVersion"] as? String
    let lucidaGrande = (regular: "LucidaGrande", bold: "LucidaGrande-Bold")
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .onAppear(perform: getFonts)
                    .onAppear(perform: getFontSizes)
                    .navigationTitle(displayName ?? name ?? "FindTune")
            }
        }
    }
}

extension FindTuneApp {
    func getFonts() {
        let fontFamilies = NSFontManager.shared.availableFontFamilies.sorted()
        for family in fontFamilies {
            print(family)
            let familyFonts = NSFontManager.shared.availableMembers(ofFontFamily: family)
            if let fonts = familyFonts {
                for font in fonts {
                    print("\t\(font)")
                }
            }
        }
    }
    func getFontSizes() {
        let styles: [NSFont.TextStyle] = [
            .largeTitle,
            .title1, .title2, .title3, .callout,
            .headline, .subheadline, .body, .footnote, .caption1, .caption2,
        ]
        
        for style in styles {
            let font = NSFont.preferredFont(forTextStyle: style)
            print("\(style): \(font.fontName) @ \(font.pointSize)")
        }
    }
}
