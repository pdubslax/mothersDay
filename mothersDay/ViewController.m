//
//  ViewController.m
//  mothersDay
//
//  Created by Patrick Wilson on 5/9/15.
//  Copyright (c) 2015 Patrick Wilson. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+colorFromHexString.h"
#import "momData.h"
#import "momPost.h"
#import <Parse/Parse.h>

@interface ViewController ()


@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *quoteLabel;
@property (nonatomic, strong) momPost *quoteData;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *fromLabel;





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *colorArray = [[NSArray alloc] initWithObjects:@"3498db",@"1abc9c",@"9b59b6",@"e74c3c", nil];
    self.view.backgroundColor = [UIColor colorFromHexString:[colorArray objectAtIndex:arc4random() % [colorArray count]]];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger dayOfYear = [gregorian ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:[NSDate date]];
    self.quoteData = [momData getMomPostForDay:dayOfYear];
    
    [self loadSubviews];
    [self autoLayoutSubviews];
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    //[self viewDidLoad];
}

- (void)loadSubviews {
    
    
    //call for data here
    
    
    [self loadContentView];
    [self loadTextLabel];
    [self loadImageView];

}

- (void)loadContentView {
    CGRect frame = self.view.bounds;
    self.contentView = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:self.contentView];
}

- (void)loadImageView{
    self.imageView = [UIImageView new];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setImage:self.quoteData.posterImage];
    [self.contentView addSubview:self.imageView];
    self.imageView.clipsToBounds = YES;
}

- (void)loadTextLabel{
    self.quoteLabel = [UILabel new];
    self.quoteLabel.text = self.quoteData.messageContents;
    [self.quoteLabel setTextAlignment:NSTextAlignmentLeft];
    [self.quoteLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30]];
    [self.quoteLabel setMinimumScaleFactor:.2f];
    self.quoteLabel.adjustsFontSizeToFitWidth = YES;
    [self.quoteLabel setTextColor:[UIColor whiteColor]];
    self.quoteLabel.numberOfLines = 0;
    [self.contentView addSubview:self.quoteLabel];
    
    self.fromLabel = [UILabel new];
    self.fromLabel.text = [NSString stringWithFormat:@"From: %@",self.quoteData.posterName];
    [self.fromLabel setTextAlignment:NSTextAlignmentRight];
    [self.fromLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30]];
    [self.fromLabel setMinimumScaleFactor:.2f];
    self.fromLabel.adjustsFontSizeToFitWidth = YES;
    [self.fromLabel setTextColor:[UIColor whiteColor]];
    self.fromLabel.numberOfLines = 0;
    [self.contentView addSubview:self.fromLabel];
    
}





- (void)autoLayoutSubviews {
    for (UIView *view in self.contentView.subviews) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    // Label all views for autolayout
    NSDictionary *views = @{
                            @"quoteLabel"           :   self.quoteLabel,
                            @"imageView"            :   self.imageView,
                            @"fromLabel"            :   self.fromLabel,
                            };
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[fromLabel]-10-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[quoteLabel]-10-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-250-[quoteLabel]-5-[fromLabel]-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[imageView]-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[imageView]-[quoteLabel]" options:0 metrics:nil views:views]];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
