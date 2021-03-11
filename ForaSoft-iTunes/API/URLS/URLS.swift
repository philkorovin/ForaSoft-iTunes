import Foundation

enum URLS {
    static let ipbot = "https://bot.whatismyipaddress.com/"
    
    //MARK: -- Apple Music Hosts
    static let itunesHost = "https://itunes.apple.com"
    static let appleMusicHost = "https://music.apple.com"
    
    //MARK: -- Links constructor
    static func albums(_ request: String, limit: Int = 50) -> String {
        let term = request.reduce(""){ $1 == " " ? "\($0)+" : "\($0)\($1)"}
        let url: String = URLS.itunesHost + "/search?term=\(term)&entity=album&limit=\(limit)"
        return url
    }
    static let trackList: String = URLS.itunesHost + "/lookup?entity=song&id="
    static func appleMusic(_ collectionName: String, _ collectionId: Int) -> URL {
        let urlString: String = URLS.appleMusicHost + "/album/\(collectionName)/\(collectionId)"
        let urlQueryAllowed: String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        return URL(string: urlQueryAllowed)!
    }
    
    //MARK: -- Link for post request
    static let post: String = "https://ptsv2.com/t/asahiocean_forasoft_itunes/post"
    
    static func encoder(_ string: String) -> URL {
        let urlString = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ??
            string.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? string
        return URL(string: urlString)!
    }
}
