//
//  NetworkManager.m
//  namshi
//
//  Created by Manu Mohan A on 2014/12/30.
//  Copyright (c) 2014 namshi. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking/AFNetworking.h>


#define BASE_URL @"http://namshi-test.herokuapp.com/"
#define ENDPOINT_PRODUCTS @"products"

@implementation NetworkManager

+(void)fetchProductsFrom:(NSInteger
)from count:(NSInteger
)count :(void (^)(NSArray *))completionBlock failure:(void (^)(NSError *))failureBlock{
    NSDictionary *params = @{@"from":[NSNumber numberWithInteger:from], @"count":[NSNumber numberWithInteger:count]};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"%@%@",BASE_URL,ENDPOINT_PRODUCTS];
    
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];

    
}
@end
