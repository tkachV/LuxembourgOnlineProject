//
//  DetailViewController.m
//  LuxembourgOnlineProject
//
//  Created by 1 on 08.09.16.
//  Copyright © 2016 VladislavT. All rights reserved.
//

#import "DetailViewController.h"
#import "VTAppManager.h"

@interface DetailViewController ()
@property (strong, nonatomic) NSString* currentItemName;
@property (strong, nonatomic) NSNumber* currentItemWeight;
@property (strong, nonatomic) NSNumber* currentItemCost;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(VTFruitObject*)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.currentItemName = self.detailItem.name;
        self.currentItemWeight = @1.0;
        self.currentItemCost = self.detailItem.price;
        
        [self.navigationItem setTitle:self.detailItem.name];
        [self.priceValueLabel setText:[NSString stringWithFormat:@"%.2f UAH",[self.detailItem.price floatValue]]];
        [self.weightLabel setText:[NSString stringWithFormat:@"%.2f kg.",1.00]];
        [self.imageView setImage:self.detailItem.image];
        [self.kCalLabel setText:[NSString stringWithFormat:@"%.2f g.", [self.detailItem.kCal floatValue]]];
        [self.proteinLabel setText:[NSString stringWithFormat:@"%.2f g.", [self.detailItem.proteins floatValue]]];
        [self.fatsLabel setText:[NSString stringWithFormat:@"%.2f g.", [self.detailItem.fats floatValue]]];
        [self.carbohydratesLabel setText:[NSString stringWithFormat:@"%.2f g.", [self.detailItem.carbohydrates floatValue]]];
        
    }else{
        self.detailItem = [[VTAppManager sharedManager].fruitObjects firstObject];
        [self configureView];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderAction:(UISlider *)sender {
    [self.weightLabel setText:[NSString stringWithFormat:@"%.2f kg.",sender.value]];
    self.currentItemWeight = [NSNumber numberWithFloat:sender.value];
    
    [self.priceValueLabel setText:[NSString stringWithFormat:@"%.2f UAH",[self.detailItem.price floatValue]*sender.value]];
    self.currentItemCost = [NSNumber numberWithFloat:[self.detailItem.price floatValue]*sender.value];
}
#pragma mark - Action
- (IBAction)addToBasketAction:(UIButton *)sender {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:[NSString stringWithFormat:@"Do you really want to add %.2f kg. of %@ in the basket?",[self.currentItemWeight floatValue], self.currentItemName]
                                 message:[NSString stringWithFormat:@"COST = %.2f UAH", [self.currentItemCost floatValue]]
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"YES"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   
                               }];
    UIAlertAction* cancelButton = [UIAlertAction
                               actionWithTitle:@"NO"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   
                               }];
    
    
    [alert addAction:okButton];
    [alert addAction:cancelButton];
    
    [self presentViewController:alert animated:YES completion:nil];

}
@end
