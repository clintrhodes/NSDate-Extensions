//
//  NSDate+Extensions.swift
//
//  Created by Clint Rhodes on 4/18/16.
//  Inspired by Erica Sadun's NSDate-Extensions (https://github.com/erica/NSDate-Extensions)
//

import Foundation

let second = 1
let minuteAsSeconds = 60
let hourAsSeconds = 3600
let dayAsSeconds = 86400
let weekAsSeconds = 604800
let yearAsSeconds = 31556926
let componentFlags: NSCalendarUnit = [.Year,
                                      .Month,
                                      .Day,
                                      .WeekOfYear,
                                      .Hour,
                                      .Minute,
                                      .Second,
                                      .Weekday,
                                      .WeekdayOrdinal]


/// Class level extension methods
public extension NSDate {
    class func currentCalendar() -> NSCalendar {
        return NSCalendar.autoupdatingCurrentCalendar()
    }
    
    /**
     Determines the next day based on current date
     
     - Returns: NSDate
     */
    class func tomorrow() -> NSDate {
        return NSDate().addDays(1)
    }
    
    /**
     Determines the previous day based on current date
     
     - Returns: NSDate
     */
    class func yesterday() -> NSDate {
        return NSDate().subtractDays(1)
    }
    
    /**
     Determines the ned weekday based on current date
     
     - Returns: NSDate
     */
    class func nextWeekday() -> NSDate {
        return NSDate().addWeekdays(1)
    }
    
    /**
     Determines the previous weekday based on current date
     
     - Returns: NSDate
     */
    class func previousWeekday() -> NSDate {
        return NSDate().subtractWeekdays(1)
    }
    
    /**
     Determines the date for any number of days in the future
     
     - Parameters:
         - days: The number of days in the future

     - Returns: NSDate
     */
    class func daysFromNow(days: Int) -> NSDate {
        return NSDate().addDays(days)
    }
    
    /**
     Determines the date for any number of days in the past
     
     - Parameters:
        - days: The number of days in the past
     
     - Returns: NSDate
     */
    class func daysBeforeNow(days: Int) -> NSDate {
        return NSDate().subtractDays(days)
    }
    
    /**
     Determines the date for any number of hours in the future
     
     - Parameters:
        - hours: The number of hours in the future
     
     - Returns: NSDate
     */
    class func hoursFromNow(hours: Int) -> NSDate {
        return NSDate(timeIntervalSinceReferenceDate:
            NSDate().timeIntervalSinceReferenceDate + Double(hourAsSeconds) * Double(hours))
    }
    
    /**
     Determines the date for any number of hours in the past
     
     - Parameters:
        - hours: The number of hours in the past
     
     - Returns: NSDate
     */
    class func hoursBeforeNow(hours: Int) -> NSDate {
        return NSDate(timeIntervalSinceReferenceDate:
            NSDate().timeIntervalSinceReferenceDate - Double(hourAsSeconds) * Double(hours))
    }
    
    /**
     Determines the date for any number of minutes in the future
     
     - Parameters:
        - minutes: The number of minutes in the future
     
     - Returns: NSDate
     */
    class func minutesFromNow(minutes: Int) -> NSDate {
        return NSDate(timeIntervalSinceReferenceDate:
            NSDate().timeIntervalSinceReferenceDate + Double(minuteAsSeconds) * Double(minutes))
    }
    
    /**
     Determines the date for any number of minutes in the past
     
     - Parameters:
        - minutes: The number of minutes in the past
     
     - Returns: NSDate
     */
    class func minutesBeforeNow(minutes: Int) -> NSDate {
        return NSDate(timeIntervalSinceReferenceDate:
            NSDate().timeIntervalSinceReferenceDate - Double(minuteAsSeconds) * Double(minutes))
    }
    
