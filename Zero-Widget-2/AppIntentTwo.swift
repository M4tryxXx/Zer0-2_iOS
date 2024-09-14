//
//  AppIntent.swift
//  Zero-Widget-2
//
//  Created by Eugen Ionita on 13/09/2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntentTwo: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}
