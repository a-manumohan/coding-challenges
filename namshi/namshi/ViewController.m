//
//  ViewController.m
//  namshi
//
//  Created by Manu Mohan A on 2014/12/30.
//  Copyright (c) 2014 namshi. All rights reserved.
//

#import "ViewController.h"
#import "NetworkManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NetworkManager fetchProductsFrom:0 count:10 :^(NSArray *products) {
        NSLog(@"%@",products);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
