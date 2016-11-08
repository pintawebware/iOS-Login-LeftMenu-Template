//
//  RequestMapManager.h
//  TemplateiOS
//
//  Created by PintaWebWare on 08.11.16.
//  Copyright © 2016 PintaWebWare. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MappingCompletionBlock)(NSMutableArray *array, NSDictionary *dictionary, id object);

@interface RequestMapManager : NSObject

+ (void)loginWithEmail:(NSString *)email password:(NSString *)password completion:(MappingCompletionBlock)completion;

@end
