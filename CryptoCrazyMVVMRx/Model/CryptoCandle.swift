/*
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation


struct CryptoCandle : Codable {
    
    let open : String?
    let high : String?
    let low : String?
    let close : String?
    let volume : String?
    let period : Double?

    enum CodingKeys: String, CodingKey {

        case open = "open"
        case high = "high"
        case low = "low"
        case close = "close"
        case volume = "volume"
        case period = "period"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        open = try values.decodeIfPresent(String.self, forKey: .open)
        high = try values.decodeIfPresent(String.self, forKey: .high)
        low = try values.decodeIfPresent(String.self, forKey: .low)
        close = try values.decodeIfPresent(String.self, forKey: .close)
        volume = try values.decodeIfPresent(String.self, forKey: .volume)
        period = try values.decodeIfPresent(Double.self, forKey: .period)
    }

}


struct CandleData : Codable {
    let data : [CryptoCandle]?
    let timestamp : Int?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case timestamp = "timestamp"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([CryptoCandle].self, forKey: .data)
        timestamp = try values.decodeIfPresent(Int.self, forKey: .timestamp)
    }

}
