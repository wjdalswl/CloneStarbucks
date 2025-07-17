//
//  TemperatureAvailability.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

enum TemperatureAvailability: String, Codable {
    case hotAndIced = "HOT_AND_ICED"
    case hotOnly = "HOT_ONLY"
    case icedOnly = "ICED_ONLY"
    
    var temperatures: [Temperature] {
        switch self {
        case .hotAndIced:
            return [.hot, .iced]
        case .hotOnly:
            return [.hot]
        case .icedOnly:
            return [.iced]
        }
    }
}
