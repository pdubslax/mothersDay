//
//  momData.m
//  mothersDay
//
//  Created by Patrick Wilson on 5/9/15.
//  Copyright (c) 2015 Patrick Wilson. All rights reserved.
//

#import "momData.h"
#import <Parse/Parse.h>


@implementation momData



+ (NSString*)getRandomPicURLFor:(NSString*)poster{
    if ([poster isEqualToString:@"Patrick"]) {
        PFQuery *picQuery = [PFQuery queryWithClassName:@"PatrickPics"];
        NSArray *objects = [picQuery findObjects];
        PFObject* test = [objects objectAtIndex:arc4random() % [objects count]];
        return [test objectForKey:@"picURLs"];
    }
    else if ([poster isEqualToString:@"Rose"]) {
        PFQuery *picQuery = [PFQuery queryWithClassName:@"RosePics"];
        NSArray *objects = [picQuery findObjects];
        PFObject* test = [objects objectAtIndex:arc4random() % [objects count]];
        return [test objectForKey:@"picURLs"];
    }
    else{
        PFQuery *picQuery = [PFQuery queryWithClassName:@"DanPics"];
        NSArray *objects = [picQuery findObjects];
        PFObject* test = [objects objectAtIndex:arc4random() % [objects count]];
        return [test objectForKey:@"picURLs"];
    }
}

+ (momPost*)getMomPostForDay:(NSInteger)dayOfYear{
    
    momPost *currentPost = [momPost new];
    while (true){
        PFQuery *quoteArray = [PFQuery queryWithClassName:@"Quotes"];
        [quoteArray whereKey:@"day" equalTo:[NSNumber numberWithInteger:arc4random()%365]];
        NSArray *objects = [quoteArray findObjects];
        if ([objects count]>0){
            PFObject* test = objects[0];
            currentPost.posterName = [test objectForKey:@"From"];
            currentPost.messageContents = [test objectForKey:@"Message"];
            
            
            currentPost.posterImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self getRandomPicURLFor:currentPost.posterName] ]]];
            
            return currentPost;
        }
        
    }
    
}

-(int) generateRandomNumberWithlowerBound:(int)lowerBound
                               upperBound:(int)upperBound
{
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    return rndValue;
}



@end