    /**
     Determines the date for any number of seconds in the future
     
     - Parameters:
        - seconds: The number of seconds in the future
     
     - Returns: NSDate
     */
    class func secondsFromNow(seconds: Int) -> NSDate {
        return NSDate(timeIntervalSinceReferenceDate:
            NSDate().timeIntervalSinceReferenceDate + Double(seconds))
    }
    
    /**
     Determines the date for any number of seconds in the past
     
     - Parameters:
        - seconds: The number of seconds in the past
     
     - Returns: NSDate
     */
    class func secondsBeforeNow(seconds: Int) -> NSDate {
        return NSDate(timeIntervalSinceReferenceDate:
            NSDate().timeIntervalSinceReferenceDate - Double(seconds))
    }
        
    /**
     Determines the seconds between two dates
     
     - Parameters:
        - date1: The starting date
        - date2: The ending date
     
     - Returns: Int
     */
    class func secondsBetween(date1 date1: NSDate, date2: NSDate) -> Int {
        let components = NSCalendar.currentCalendar().components(
            NSCalendarUnit.Second, fromDate: date1, toDate: date2, options:[])
        return components.second
    }
    
    /**
     Determines the minutes between two dates
     
     - Parameters:
        - date1: The starting date
        - date2: The ending date
     
     - Returns: Int
     */
    class func minutesBetween(date1 date1: NSDate, date2: NSDate) -> Int {
        let components = NSCalendar.currentCalendar().components(
            NSCalendarUnit.Minute, fromDate: date1, toDate: date2, options: [])
        return components.minute
    }
    
    /**
     Determines the hours between two dates
     
     - Parameters:
        - date1: The starting date
        - date2: The ending date
     
     - Returns: Int
     */
    class func hoursBetween(date1 date1: NSDate, date2: NSDate) -> Int {
        let components = NSCalendar.currentCalendar().components(
            NSCalendarUnit.Hour, fromDate: date1, toDate: date2, options: [])
        return components.hour
    }
    
    /**
     Determines a tuple of the hours, minutes, and seconds between two dates
     
     - Parameters:
        - date1: The starting date
        - date2: The ending date
     
     - Returns: (Int, Int, Int)
     */
    class func hoursMinutesSecondsBetween(date1 date1: NSDate, date2: NSDate) -> (Int, Int, Int) {
        let seconds = abs(secondsBetween(date1: date1, date2: date2))
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    /**
     Determines the days between two dates
     
     - Parameters:
        - date1: The starting date
        - date2: The ending date
     
     - Returns: Int
     */
    class func daysBetween(date1 date1: NSDate, date2: NSDate) -> Int {
        let components = NSCalendar.currentCalendar().components(
            NSCalendarUnit.Day, fromDate: date1, toDate: date2, options: [])
        return components.day
    }
    
    /**
     Determines the weekdays between two dates
     
     - Parameters:
        - date1: The starting date
        - date2: The ending date
     
     - Returns: Int
     */
    class func weekdaysBetween(date1 date1: NSDate, date2: NSDate) -> Int {
        let bizDate1 = self.findNearestWeekday(date1, findIncrement: 1)
        let bizDate2 = self.findNearestWeekday(date2, findIncrement: -1)
        let days = daysBetween(date1: bizDate1, date2: bizDate2)
        var result = days / 7 * 5 + days % 7
        if bizDate2.weekday < bizDate1.weekday {
            result = result - 2
        }
        return result
    }
    
    /**
     Determines the weeks between two dates
     
     - Parameters:
        - date1: The starting date
        - date2: The ending date
     
     - Returns: Int
     */
    class func weeksBetween(date1 date1: NSDate, date2: NSDate) -> Int {
        let components = NSCalendar.currentCalendar().components(
												NSCalendarUnit.WeekOfYear, fromDate: date1, toDate: date2, options: [])
        return components.weekOfYear
    }
    
