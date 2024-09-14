//
//  Lucky_Jar_Widget.swift
//  Lucky Jar Widget
//
//  Created by Eugen Ionita on 12/09/2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 59 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        print(entries)

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct Lucky_Jar_WidgetEntryView : View {
    var entry: Provider.Entry
    @State private var notePulled = false
    @State private var note = ""
    

    var body: some View {
        
//        VStack{
//            
//            Text(notePulled ? "\(note)" : "Little Jar full of Pozitive Messages just for You!")
//                .font(.system(size: notePulled ? 14 : 14, weight: .bold, design: .default))
//                .foregroundColor(.white)
//                .multilineTextAlignment(.center)
//                
//
//            Text(notePulled ? "" : "Directions for use: \n Pull one note daily or when needed.")
//                .font(.system(size: 12, weight: .bold, design: .default))
//                .foregroundColor(.white)
//                .multilineTextAlignment(.center)
//            Text( notePulled ? "" : "Ingredients: \n Blessings, Friendship, Karma & Success!")
//                .font(.system(size: 12, weight: .bold, design: .default))
//                .foregroundColor(.white)
//                .multilineTextAlignment(.center)
//            
//        }
//        .frame(width: 150, height: 150, alignment: .center)
//        .border(Color("TextColor"))
////        .border(ImagePaint(image: Image("heart"),sourceRect: CGRect(x: 0.03, y: 0, width: 0.5, height: 0.5) , scale: 0.5 ), width: 0.3)
//        .cornerRadius(10)
//            
       
        VStack {
            Text(entry.date, style: .time)
                .tracking(15)
                .font(.system(size: 80, weight: .heavy, design: .serif))
                            .minimumScaleFactor(0.3)
                            .lineLimit(1)
                .foregroundColor(.pink)
                .padding(.top,-20)
                
            Text(entry.configuration.favoriteString)
                .font(.system(size: 40, weight: .semibold, design:             .serif))
                .minimumScaleFactor(0.3)
                .lineLimit(1)
                .foregroundColor(.mint)
                .bold()
        }
        
    }
}

struct Lucky_Jar_Widget: Widget {
    let kind: String = "Lucky_Jar_Widget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            Lucky_Jar_WidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var zero: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteString = "Zer0"
        return intent
    }
    
    fileprivate static var rem: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteString = "RemProPlayer"
        return intent
    }
    fileprivate static var m4tr: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteString = "M4tryxXx"
        return intent
    }
}

#Preview(as: .systemSmall) {
    Lucky_Jar_Widget()
} timeline: {
    SimpleEntry(date: .now, configuration: .zero)
    SimpleEntry(date: .now, configuration: .rem)
    SimpleEntry(date: .now, configuration: .m4tr)
}
