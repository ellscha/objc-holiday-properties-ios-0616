//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [self holiday:@"Christmas Day" isInSeason:@"winter"];
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    return self.database[season];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    return self.database[season][holiday];
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    BOOL isItInSeason = NO;
    for (NSString *holidayStrings in self.database[season]) {
        if ([holiday isEqualToString: holidayStrings]) {
            isItInSeason = YES;
        }
    }
    return isItInSeason;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    BOOL isItInSeasonInHoliday = NO;
    for (NSString *supplies in self.database[season][holiday]) {
        if ([supply isEqualToString: supplies]) {
            isItInSeasonInHoliday = YES;
        }
    }
    return isItInSeasonInHoliday;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    NSMutableDictionary *databaseCopy = [self.database mutableCopy];
    NSMutableArray *emptyArray = [NSMutableArray new];
    [databaseCopy[season] setObject:emptyArray forKey:holiday ];
    
    self.database = databaseCopy;
    

}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    NSMutableDictionary *databaseCopy = [self.database mutableCopy];
    [databaseCopy[season][holiday] addObject:supply];
    
    self.database = databaseCopy;
    // no return
}

@end
