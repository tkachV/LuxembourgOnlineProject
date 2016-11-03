//
//  DetailViewController.h
//  LuxembourgOnlineProject
//
//  Created by 1 on 08.09.16.
//  Copyright © 2016 VladislavT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VTFruitObject.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) VTFruitObject* detailItem;

@property (weak, nonatomic) IBOutlet UILabel *kCalLabel;
@property (weak, nonatomic) IBOutlet UILabel *proteinLabel;
@property (weak, nonatomic) IBOutlet UILabel *fatsLabel;
@property (weak, nonatomic) IBOutlet UILabel *carbohydratesLabel;

@property (weak, nonatomic) IBOutlet UILabel *weightLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceValueLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)sliderAction:(UISlider *)sender;
- (IBAction)addToBasketAction:(UIButton *)sender;

@end

