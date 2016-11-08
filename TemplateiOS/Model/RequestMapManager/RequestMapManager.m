//
//  RequestMapManager.m
//  TemplateiOS
//
//  Created by PintaWebWare on 08.11.16.
//  Copyright © 2016 PintaWebWare. All rights reserved.
//

#import "RequestMapManager.h"
#import "WebService.h"
#import "UserModel.h"


@implementation RequestMapManager

+ (void)loginWithEmail:(NSString *)email password:(NSString *)password completion:(MappingCompletionBlock)completion{
    [[WebService sharedService] loginWithEmail:email password:password completion:^(NSError *error, NSArray *array, NSDictionary *dictionary) {
        if(!error){
            UserModel *model = [UserModel userWithDictionary:dictionary];
            completion(nil, nil, model);
        }
    }];
}

@end
