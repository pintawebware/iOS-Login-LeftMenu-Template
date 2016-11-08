//
//  WebService.m
//  TemplateiOS
//
//  Created by PintaWebWare on 08.11.16.
//  Copyright © 2016 PintaWebWare. All rights reserved.
//

#import "WebService.h"

@implementation WebService

+ (WebService *)sharedService {
    static WebService *service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseUrl = [NSURL URLWithString:@"URL"];
        service = [[WebService alloc] initWithBaseURL:baseUrl];
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    });
    
    return service;
}

- (void)loginWithEmail:(NSString *)email password:(NSString *)password completion:(WebServiceCompletionBlock)completion{
    
    /*NSDictionary *param = @{
                            @"email" : email,
                            @"password" : password
                            };
    
    [self POST:@"URL" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(nil, nil, dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(error, nil, nil);
    }];*/
/*------------------------------------------------------------------------------------------------------------------------------------*/
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSDictionary *dic = @{
                              @"id" : @"5",
                              @"name" : @"Ignat",
                              @"surname" : @"Magnat",
                              @"age" : @"11"
                              };
        
        completion(nil, nil, dic);
    });
}

@end
