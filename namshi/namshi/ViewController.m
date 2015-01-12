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

#define PRODUCT_COUNT 20

@interface ViewController (){
    NSArray *_products;
    BOOL loading;
    
    
    __weak IBOutlet UITableView *productsTableView;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self fetchProductsFrom:0 count:PRODUCT_COUNT];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - network calls 
- (void) fetchProductsFrom:(NSInteger)from count:(NSInteger)count{
    loading = YES;
    [NetworkManager fetchProductsFrom:from count:count :^(NSArray *products) {
        NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
        unsigned long row = _products.count;
        for (NSDictionary *prod in products) {
            Product *product = [Product MR_createEntity];
            product.id = [prod valueForKey:@"id"];
            product.sku = [prod valueForKey:@"sku"];
            product.productName = [prod valueForKey:@"productName"];
            product.brandName = [prod valueForKey:@"brandName"];
            product.price = [prod valueForKey:@"price"];
            product.productPage = [prod valueForKey:@"productPage"];
            [indexPaths addObject:[NSIndexPath indexPathForRow:row inSection:0]];
            row++;
            
        }
         _products = [Product MR_findAll];
        [productsTableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
       
//        [productsTableView reloadData];
        loading = NO;
        
    } failure:^(NSError *error) {
         loading = NO;
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
    productCell.productDescriptionLabel.text = product.brandName;

    return productCell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint contentOffset =  scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize contentSize = scrollView.contentSize;
    UIEdgeInsets insets = scrollView.contentInset;
    float y = contentOffset.y + bounds.size.height - insets.bottom;
    float reloadThreshold = 6;
    if(y > contentSize.height + reloadThreshold) {
        if(!loading){
            unsigned long from = _products != nil ? _products.count : 0;
            [self fetchProductsFrom:from count:PRODUCT_COUNT];
        }
    }


}

#pragma mark - segue method
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowProductDetails"]){
        ProductDetailsViewController *productDetailsViewController = (ProductDetailsViewController *)segue.destinationViewController
        ;
        NSIndexPath *indexPath = [productsTableView
                                    indexPathForSelectedRow];
        productDetailsViewController.product = [_products objectAtIndex:indexPath.row];
        NSLog(@"%@",productDetailsViewController.product.productPage);
    }
}

@end
