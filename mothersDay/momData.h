//
//  momData.h
//  mothersDay
//
//  Created by Patrick Wilson on 5/9/15.
//  Copyright (c) 2015 Patrick Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "momPost.h"

@interface momData : NSObject

+ (momPost*)getMomPostForDay:(NSInteger)dayOfYear;
+ (NSString*)getRandomPicURLFor:(NSString*)poster;

@end
