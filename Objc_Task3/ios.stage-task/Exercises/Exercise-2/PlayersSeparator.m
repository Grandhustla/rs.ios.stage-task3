#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if (ratingArray.count < 3) {
        return 0;
    }
    
    NSInteger countation = 0;
    NSInteger n = ratingArray.count;
    BOOL iLessJ, jLessK, iMoreJ, jMoreK, ascendRate, descenRate;
    
    for (int i = 0; i < n; i++) {
        for (int j = i+1; j < n; j++) {
            for (int k = j+1; k < n; k++) {
                
                iLessJ = ratingArray[i].intValue < ratingArray[j].intValue;
                jLessK = ratingArray[j].intValue < ratingArray[k].intValue;
                ascendRate = iLessJ && jLessK;
                
                iMoreJ = ratingArray[i].intValue > ratingArray[j].intValue;
                jMoreK = ratingArray[j].intValue > ratingArray[k].intValue;
                descenRate = iMoreJ && jMoreK;
                
                if (ascendRate || descenRate) { countation++; }
            }
        }
    }
    
    return countation;
}

@end
