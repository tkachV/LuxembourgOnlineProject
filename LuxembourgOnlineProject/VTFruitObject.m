//
//  VTFruitObject.m
//  LuxembourgOnlineProject
//
//  Created by 1 on 08.09.16.
//  Copyright © 2016 VladislavT. All rights reserved.
//

#import "VTFruitObject.h"

@implementation VTFruitObject
- (VTFruitObject*)initWithName:(NSString*)name
                         price:(NSNumber*)price
                          kCal:(NSNumber*)kCal
                          fats:(NSNumber*)fats
                      proteins:(NSNumber*)proteins
                 carbohydrates:(NSNumber*)carbohydrates
                   description:(NSString*)description
                     fruitType:(VTFruitType*)type
                      andImage:(UIImage*)image{
    self = [super init];
    if (self) {
        self.name = name;
        self.price = price;
        self.kCal = kCal;
        self.fats = fats;
        self.proteins = proteins;
        self.carbohydrates = carbohydrates;
        self.descriptionString = description;
        self.type = type;
        self.image = image;
    }
    return self;
}
@end
