# iPhone Quote Widget App (iOS) - Project Plan

## Overview
Build an iOS app with a home screen widget and simple main screen that displays a new ethical quote each day from a static list. The quote updates at midnight in the user's local timezone, cycling sequentially from the user's first app launch date. Share code between the app and widget using a framework to avoid duplication.

## Core Requirements
- **Platform**: iOS only (separate Android version later)
- **Widget**: Home screen widget displaying current day's quote
- **Main App**: Simple display of current day's quote
- **Quote Rotation**: Sequential cycling through static list of 50 quotes (expandable)
- **Update Timing**: Refresh at midnight in user's local timezone
- **First Launch**: Track first app launch date to determine starting point for quote rotation
- **Data Sharing**: Use AppGroup to share UserDefaults between app and widget extension

## Technical Architecture

### Project Structure
1. **Main Xcode Project** (iOS App)
   - SwiftUI-based app target
   - Widget Extension target
   - Shared Framework target (for code reuse)

2. **Shared Framework**
   - `Quote` data structure (text, author)
   - Static array of 50 quotes
   - `QuoteManager` utility class

3. **Widget Extension**
   - `TimelineProvider` configured for midnight local timezone refresh
   - SwiftUI widget UI
   - Uses `QuoteManager` from shared framework

4. **Main App**
   - Simple SwiftUI view displaying current day's quote
   - Uses `QuoteManager` from shared framework

### Key Components

#### Quote Model
```
struct Quote {
    var text: String
    var author: String
}
```

#### QuoteManager Responsibilities
- Track first-launch date in shared UserDefaults (using AppGroup identifier)
- Calculate days elapsed since first launch
- Return the appropriate quote based on: `quoteIndex = daysElapsed % quoteCount`
- Handle local timezone correctly for "current day" calculation

#### AppGroup Configuration
- Shared container identifier: `group.com.yourcompany.ethicsapp` (adjust domain as needed)
- Applied to both main app and widget extension targets
- Enables shared UserDefaults access for first-launch date

#### Widget Timeline Provider
- Generates daily timeline entries
- Next refresh scheduled for midnight local time each day
- Uses `QuoteManager` to fetch the correct quote for each timeline entry

#### Main App UI
- Display current day's quote
- Display author attribution
- Simple, clean design
- Access to add widget (standard iOS functionality)

## Development Steps
1. Create Xcode project with SwiftUI and add Widget Extension target
2. Create shared iOS Framework target
3. Implement `Quote` model and static quote array in shared framework
4. Implement `QuoteManager` in shared framework with first-launch tracking and quote calculation
5. Configure AppGroup identifiers in both main app and widget extension
6. Build Widget Extension UI and `TimelineProvider`
7. Build main app UI to display current quote
8. Test on simulator/device with different dates to verify rotation logic
9. Test widget refresh at midnight

## Future Considerations
- Android version with similar functionality (separate project)
- User-customizable quotes (currently static)
- Share quote functionality
- Quote favorites/bookmarking
- Multiple quote sources or categories
