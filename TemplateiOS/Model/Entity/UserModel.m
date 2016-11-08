//
//  UserModel.m
//  TemplateiOS
//
//  Created by PintaWebWare on 08.11.16.
//  Copyright © 2016 PintaWebWare. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (EKObjectMapping *)objectMapping{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        [mapping mapKeyPath:@"id" toProperty:@"userId"];
        [mapping mapKeyPath:@"name" toProperty:@"name"];
        [mapping mapKeyPath:@"surname" toProperty:@"surname"];
        
    }];
}

+ (instancetype)userWithDictionary:(NSDictionary *)JSONDictionary{
    return [UserModel objectWithProperties:JSONDictionary];
}

@end
