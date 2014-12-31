//
//  Product.h
//  namshi
//
//  Created by Manu Mohan A on 2014/12/31.
//  Copyright (c) 2014 namshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Product : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * sku;
@property (nonatomic, retain) NSString * productName;
@property (nonatomic, retain) NSString * brandName;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * productPage;

@end
