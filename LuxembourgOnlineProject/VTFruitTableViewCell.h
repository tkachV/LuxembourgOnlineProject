//
//  VTFruitTableViewCell.h
//  LuxembourgOnlineProject
//
//  Created by 1 on 08.09.16.
//  Copyright © 2016 VladislavT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VTFruitTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *smallFruitImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end
