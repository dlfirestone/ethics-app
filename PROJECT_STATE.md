QuoteManager# Ethicly App - Project Progress Tracker

**Current Date**: September 16, 2026  
**Project**: iPhone Quote Widget App (iOS)  
**Last Updated**: [Current session]

---

## Completed Steps ✓

- [x] **Step 1**: Create Xcode project with SwiftUI
  - Project name: `Ethicly`
  - Bundle ID: `com.deborah.Ethicly`

- [x] **Step 2**: Add Widget Extension target
  - Target name: `Ethicly WidgetExtension`

- [x] **Step 3**: Create Shared Framework target
  - Target name: `EthicsShared`

- [x] **Step 4**: Configure AppGroup for data sharing
  - AppGroup ID: `group.com.deborah.Ethicly`
  - Applied to: `Ethicly` and `Ethicly WidgetExtension`
  - Note: Provisioning profile warnings are expected (simulator doesn't need them)

---

## Remaining Steps 🔄

 - [x] **Step 5**: Build Quote model and static quote array in shared framework
  - Create `Quote` struct with `text`, `author` (optional), and `source` (optional) properties
  - Create array of ethical quotes
  - Make accessible to both app and widget targets
  - Note: `author` and `source` fields are `String?` (optional) where unknown

- [ ] **Step 6**: Build QuoteManager utility in shared framework
  - Track first-launch date in shared UserDefaults (using AppGroup)
  - Calculate days elapsed since first launch
  - Implement quote rotation logic: `quoteIndex = daysElapsed % quoteCount`
  - Handle local timezone correctly

- [ ] **Step 7**: Build Widget Extension UI and TimelineProvider
  - Create `TimelineProvider` for daily refresh at midnight local time
  - Build SwiftUI widget UI to display current quote
  - Configure widget to use `QuoteManager` from shared framework

- [ ] **Step 8**: Build main app UI
  - Simple SwiftUI view displaying current day's quote
  - Display author attribution
  - Use `QuoteManager` from shared framework

- [ ] **Step 8a**: Add the widget as a user-visible feature to the main app plan
  - Include the widget in the app’s feature checklist
  - Keep widget work tracked alongside the main app work
  - Ensure the widget and main app remain aligned on the daily quote experience

- [ ] **Step 9**: Test on simulator
  - Test quote rotation with different dates
  - Test widget refresh at midnight

- [ ] **Step 10**: Test widget on home screen
  - Add widget to home screen/lock screen
  - Verify daily updates

---

## Notes & Considerations

- **Bundle Identifier**: `com.deborah.Ethicly`
- **App Group**: `group.com.deborah.Ethicly` (shared between app and widget)
- **Quote Count**: Starting with 50 quotes (expandable)
- **Update Timing**: Midnight in user's local timezone
- **Quote Rotation**: Sequential from first app launch date
- **Framework**: Using shared `EthicsShared` framework to avoid code duplication
