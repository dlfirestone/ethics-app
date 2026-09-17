//
//  EthiclyWidgetLiveActivity.swift
//  EthiclyWidget
//
//  Created by DM on 9/16/26.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct EthiclyWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct EthiclyWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: EthiclyWidgetAttributes.self) { context in
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

extension EthiclyWidgetAttributes {
    fileprivate static var preview: EthiclyWidgetAttributes {
        EthiclyWidgetAttributes(name: "World")
    }
}

extension EthiclyWidgetAttributes.ContentState {
    fileprivate static var smiley: EthiclyWidgetAttributes.ContentState {
        EthiclyWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: EthiclyWidgetAttributes.ContentState {
         EthiclyWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: EthiclyWidgetAttributes.preview) {
   EthiclyWidgetLiveActivity()
} contentStates: {
    EthiclyWidgetAttributes.ContentState.smiley
    EthiclyWidgetAttributes.ContentState.starEyes
}
