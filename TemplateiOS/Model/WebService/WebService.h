//
//  WebService.h
//  TemplateiOS
//
//  Created by PintaWebWare on 08.11.16.
//  Copyright © 2016 PintaWebWare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^WebServiceCompletionBlock)(NSError *error, NSArray *array, NSDictionary *dictionary);

@interface WebService : AFHTTPSessionManager

+ (WebService *)sharedService;

- (void)loginWithEmail:(NSString *)email password:(NSString *)password completion:(WebServiceCompletionBlock)completion;

@end
