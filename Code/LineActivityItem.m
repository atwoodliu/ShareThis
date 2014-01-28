//
//  LineActivityItem.m
//  shareShopping
//
//  Created by Mac on 14/1/27.
//  Copyright (c) 2014年 EZTABLE. All rights reserved.
//

#import "LineActivityItem.h"
#import "LineService.h"

@implementation LineActivityItem
- (NSString *)activityType
{
    return LineActivity;
}

- (NSString *)activityTitle
{
    return @"LINE";
}

- (UIImage *)activityImage
{
        return [UIImage imageNamed:@"LINEActivityIcon.png"];
}
- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    // Need to check if image is nil
    // If image item is nil then make a dictionary with only url and title
    // url and title will never be nil as they will just be empty strings if nil was passed in
    NSDictionary *dict = [[NSDictionary alloc] initWithObjects:activityItems forKeys:([activityItems count] == 3) ? @[@"title",@"url", @"image"] : @[@"title",@"url"]];
    [LineService shareWithParams:dict onViewController:nil];
}
@end
