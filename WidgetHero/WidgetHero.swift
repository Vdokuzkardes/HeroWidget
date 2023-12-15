//
//  WidgetHero.swift
//  WidgetHero
//
//  Created by Vedat Dokuzkardeş on 4.12.2023.
//




import WidgetKit
import SwiftUI
import AppIntents


struct Provider: AppIntentTimelineProvider {
    
    
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.com.vedatdokuzkardes.HeroWidget"))
    var heroData : Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), hero: SuperHero(image: "batman", name: "Batman", realName: "Bruce Wayne"))
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        return await withCheckedContinuation { continuation in
            if let hero = try? JSONDecoder().decode(SuperHero.self, from: heroData) {
                let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
                continuation.resume(returning: entry)
            }
        }
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        return await withCheckedContinuation { continuation in
            if let hero = try? JSONDecoder().decode(SuperHero.self, from: heroData) {
                let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
                let timeline = Timeline(entries: [entry], policy: .never)
                continuation.resume(returning: timeline)
            }
        }
    }
    
    struct SimpleEntry: TimelineEntry {
        let date: Date
        let configuration: ConfigurationAppIntent
        let hero: SuperHero
    }
    
    struct WidgetHeroEntryView : View {
        var entry: Provider.Entry
        
        var body: some View {
            CircularImageView(image: Image(entry.hero.image))
            
        }
    }
    
    struct WidgetHero: Widget {
        let kind: String = "WidgetHero"
        
        var body: some WidgetConfiguration {
            
            AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
                WidgetHeroEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            }
            .configurationDisplayName("Widget Hero")
            .description("Hero widget!!!")
        }
    }
    
}
    extension ConfigurationAppIntent {
        
        // Static property to create a ConfigurationAppIntent with a favorite emoji of 😀
        fileprivate static var smiley: ConfigurationAppIntent {
            let intent = ConfigurationAppIntent()
            intent.favoriteEmoji = "😀"
            return intent
        }
        
        // Static property to create a ConfigurationAppIntent with a favorite emoji of 🤩
        fileprivate static var starEyes: ConfigurationAppIntent {
            let intent = ConfigurationAppIntent()
            intent.favoriteEmoji = "🤩"
            return intent
        }
    }

