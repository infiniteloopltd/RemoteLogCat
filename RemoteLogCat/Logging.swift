import Foundation

class Logging
{
    static var Key : String?
    static func Log(Channel : String, Log : String, Completion: ((Bool) -> ())? = nil)
    {
        if let apiKey = Logging.Key
        {
            let strChannel = Channel.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let strLog = Log.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            print("\(Channel):\(Log)")
            let url = URL(string: "http://www.remotelogcat.com/log.php?apikey=\(apiKey)&channel=\(strChannel)&log=\(strLog)")
            let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
                Completion?(error == nil)
            }
            task.resume()
        }
        else
        {
            print("No API Key set for RemoteLogCat.com API")
            Completion?(false)
        }
    }
}
