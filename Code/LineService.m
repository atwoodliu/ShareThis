/* Copyright 2012 IGN Entertainment, Inc. */

#import "LineService.h"

static LineService *_manager;

NSString *const LineActivity =
@"LineActivity";

@implementation LineService

+ (LineService *)sharedManager
{
    if (!_manager) {
        _manager = [[LineService alloc] init];
    }
    return _manager;
}

+ (void)shareWithParams:(NSDictionary *)params onViewController:(UIViewController *)viewController
{
    [[LineService sharedManager] shareWithParams:params onViewController:viewController];
}

+ (BOOL)isLineInstalled{
    if ([[UIApplication sharedApplication] canOpenURL: [NSURL URLWithString:@"line://"]]) {
        return YES;
    }else{
        return NO;
    }
}
//- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
//{
//    [[controller presentingViewController] dismissModalViewControllerAnimated:YES];
//}

- (void)shareWithParams:(NSDictionary *)params onViewController:(UIViewController *)viewController
{
    NSString *content = [NSString stringWithFormat:@"%@：%@", [params objectForKey:@"title"], [params objectForKey:@"url"]];
    NSString *url = [NSString stringWithFormat:@"line://msg/text/%@", [content stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    //NSString *url = [NSString stringWithFormat:@"fb://messaging/compose?text=%@", [content stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:url]];

}

@end
