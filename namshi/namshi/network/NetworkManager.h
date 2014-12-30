//
//  NetworkManager.h
//  namshi
//
//  Created by Manu Mohan A on 2014/12/30.
//  Copyright (c) 2014 namshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

+(void)fetchProductsFrom:(NSInteger)from count:(NSInteger)count :(void (^) (NSArray *products))completionBlock failure:(void(^)(NSError *error))failureBlock;

@end
