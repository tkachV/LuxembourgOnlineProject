//
//  VTFruitSection.h
//  LuxembourgOnlineProject
//
//  Created by 1 on 09.09.16.
//  Copyright © 2016 VladislavT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface VTFruitSection : NSObject
@property (strong, nonatomic) NSString* nameSection;
@property (strong, nonatomic) UIImage* image;
@property (strong, nonatomic) NSMutableArray* itemsArray;
@end
