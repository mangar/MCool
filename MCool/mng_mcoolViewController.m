//
//  mng_mcoolViewController.m
//  MCool
//
//  Created by Marcio Garcia on 1/21/13.
//  Copyright (c) 2013 mng. All rights reserved.
//

#import "mng_mcoolViewController.h"

#import "IAPHelper.h"
#import "RageIAPHelper.h"
#import "Reachability.h"


@interface mng_mcoolViewController () {
    NSArray *_products;
}
@end


@implementation mng_mcoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[self labelCarregandoProdutos] setHidden:NO];
    [[self buttonDoar099] setHidden:YES];
    [[self buttonDoar199] setHidden:YES];
    [[self buttonDoar299] setHidden:YES];
    
    // testa a conexao....
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    
    if (netStatus == NotReachable) {
        self.labelConexao.text = @"SEM Conexão";
    } else {
        self.labelConexao.text = @"Conexão OK";
    }

    //carregar a lista de produtos...
    [self reload];
    
}
- (void)didReceiveMemoryWarning {    [super didReceiveMemoryWarning];   }


- (void)reload {
    NSLog(@"* Carregando lista de produtos");
    _products = nil;
    [[RageIAPHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
        if (success) {
            _products = products;
            NSLog(@"  > produtos carregado  #%i", _products.count);
            [[self labelCarregandoProdutos] setHidden:YES];
            [[self buttonDoar099] setHidden:NO];
            [[self buttonDoar199] setHidden:NO];
            [[self buttonDoar299] setHidden:NO];
            
        } else {
            NSLog(@"  > produtos NAO carregados");
        }
    }];
    
}


- (IBAction)doar99:(id)sender {
    
    NSLog(@"* Doar 99");
    
    
    SKProduct *product = [self findProductByID:@"mng.mcool.prod.1"];
//    _products[0];
    
    NSLog(@"  > buying %@...", product.productIdentifier);
    [[RageIAPHelper sharedInstance] buyProduct:product];
    
    

    
    
    NSLog(@"** Doar 99");
    
}

- (IBAction)doar199:(id)sender {
    NSLog(@"* Doar 1.99");
        
    SKProduct *product = [self findProductByID:@"mng.mcool.prod.2"];
    
    NSLog(@"  > buying %@...", product.productIdentifier);
    [[RageIAPHelper sharedInstance] buyProduct:product];
    
    NSLog(@"** Doar 1.99");
}

- (IBAction)doar299:(id)sender {
    NSLog(@"* Doar 2.99");
    
    SKProduct *product = [self findProductByID:@"mng.mcool.prod.3"];
    
    NSLog(@"  > buying %@...", product.productIdentifier);
    [[RageIAPHelper sharedInstance] buyProduct:product];
    
    NSLog(@"** Doar 2.99");
}


- (SKProduct *)findProductByID:(NSString *)_id {
    SKProduct *prod;
    if (_products && _products.count > 0) {
        for (SKProduct *inProd in _products) {
            if ([inProd.productIdentifier isEqualToString:_id]) {
                prod = inProd;
                break;
            }
        }
    }
    return prod;
}

@end
