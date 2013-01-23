//
//  mng_mcoolViewController.h
//  MCool
//
//  Created by Marcio Garcia on 1/21/13.
//  Copyright (c) 2013 mng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mng_mcoolViewController : UIViewController {

}
@property (weak, nonatomic) IBOutlet UILabel *labelConexao;

@property (weak, nonatomic) IBOutlet UILabel *labelCarregandoProdutos;
@property (weak, nonatomic) IBOutlet UIButton *buttonDoar099;
@property (weak, nonatomic) IBOutlet UIButton *buttonDoar199;
@property (weak, nonatomic) IBOutlet UIButton *buttonDoar299;


- (IBAction)doar99:(id)sender;
- (IBAction)doar199:(id)sender;
- (IBAction)doar299:(id)sender;

@end
