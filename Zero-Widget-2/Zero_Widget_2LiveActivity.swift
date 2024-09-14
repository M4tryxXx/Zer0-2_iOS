//
//  Zero_Widget_2LiveActivity.swift
//  Zero-Widget-2
//
//  Created by Eugen Ionita on 13/09/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Zero_Widget_2Attributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Zero_Widget_2LiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Zero_Widget_2Attributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Zero_Widget_2Attributes {
    fileprivate static var preview: Zero_Widget_2Attributes {
        Zero_Widget_2Attributes(name: "World")
    }
}

extension Zero_Widget_2Attributes.ContentState {
    fileprivate static var smiley: Zero_Widget_2Attributes.ContentState {
        Zero_Widget_2Attributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Zero_Widget_2Attributes.ContentState {
         Zero_Widget_2Attributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Zero_Widget_2Attributes.preview) {
   Zero_Widget_2LiveActivity()
} contentStates: {
    Zero_Widget_2Attributes.ContentState.smiley
    Zero_Widget_2Attributes.ContentState.starEyes
}
