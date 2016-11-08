//
//  UserModel.h
//  TemplateiOS
//
//  Created by PintaWebWare on 08.11.16.
//  Copyright © 2016 PintaWebWare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EasyMapping/EasyMapping.h>

@interface UserModel : EKObjectModel

@property(nonatomic)       NSInteger userId;
@property(weak, nonatomic) NSString *name;
@property(weak, nonatomic) NSString *surname;
@property(nonatomic)       NSInteger age;

+ (instancetype)userWithDictionary:(NSDictionary *)JSONDictionary;

@end
