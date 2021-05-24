#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber > 0 && monthNumber <= 12) {
//        NSDateFormatter *dateFormat = [NSDateFormatter new];
//        NSString *monthFullName = [dateFormat.monthSymbols objectAtIndex: monthNumber - 1];
//        return monthFullName;
//    }
//        NSArray *months = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
//        return months[monthNumber - 1];
//    }
        
    
        return [NSDateFormatter new].monthSymbols[monthNumber - 1];
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *formatOfDate = [NSDateFormatter new];
    formatOfDate.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    return [calendar component: NSCalendarUnitDay fromDate: [formatOfDate dateFromString: date]];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *customDateFormat = [NSDateFormatter new];
    customDateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"ru_RU"];
    customDateFormat.dateFormat = @"E";
    NSLog(@"%@", [customDateFormat stringFromDate: date] );
    return [customDateFormat stringFromDate: date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger dateOfWeek = [calendar component: NSCalendarUnitWeekOfYear fromDate: date];
    NSInteger currWeek = [calendar component: NSCalendarUnitWeekOfYear fromDate: [NSDate now]];
    if (dateOfWeek == currWeek) {
        return YES;
    } else {
        return NO;
    }
//    return NO;
}

@end
