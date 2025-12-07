//
//  AppDelegate.m
//  EncodingTest
//
//  Created by Gregory Casamento on 12/5/25.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self encodeFormatters];
}

- (void)encodeFormatters {
    NSError *error = nil;
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    // Create and encode NSNumberFormatter
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:2];
    [numberFormatter setMinimumFractionDigits:2];
    [numberFormatter setMaximumIntegerDigits:10];
    [numberFormatter setMinimumIntegerDigits:1];
    [numberFormatter setGroupingSeparator:@","];
    [numberFormatter setDecimalSeparator:@"."];
    [numberFormatter setGroupingSize:3];
    [numberFormatter setUsesGroupingSeparator:YES];
    [numberFormatter setAlwaysShowsDecimalSeparator:NO];
    [numberFormatter setPercentSymbol:@"%"];
    [numberFormatter setPerMillSymbol:@"‰"];
    [numberFormatter setMinusSign:@"-"];
    [numberFormatter setPlusSign:@"+"];
    [numberFormatter setExponentSymbol:@"E"];
    [numberFormatter setCurrencySymbol:@"$"];
    [numberFormatter setCurrencyCode:@"USD"];
    [numberFormatter setInternationalCurrencySymbol:@"USD"];
    [numberFormatter setCurrencyGroupingSeparator:@","];
    [numberFormatter setCurrencyDecimalSeparator:@"."];
    [numberFormatter setLenient:NO];
    [numberFormatter setGeneratesDecimalNumbers:NO];
    [numberFormatter setRoundingMode:NSNumberFormatterRoundHalfEven];
    [numberFormatter setRoundingIncrement:@1];
    [numberFormatter setMultiplier:@1];
    [numberFormatter setFormatWidth:0];
    [numberFormatter setPaddingCharacter:@" "];
    [numberFormatter setPaddingPosition:NSNumberFormatterPadBeforePrefix];
    [numberFormatter setPositivePrefix:@""];
    [numberFormatter setPositiveSuffix:@""];
    [numberFormatter setNegativePrefix:@"-"];
    [numberFormatter setNegativeSuffix:@""];
    [numberFormatter setNotANumberSymbol:@"NaN"];
    [numberFormatter setNilSymbol:@""];
    [numberFormatter setZeroSymbol:nil];
    [numberFormatter setLocale:[NSLocale currentLocale]];
    [numberFormatter setUsesSignificantDigits:NO];
    [numberFormatter setMinimumSignificantDigits:1];
    [numberFormatter setMaximumSignificantDigits:6];
    
    NSString *numberFormatterPath = [documentsPath stringByAppendingPathComponent:@"NSNumberFormatter.archive"];
    NSData *numberFormatterData = [NSKeyedArchiver archivedDataWithRootObject:numberFormatter requiringSecureCoding:NO error:&error];
    if (numberFormatterData) {
        [numberFormatterData writeToFile:numberFormatterPath atomically:YES];
        NSLog(@"NSNumberFormatter encoded to: %@", numberFormatterPath);
    } else {
        NSLog(@"Error encoding NSNumberFormatter: %@", error);
    }
    
    // Create and encode NSDateFormatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [dateFormatter setCalendar:[NSCalendar currentCalendar]];
    [dateFormatter setLenient:NO];
    [dateFormatter setDoesRelativeDateFormatting:NO];
    [dateFormatter setAMSymbol:@"AM"];
    [dateFormatter setPMSymbol:@"PM"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setFormattingContext:NSFormattingContextStandalone];
    [dateFormatter setTwoDigitStartDate:[NSDate dateWithTimeIntervalSince1970:0]];
    [dateFormatter setDefaultDate:nil];
    [dateFormatter setEraSymbols:@[@"BC", @"AD"]];
    [dateFormatter setMonthSymbols:@[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"]];
    [dateFormatter setShortMonthSymbols:@[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"]];
    [dateFormatter setWeekdaySymbols:@[@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday"]];
    [dateFormatter setShortWeekdaySymbols:@[@"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat"]];
    [dateFormatter setQuarterSymbols:@[@"Q1", @"Q2", @"Q3", @"Q4"]];
    [dateFormatter setShortQuarterSymbols:@[@"Q1", @"Q2", @"Q3", @"Q4"]];
    [dateFormatter setGregorianStartDate:nil];
    
    NSString *dateFormatterPath = [documentsPath stringByAppendingPathComponent:@"NSDateFormatter.archive"];
    NSData *dateFormatterData = [NSKeyedArchiver archivedDataWithRootObject:dateFormatter requiringSecureCoding:NO error:&error];
    if (dateFormatterData) {
        [dateFormatterData writeToFile:dateFormatterPath atomically:YES];
        NSLog(@"NSDateFormatter encoded to: %@", dateFormatterPath);
    } else {
        NSLog(@"Error encoding NSDateFormatter: %@", error);
    }
    
    // Create and encode NSByteCountFormatter
    NSByteCountFormatter *byteCountFormatter = [[NSByteCountFormatter alloc] init];
    [byteCountFormatter setCountStyle:NSByteCountFormatterCountStyleFile];
    [byteCountFormatter setAllowsNonnumericFormatting:NO];
    [byteCountFormatter setIncludesUnit:NO];
    [byteCountFormatter setIncludesCount:NO];
    [byteCountFormatter setIncludesActualByteCount:YES];
    [byteCountFormatter setAdaptive:NO];
    [byteCountFormatter setZeroPadsFractionDigits:NO];
    [byteCountFormatter setFormattingContext:NSFormattingContextStandalone];
    [byteCountFormatter setAllowedUnits:NSByteCountFormatterUseGB];
    
    NSString *byteCountFormatterPath = [documentsPath stringByAppendingPathComponent:@"NSByteCountFormatter.archive"];
    NSData *byteCountFormatterData = [NSKeyedArchiver archivedDataWithRootObject:byteCountFormatter requiringSecureCoding:NO error:&error];
    if (byteCountFormatterData) {
        [byteCountFormatterData writeToFile:byteCountFormatterPath atomically:YES];
        NSLog(@"NSByteCountFormatter encoded to: %@", byteCountFormatterPath);
    } else {
        NSLog(@"Error encoding NSByteCountFormatter: %@", error);
    }
    
    // Create and encode NSDateComponentsFormatter
    NSDateComponentsFormatter *dateComponentsFormatter = [[NSDateComponentsFormatter alloc] init];
    [dateComponentsFormatter setUnitsStyle:NSDateComponentsFormatterUnitsStyleFull];
    [dateComponentsFormatter setAllowedUnits:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond];
    [dateComponentsFormatter setZeroFormattingBehavior:NSDateComponentsFormatterZeroFormattingBehaviorDefault];
    [dateComponentsFormatter setCalendar:[NSCalendar currentCalendar]];
    [dateComponentsFormatter setAllowsFractionalUnits:NO];
    [dateComponentsFormatter setMaximumUnitCount:0];
    [dateComponentsFormatter setCollapsesLargestUnit:NO];
    [dateComponentsFormatter setIncludesApproximationPhrase:NO];
    [dateComponentsFormatter setIncludesTimeRemainingPhrase:NO];
    [dateComponentsFormatter setFormattingContext:NSFormattingContextStandalone];
    
    NSString *dateComponentsFormatterPath = [documentsPath stringByAppendingPathComponent:@"NSDateComponentsFormatter.archive"];
    NSData *dateComponentsFormatterData = [NSKeyedArchiver archivedDataWithRootObject:dateComponentsFormatter requiringSecureCoding:NO error:&error];
    if (dateComponentsFormatterData) {
        [dateComponentsFormatterData writeToFile:dateComponentsFormatterPath atomically:YES];
        NSLog(@"NSDateComponentsFormatter encoded to: %@", dateComponentsFormatterPath);
    } else {
        NSLog(@"Error encoding NSDateComponentsFormatter: %@", error);
    }
    
    // Create and encode NSDateIntervalFormatter
    NSDateIntervalFormatter *dateIntervalFormatter = [[NSDateIntervalFormatter alloc] init];
    [dateIntervalFormatter setDateStyle:NSDateIntervalFormatterMediumStyle];
    [dateIntervalFormatter setTimeStyle:NSDateIntervalFormatterShortStyle];
    [dateIntervalFormatter setLocale:[NSLocale currentLocale]];
    [dateIntervalFormatter setCalendar:[NSCalendar currentCalendar]];
    [dateIntervalFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [dateIntervalFormatter setDateTemplate:@"yyyyMMdd"];
    
    NSString *dateIntervalFormatterPath = [documentsPath stringByAppendingPathComponent:@"NSDateIntervalFormatter.archive"];
    NSData *dateIntervalFormatterData = [NSKeyedArchiver archivedDataWithRootObject:dateIntervalFormatter requiringSecureCoding:NO error:&error];
    if (dateIntervalFormatterData) {
        [dateIntervalFormatterData writeToFile:dateIntervalFormatterPath atomically:YES];
        NSLog(@"NSDateIntervalFormatter encoded to: %@", dateIntervalFormatterPath);
    } else {
        NSLog(@"Error encoding NSDateIntervalFormatter: %@", error);
    }
    
    // Create and encode NSEnergyFormatter
    NSEnergyFormatter *energyFormatter = [[NSEnergyFormatter alloc] init];
    [energyFormatter setForFoodEnergyUse:YES];
    [energyFormatter setUnitStyle:NSFormattingUnitStyleMedium];
    NSNumberFormatter *energyNumberFormatter = [[NSNumberFormatter alloc] init];
    [energyNumberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [energyNumberFormatter setMaximumFractionDigits:2];
    [energyFormatter setNumberFormatter:energyNumberFormatter];
    
    NSString *energyFormatterPath = [documentsPath stringByAppendingPathComponent:@"NSEnergyFormatter.archive"];
    NSData *energyFormatterData = [NSKeyedArchiver archivedDataWithRootObject:energyFormatter requiringSecureCoding:NO error:&error];
    if (energyFormatterData) {
        [energyFormatterData writeToFile:energyFormatterPath atomically:YES];
        NSLog(@"NSEnergyFormatter encoded to: %@", energyFormatterPath);
    } else {
        NSLog(@"Error encoding NSEnergyFormatter: %@", error);
    }
    
    // Create and encode NSLengthFormatter
    NSLengthFormatter *lengthFormatter = [[NSLengthFormatter alloc] init];
    [lengthFormatter setForPersonHeightUse:NO];
    [lengthFormatter setUnitStyle:NSFormattingUnitStyleMedium];
    NSNumberFormatter *lengthNumberFormatter = [[NSNumberFormatter alloc] init];
    [lengthNumberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [lengthNumberFormatter setMaximumFractionDigits:2];
    [lengthFormatter setNumberFormatter:lengthNumberFormatter];
    
    NSString *lengthFormatterPath = [documentsPath stringByAppendingPathComponent:@"NSLengthFormatter.archive"];
    NSData *lengthFormatterData = [NSKeyedArchiver archivedDataWithRootObject:lengthFormatter requiringSecureCoding:NO error:&error];
    if (lengthFormatterData) {
        [lengthFormatterData writeToFile:lengthFormatterPath atomically:YES];
        NSLog(@"NSLengthFormatter encoded to: %@", lengthFormatterPath);
    } else {
        NSLog(@"Error encoding NSLengthFormatter: %@", error);
    }
    
    // Create and encode NSMassFormatter
    NSMassFormatter *massFormatter = [[NSMassFormatter alloc] init];
    [massFormatter setForPersonMassUse:NO];
    [massFormatter setUnitStyle:NSFormattingUnitStyleMedium];
    NSNumberFormatter *massNumberFormatter = [[NSNumberFormatter alloc] init];
    [massNumberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [massNumberFormatter setMaximumFractionDigits:2];
    [massFormatter setNumberFormatter:massNumberFormatter];
    
    NSString *massFormatterPath = [documentsPath stringByAppendingPathComponent:@"NSMassFormatter.archive"];
    NSData *massFormatterData = [NSKeyedArchiver archivedDataWithRootObject:massFormatter requiringSecureCoding:NO error:&error];
    if (massFormatterData) {
        [massFormatterData writeToFile:massFormatterPath atomically:YES];
        NSLog(@"NSMassFormatter encoded to: %@", massFormatterPath);
    } else {
        NSLog(@"Error encoding NSMassFormatter: %@", error);
    }
    
    NSLog(@"All formatters have been encoded to separate archive files in: %@", documentsPath);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
