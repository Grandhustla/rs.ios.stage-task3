#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *str1 = [NSMutableString stringWithString: string1];
    NSMutableString *str2 = [NSMutableString stringWithString: string2];
    NSMutableString *resultStr = [[NSMutableString alloc] initWithString: @""];
    
    while (str1.length != 0 || str2.length != 0) {
        
        if (str1.length == 0) {
            [resultStr appendString: str2];
            str2 = [NSMutableString stringWithString: @""];
            
        } else if (str2.length == 0) {
            [resultStr appendString: str1];
            str1 = [NSMutableString stringWithString: @""];
            
        } else {
            NSComparisonResult someResult = [[str1 substringToIndex: 1] compare: [str2 substringToIndex: 1]];
            
            if (someResult == NSOrderedAscending || someResult == NSOrderedSame) {
                [resultStr appendString: [str1 substringToIndex: 1]];
                str1 = [NSMutableString stringWithString: [str1 substringFromIndex: 1]];
            } else {
                [resultStr appendString: [str2 substringToIndex: 1]];
                str2 = [NSMutableString stringWithString: [str2 substringFromIndex: 1]];
            }
        }
    }
    NSLog(@"----- %@", resultStr);
    
    return resultStr;
}

@end
