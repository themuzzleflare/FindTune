import Foundation

extension ContentView {
    func sendWinRequest() {
        let url = URL(string: "https://api.ipsw.me/v4/itunes/windows")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([iTunes].self, from: data) {
                    DispatchQueue.main.async {
                        self.itunesDataWin = decodedResponse
                    }
                    return
                }
            } else {
                print(error ?? "Unknown error occured while retrieving iTunes versions for Windows")
            }
        }
        task.resume()
    }
    func sendMacRequest() {
        let url = URL(string: "https://api.ipsw.me/v4/itunes/macOS")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([iTunes].self, from: data) {
                    DispatchQueue.main.async {
                        self.itunesDataMac = decodedResponse
                    }
                    return
                }
            } else {
                print(error ?? "Unknown error occured while retrieving iTunes versions for OS X/macOS")
            }
        }
        task.resume()
    }
}
