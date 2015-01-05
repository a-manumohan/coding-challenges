//
//  ProductDetailsViewController.m
//  namshi
//
//  Created by Manu Mohan A on 2015/01/05.
//  Copyright (c) 2015 namshi. All rights reserved.
//

#import "ProductDetailsViewController.h"

@interface ProductDetailsViewController (){
    __weak IBOutlet UIWebView *productWebView;
}

@end

@implementation ProductDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",self.product.productPage);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.product.productPage]];
    [productWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
