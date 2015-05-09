//
//  momPost.h
//  mothersDay
//
//  Created by Patrick Wilson on 5/9/15.
//  Copyright (c) 2015 Patrick Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




@interface momPost : NSObject

@property (strong, nonatomic) NSString *messageContents;
@property (strong, nonatomic) NSString *posterName;
@property (strong, nonatomic) UIImage *posterImage;

@end