    /**
     Determines the months between two dates
     
     - Parameters:
        - date1: The starting date
        - date2: The ending date
     
     - Returns: Int
     */
    class func monthsBetween(date1 date1: NSDate, date2: NSDate) -> Int {
        let components = NSCalendar.currentCalendar().components(
            NSCalendarUnit.Month, fromDate: date1, toDate: date2, options: [])
        return components.month
    }
    
    /**
     Determines the years between two dates
     
     - Parameters:
        - date1: The starting date
        - date2: The ending date
     
     - Returns: Int
     */
    class func yearsBetween(date1 date1: NSDate, date2: NSDate) -> Int {
        let components = NSCalendar.currentCalendar().components(
            NSCalendarUnit.Year, fromDate: date1, toDate: date2, options: [])
        return components.year
    }
    
}



/// Instance extension methods
public extension NSDate {
    /**
     Determines the equality of two dates if time is not considered
     
     - Parameters:
        - date: The date to compare to instance
     
     - Returns: Bool
     */
    func isEqualToDateIgnoringTime(date: NSDate) -> Bool {
        let components1 = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        let components2 = NSDate.currentCalendar().components(componentFlags, fromDate: date)
        
        return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day))
    }
    
    /**
     Determines if an instance of NSDate is equal to the current date
     
     - Returns: Bool
     */
    func isToday() -> Bool {
        return self.isEqualToDateIgnoringTime(NSDate())
    }
    
    /**
     Determines if an instance of NSDate is equal to tomorrow's date
     
     - Returns: Bool
     */
    func isTomorrow() -> Bool {
        return self.isEqualToDateIgnoringTime(NSDate.tomorrow())
    }
    
    /**
     Determines if an instance of NSDate is equal to the yesterday's date
     
     - Returns: Bool
     */
    func isYesterday() -> Bool {
        return self.isEqualToDateIgnoringTime(NSDate.yesterday())
    }
    
    /**
     Determines if an instance of NSDate is within the current week
     
     - Returns: Bool
     */
    func isThisWeek() -> Bool {
        return self.isSameWeekAsDate(NSDate())
    }
    
    /**
     Determines if an instance of NSDate is within the next week
     
     - Returns: Bool
     */
    func isNextWeek() -> Bool {
        let newDate = NSDate(timeIntervalSinceReferenceDate:
            NSDate().timeIntervalSinceReferenceDate + Double(weekAsSeconds))
        return self.isSameWeekAsDate(newDate)
    }

    /**
     Determines if an instance of NSDate is within the past week
     
     - Returns: Bool
     */
    func isLastWeek() -> Bool {
        let newDate = NSDate(timeIntervalSinceReferenceDate:
            NSDate().timeIntervalSinceReferenceDate - Double(weekAsSeconds))
        return self.isSameWeekAsDate(newDate)
    }
    
    /**
     Determines if an instance of NSDate is within the current month
     
     - Returns: Bool
     */
    func isThisMonth() -> Bool {
        return self.isSameMonthAsDate(NSDate())
    }
    
    /**
     Determines if an instance of NSDate is within the next month
     
     - Returns: Bool
     */
    func isNextMonth() -> Bool {
        return self.isSameMonthAsDate(NSDate().addMonths(1))
    }
    
    /**
     Determines if an instance of NSDate is within the previous month
     
     - Returns: Bool
     */
    func isLastMonth() -> Bool {
        return self.isSameMonthAsDate(NSDate().subtractMonths(1))
    }

    /**
     Determines if an instance of NSDate is within the current year
     
     - Returns: Bool
     */
    func isThisYear() -> Bool {
        return self.isSameYearAsDate(NSDate())
    }
    
    /**
     Determines if an instance of NSDate is within the next year
     
     - Returns: Bool
     */
    func isNextYear() -> Bool {
        let components1 = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        let components2 = NSDate.currentCalendar().components(componentFlags, fromDate: NSDate())
        
        return (components1.year == (components2.year + 1))
    }
    
    /**
     Determines if an instance of NSDate is within the previous year
     
     - Returns: Bool
     */
    func isLastYear() -> Bool {
        let components1 = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        let components2 = NSDate.currentCalendar().components(componentFlags, fromDate: NSDate())
        
        return (components1.year == (components2.year - 1))
    }
    
    /**
     Determines if a date is in the same week
     
     - Parameters:
        - date: The date to compare to instance
     
     - Returns: Bool
     */
    func isSameWeekAsDate(date: NSDate) -> Bool {
        let components1 = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        let components2 = NSDate.currentCalendar().components(componentFlags, fromDate: date)
        
        if components1.weekOfYear != components2.weekOfYear {
            return false
        }
        
        return (abs(Int(self.timeIntervalSinceDate(date))) < weekAsSeconds)
    }
    
    /**
     Determines if a date is in the same week
     
     - Parameters:
        - date: The date to compare to instance
     
     - Returns: Bool
     */
    func isSameMonthAsDate(date: NSDate) -> Bool {
        let components1 = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        let components2 = NSDate.currentCalendar().components(componentFlags, fromDate: date)
        
        return ((components1.month == components2.month) &&
            (components1.year == components2.year))
    }
    
    /**
     Determines if a date is in the same year
     
     - Parameters:
        - date: The date to compare to instance
     
     - Returns: Bool
     */
    func isSameYearAsDate(date: NSDate) -> Bool {
        let components1 = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        let components2 = NSDate.currentCalendar().components(componentFlags, fromDate: date)
        
        return (components1.year == components2.year)
    }
    
    /**
     Determines if the provided date is an earlier point in time than instance
     
     - Parameters:
        - date: The date to compare to instance
     
     - Returns: Bool
     */
    func isEarlierThanDate(date: NSDate) -> Bool {
        return (self.compare(date) == NSComparisonResult.OrderedAscending)
    }
    
    /**
     Determines if the provided date is a later point in time than instance
     
     - Parameters:
        - date: The date to compare to instance
     
     - Returns: Bool
     */
    func isLaterThanDate(date: NSDate) -> Bool {
        return (self.compare(date) == NSComparisonResult.OrderedDescending)
    }
    
    /**
     Determines if the instance of NSDate is in the future relative to today
     
     - Returns: Bool
     */
    func isInFuture() -> Bool {
        return self.isLaterThanDate(NSDate())
    }
    
    /**
     Determines if the instance of NSDate is in the past relative to today
     
     - Returns: Bool
     */
    func isInPast() -> Bool {
        return self.isEarlierThanDate(NSDate())
    }
    
    /**
     Determines if the instance of NSDate falls on a weekend
     
     - Returns: Bool
     */
    func isWeekend() -> Bool {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        if components.weekday == 1 || components.weekday == 7 {
            return true
        }
        return false
    }
    
    /**
     Determines if the instance of NSDate falls on a weekday
     
     - Returns: Bool
     */
    func isWeekday() -> Bool {
        return !isWeekend()
    }
    
    /**
     Determines the date by adding the specified number of years
     
     - Parameters:
        - years: The number of years to add to instance
     
     - Returns: NSDate
     */
    func addYears(years: Int) -> NSDate {
        return self.addComponentsToDate(years: years)
    }
    
    /**
     Determines the date by subtracting the specified number of years
     
     - Parameters:
        - years: The number of years to subtract to instance
     
     - Returns: NSDate
     */
    func subtractYears(years: Int) -> NSDate {
        return self.addComponentsToDate(years: -years)
    }
    
    /**
     Determines the date by adding the specified number of months
     
     - Parameters:
        - months: The number of months to add to instance
     
     - Returns: NSDate
     */
    func addMonths(months: Int) -> NSDate {
        return self.addComponentsToDate(months: months)
    }
    
    /**
     Determines the date by subtracting the specified number of months
     
     - Parameters:
        - months: The number of months to subtract to instance
     
     - Returns: NSDate
     */
    func subtractMonths(months: Int) -> NSDate {
        return self.addComponentsToDate(months: -months)
    }
    
    /**
     Determines the date by adding the specified number of weekdays
     
     - Parameters:
        - days: The number of weekdays to add to instance
     
     - Returns: NSDate
     */
    func addWeekdays(days: Int) -> NSDate {
        // This is a fuzzy business day function; we don't account for individual holidays
        guard days > 0 else { return self.subtractWeekdays(abs(days)) }
        
        var newDate = NSDate.findNearestWeekday(self, findIncrement: 1)
        newDate = newDate.addDays((days / 5 * 7) + days % 5)
        if newDate.isWeekend() {
            newDate = newDate.addDays(2)
        }
        return newDate
    }
    
    /**
     Determines the date by subtracting the specified number of weekdays
     
     - Parameters:
        - days: The number of weekdays to subtract to instance
     
     - Returns: NSDate
     */
    func subtractWeekdays(days: Int) -> NSDate {
        // This is a fuzzy business day function; we don't account for individual holidays
        guard days > 0 else { return self.addWeekdays(abs(days)) }
        
        var newDate = NSDate.findNearestWeekday(self, findIncrement: -1)
        newDate = newDate.subtractDays((days / 5 * 7) + days % 5)
        if newDate.isWeekend() {
            newDate = newDate.subtractDays(2)
        }
        return newDate
    }
    
    /**
     Determines the date by adding the specified number of days
     
     - Parameters:
        - days: The number of days to add to instance
     
     - Returns: NSDate
     */
    func addDays(days: Int) -> NSDate {
        return self.addComponentsToDate(days: days)
    }
    
    /**
     Determines the date by subtracting the specified number of days
     
     - Parameters:
        - days: The number of days to subtract to instance
     
     - Returns: NSDate
     */
    func subtractDays(days: Int) -> NSDate {
        return self.addComponentsToDate(days: -days)
    }
    
    /**
     Determines the date by adding the specified number of hours
     
     - Parameters:
        - hours: The number of hours to add to instance
     
     - Returns: NSDate
     */
    func addHours(hours: Int) -> NSDate {
        return self.addComponentsToDate(hours: hours)
    }
    
    /**
     Determines the date by subtracting the specified number of hours
     
     - Parameters:
        - hours: The number of hours to subtract to instance
     
     - Returns: NSDate
     */
    func subtractHours(hours: Int) -> NSDate {
        return self.addComponentsToDate(hours: -hours)
    }
    
    /**
     Determines the date by adding the specified number of minutes
     
     - Parameters:
        - minutes: The number of minutes to add to instance
     
     - Returns: NSDate
     */
    func addMinutes(minutes: Int) -> NSDate {
        return self.addComponentsToDate(minutes: minutes)
    }
    
    /**
     Determines the date by subtracting the specified number of minutes
     
     - Parameters:
        - minutes: The number of minutes to subtract to instance
     
     - Returns: NSDate
     */
    func subtractMinutes(minutes: Int) -> NSDate {
        return self.addComponentsToDate(minutes: -minutes)
    }
    
    /**
     Determines the date by adding the specified number of seconds
     
     - Parameters:
        - seconds: The number of seconds to add to instance
     
     - Returns: NSDate
     */
    func addSeconds(seconds: Int) -> NSDate {
        return self.addComponentsToDate(seconds: seconds)
    }
    
    /**
     Determines the date by subtracting the specified number of seconds
     
     - Parameters:
        - seconds: The number of seconds to subtract to instance
     
     - Returns: NSDate
     */
    func subtractSeconds(seconds: Int) -> NSDate {
        return self.addComponentsToDate(seconds: -seconds)
    }
    
    /**
     Determines the start of the day by setting time to the stroke of midnight for instance
     
     - Returns: NSDate
     */
    func startOfDay() -> NSDate {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        components.hour = 0
        components.minute = 0
        components.second = 0
        return NSDate.currentCalendar().dateFromComponents(components)!
    }
    
    /**
     Determines the end of the day by setting time to the just before midnight for instance
     
     - Returns: NSDate
     */
    func endOfDay() -> NSDate {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        components.hour = 23
        components.minute = 59
        components.second = 59
        return NSDate.currentCalendar().dateFromComponents(components)!
    }
    
    /**
     Determines date rounded to the nearest full minute of instance
     
     - Returns: NSDate
     */
    func toNearestMinute() -> NSDate {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        components.minute = components.minute + (components.second > 30 ? 1 : 0)
        components.second = 0
        return NSDate.currentCalendar().dateFromComponents(components)!
    }
    
    /**
     Determines the date rounded to nearest full hour of instance
     
     - Returns: NSDate
     */
    func toNearestHour() -> NSDate {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        components.hour = components.hour + (components.minute > 30 ? 1 : 0)
        components.minute = 0
        components.second = 0
        return NSDate.currentCalendar().dateFromComponents(components)!
    }
    
    /**
     Determines the start of the week

     - Parameters:
        - useIso8601: Set this value if start of week needs to follow ISO 8601 standard (Monday is first day of week)
     
     - Returns: NSDate
     */
    func startOfWeek(useIso8601: Bool = false) -> NSDate {
        // perhaps we can get 8601 by locale?
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        var dayDiff = components.weekday - (useIso8601 ? 2 : 1)
        if dayDiff < 0 { dayDiff = 6 }
        return self.subtractDays(dayDiff).startOfDay()
    }

    /**
     Format a date using the provided styles
     
     - Parameters:
        - dateStyle: date style to use for formatting
        - timeStyle: time style to user for formatting
     
     - Returns: String
     */
    func stringWithDateStyle(dateStyle: NSDateFormatterStyle,
                             timeStyle: NSDateFormatterStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.stringFromDate(self)
    }
    
    /**
     Format a date using the provided string format
     
     - Parameters:
        - format: string containing format
     
     - Returns: String
     */
    func stringWithFormat(format: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
    
    /**
     Format a date using the short styles for date and time
     
     - Returns: String
     */
    var shortString: String {
        return stringWithDateStyle(NSDateFormatterStyle.ShortStyle,
                                   timeStyle: NSDateFormatterStyle.ShortStyle)
    }
    
    /**
     Format a date using the short style for date
     
     - Returns: String
     */
    var shortDateString: String {
        return stringWithDateStyle(NSDateFormatterStyle.ShortStyle,
                                   timeStyle: NSDateFormatterStyle.NoStyle)
    }
    
    /**
     Format a date using the short style for time
     
     - Returns: String
     */
    var shortTimeString: String {
        return stringWithDateStyle(NSDateFormatterStyle.NoStyle,
                                   timeStyle: NSDateFormatterStyle.ShortStyle)
    }
    
    /**
     Format a date using the medium styles for date and time
     
     - Returns: String
     */
    var mediumString: String {
        return stringWithDateStyle(NSDateFormatterStyle.MediumStyle,
                                   timeStyle: NSDateFormatterStyle.MediumStyle)
    }
    
    /**
     Format a date using the medium style for date
     
     - Returns: String
     */
    var mediumDateString: String {
        return stringWithDateStyle(NSDateFormatterStyle.MediumStyle,
                                   timeStyle: NSDateFormatterStyle.NoStyle)
    }
    
    /**
     Format a date using the medium style for time
     
     - Returns: String
     */
    var mediumTimeString: String {
        return stringWithDateStyle(NSDateFormatterStyle.NoStyle,
                                   timeStyle: NSDateFormatterStyle.MediumStyle)
    }
    
    /**
     Format a date using the long styles for date and time
     
     - Returns: String
     */
    var longString: String {
        return stringWithDateStyle(NSDateFormatterStyle.LongStyle,
                                   timeStyle: NSDateFormatterStyle.LongStyle)
    }
    
    /**
     Format a date using the long style for date
     
     - Returns: String
     */
    var longDateString: String {
        return stringWithDateStyle(NSDateFormatterStyle.LongStyle,
                                   timeStyle: NSDateFormatterStyle.NoStyle)
    }
    
    /**
     Format a date using the long style for time
     
     - Returns: String
     */
    var longTimeString: String {
        return stringWithDateStyle(NSDateFormatterStyle.NoStyle,
                                   timeStyle: NSDateFormatterStyle.LongStyle)
    }
    
    /**
     Format a date using the ISO 8601 time format
     
     - Returns: String
     */
    var iso8601String: String {
        let dateFormatter = NSDateFormatter()
        let enUSPosixLocale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter.stringFromDate(self)
    }
    
    /**
     Format a date using the ISO 8601 time format and formatting that is file-system safe
     
     - Returns: String
     */
    var iso8601ForFilesString: String {
        return iso8601String.stringByReplacingOccurrencesOfString("-", withString: "")
            .stringByReplacingOccurrencesOfString(":", withString: "")
    }
    
    /**
     Returns the date component indicating the nearest hour from instance
     
     - Returns: Int
     */
    var nearestHour: Int {
        let newDate = NSDate(timeIntervalSinceReferenceDate:
            NSDate.timeIntervalSinceReferenceDate() + Double(minuteAsSeconds) * Double(30))
        let components = NSDate.currentCalendar().components(NSCalendarUnit.Hour, fromDate: newDate)
        return components.hour
    }
    
    /**
     Returns the date component indicating the hour of instance
     
     - Returns: Int
     */
    var hour: Int {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        return components.hour
    }
    
    /**
     Returns the date component indicating the minute of instance
     
     - Returns: Int
     */
    var minute: Int {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        return components.minute
    }
    
    /**
     Returns the date component indicating the seconds of instance
     
     - Returns: Int
     */
    var seconds: Int {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        return components.second
    }
    
    /**
     Returns the date component indicating the day of instance
     
     - Returns: Int
     */
    var day: Int {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        return components.day
    }
    
    /**
     Returns the date component indicating the month of instance
     
     - Returns: Int
     */
    var month: Int {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        return components.month
    }
    
    /**
     Returns the date component indicating the week of instance
     
     - Returns: Int
     */
    var week: Int {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        return components.weekOfYear
    }
    
    /**
     Returns the date component indicating the weekday of instance
     
     - Returns: Int
     */
    var weekday: Int {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        return components.weekday
    }
    
    /**
     Returns the date component indicating the day of week of instance
     
     - Returns: String
     */
    var dayOfWeek: String {
        return stringWithFormat("EEEE")
    }
    
    /**
     Returns the date component indicating the day of the month of instance
     
     - Returns: Int
     */
    var dayOfMonth: Int {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        return components.weekdayOrdinal
    }
    
    /**
     Returns the date component indicating the year of instance
     
     - Returns: Int
     */
    var year: Int {
        let components = NSDate.currentCalendar().components(componentFlags, fromDate: self)
        return components.year
    }
}



/// Private methods for internal use
private extension NSDate {
    private func addComponentsToDate(seconds seconds: Int = 0,
                                             minutes: Int = 0,
                                             hours: Int = 0,
                                             days: Int = 0,
                                             weeks: Int = 0,
                                             months: Int = 0,
                                             years: Int = 0) -> NSDate {
        let components = NSDateComponents()
        components.second = seconds
        components.minute = minutes
        components.hour = hours
        components.day = days
        components.weekOfYear = weeks
        components.month = months
        components.year = years
        return NSCalendar.currentCalendar().dateByAddingComponents(
            components, toDate: self, options: [])!
    }
    
    private class func findNearestWeekday(date: NSDate, findIncrement: Int) -> NSDate {
        var newDate = date
        while newDate.isWeekend() {
            newDate = newDate.addDays(findIncrement)
        }
        return newDate
    }
}