//
//  AppIntent.swift
//  Lucky Jar Widget
//
//  Created by Eugen Ionita on 12/09/2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("Lucky Jar Widget")

    // An example configurable parameter.
    @Parameter(title: "Custom Text", default: "")
    var favoriteString: String
    
}
