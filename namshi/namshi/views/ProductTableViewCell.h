//
//  ProductTableViewCell.h
//  namshi
//
//  Created by Manu Mohan A on 2015/01/05.
//  Copyright (c) 2015 namshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productDescriptionLabel;

@end
