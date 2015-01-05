//
//  ViewController.m
//  namshi
//
//  Created by Manu Mohan A on 2014/12/30.
//  Copyright (c) 2014 namshi. All rights reserved.
//

#import "ViewController.h"
#import "NetworkManager.h"
#import "Product.h"
#import "ProductTableViewCell.h"
#import "ProductDetailsViewController.h"

@interface ViewController (){
    NSArray *_products;
    __weak IBOutlet UITableView *productsTableView;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self fetchProductsFrom:0 count:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - network calls 
- (void) fetchProductsFrom:(NSInteger)from count:(NSInteger)count{
    [NetworkManager fetchProductsFrom:from count:count :^(NSArray *products) {
        for (NSDictionary *prod in products) {
            Product *product = [Product MR_createEntity];
            product.id = [prod valueForKey:@"id"];
            product.sku = [prod valueForKey:@"sku"];
            product.productName = [prod valueForKey:@"brandName"];
            product.price = [prod valueForKey:@"price"];
            product.productPage = [prod valueForKey:@"prodPage"];
            
        }
        _products = [Product MR_findAll];
        [productsTableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - tableview delegate and datasource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _products != nil ? _products.count : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Product *product = [_products objectAtIndex:indexPath.row];
    ProductTableViewCell *productCell = (ProductTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"productstableviewcell"];
    productCell.productNameLabel.text = product.productName;
    return productCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - segue method
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowProductDetails"]){
        ProductDetailsViewController *productDetailsViewController = (ProductDetailsViewController *)segue.destinationViewController
        ;
        
    }
}

@end
