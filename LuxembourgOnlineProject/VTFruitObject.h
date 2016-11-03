//
//  VTFruitObject.h
//  LuxembourgOnlineProject
//
//  Created by 1 on 08.09.16.
//  Copyright © 2016 VladislavT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class VTFruitType;

@interface VTFruitObject : NSObject

@property (strong, nonatomic) NSNumber* kCal;
@property (strong, nonatomic) NSNumber* proteins;
@property (strong, nonatomic) NSNumber* fats;
@property (strong, nonatomic) NSNumber* carbohydrates;

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSNumber* price;
@property (strong, nonatomic) NSString* descriptionString;
@property (strong, nonatomic) VTFruitType* type;
@property (strong, nonatomic) UIImage* image;

- (VTFruitObject*)initWithName:(NSString*)name
                         price:(NSNumber*)price
                          kCal:(NSNumber*)kCal
                          fats:(NSNumber*)fats
                      proteins:(NSNumber*)proteins
                 carbohydrates:(NSNumber*)carbohydrates
                   description:(NSString*)description
                     fruitType:(VTFruitType*)type
                      andImage:(UIImage*)image;
@end
