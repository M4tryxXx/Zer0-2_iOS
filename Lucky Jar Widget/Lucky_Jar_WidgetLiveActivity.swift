//
//  Lucky_Jar_WidgetLiveActivity.swift
//  Lucky Jar Widget
//
//  Created by Eugen Ionita on 12/09/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Lucky_Jar_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var string: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Lucky_Jar_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Lucky_Jar_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.string)")
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
                    Text("Bottom \(context.state.string)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.string)")
            } minimal: {
                Text(context.state.string)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Lucky_Jar_WidgetAttributes {
    fileprivate static var preview: Lucky_Jar_WidgetAttributes {
        Lucky_Jar_WidgetAttributes(name: "Zer0")
    }
}

extension Lucky_Jar_WidgetAttributes.ContentState {
    fileprivate static var m4tr: Lucky_Jar_WidgetAttributes.ContentState {
        Lucky_Jar_WidgetAttributes.ContentState(string: "😀")
     }
     
     fileprivate static var starEyes: Lucky_Jar_WidgetAttributes.ContentState {
         Lucky_Jar_WidgetAttributes.ContentState(string: "🤩")
     }
}

#Preview("Notification", as: .content, using: Lucky_Jar_WidgetAttributes.preview) {
   Lucky_Jar_WidgetLiveActivity()
} contentStates: {
    Lucky_Jar_WidgetAttributes.ContentState.m4tr
    Lucky_Jar_WidgetAttributes.ContentState.starEyes
}
