//
//  VTAppManager.m
//  LuxembourgOnlineProject
//
//  Created by 1 on 08.09.16.
//  Copyright © 2016 VladislavT. All rights reserved.
//

#import "VTAppManager.h"
#import "VTFruitType.h"
#import "VTFruitObject.h"

@implementation VTAppManager

+ (VTAppManager*) sharedManager{
    
    static VTAppManager* manager= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[VTAppManager alloc] init];
    });
    return manager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fruitObjects = [NSArray arrayWithArray:[self prepareFruitObjectsArray]];
    }
    return self;
}
- (NSMutableArray*) prepareFruitObjectsArray{
    NSDictionary* typeDictionary = [NSDictionary dictionary];
    
    VTFruitType* appleType = [[VTFruitType alloc]init];
    appleType.name = @"Apple";
    appleType.image = [UIImage imageNamed:@"apple.png"];
    
    VTFruitType* citrusType = [[VTFruitType alloc]init];
    citrusType.name = @"Citrus";
    citrusType.image = [UIImage imageNamed:@"orange.png"];
    
    VTFruitType* grapesType = [[VTFruitType alloc]init];
    grapesType.name = @"Grapes";
    grapesType.image = [UIImage imageNamed:@"grapes.png"];
    
    VTFruitType* exoticType = [[VTFruitType alloc]init];
    exoticType.name = @"Exotic";
    exoticType.image = [UIImage imageNamed:@"papaya.png"];
    
    typeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:appleType, appleType.name, citrusType, citrusType.name, grapesType, grapesType.name, exoticType, exoticType.name, nil];
    self.fruitTypes = typeDictionary;
    
    NSMutableArray* resultArray = [NSMutableArray array];

    NSArray* nameArray = @[@"Apple Golder",
                           @"Apple Ukrainian",
                           @"Apple Semerenko",
                           @"Lemon",
                           @"Grapefruit",
                           @"Lime",
                           @"Mandarin",
                           @"Grapes Black",
                           @"Grapes Arkadіya",
                           @"Grapes Sultana",
                           @"Grapes Pink",
                           @"Pepino",
                           @"Feijoa",
                           @"Fresh Figs",
                           @"Red Pitahaya" ];
    
    NSArray* priceArray = @[@12.99, @9.19, @15.99, @53.99, @37.99, @72.99, @49.99, @46.99, @54.99, @32.99, @89.99, @109.99, @659.99, @159.99, @147.99];
    NSArray* kCalArray = @[@45.0, @45.0, @45.0, @33.0, @35.0, @29.9, @33.0, @65.0, @65.0, @65.0, @65.0, @65.0, @52.5, @67.5, @50.0];
    NSArray* fatsArray = @[@0.4, @0.4, @0.4, @0.1, @0.2, @0.1, @0.2, @0.2, @0.2, @0.2, @0.2, @0.0, @0.9, @0.2, @0.6];
    NSArray* proteinsArray = @[@0.4, @0.4, @0.4, @0.9, @0.9, @0.7, @0.8, @0.6, @0.6, @0.6, @0.6, @0.0, @1.0, @1.0, @0.5];
    NSArray* carbohydratesArray = @[@11.8, @11.8, @11.8, @4.9, @8.7, @10.6, @7.5, @16.5, @16.5, @16.5, @16.5, @13.3, @11.7, @17.8, @14.0];
    NSArray* typesArray = @[appleType, appleType, appleType, citrusType, citrusType, citrusType, citrusType, grapesType, grapesType, grapesType, grapesType, exoticType, exoticType, exoticType, exoticType];
    
    NSArray* imageArray = @[[UIImage imageNamed:@"apple_golden.jpg"],
                            [UIImage imageNamed:@"apple_ukr.jpg"],
                            [UIImage imageNamed:@"apple_semerenko.jpg"],
                            [UIImage imageNamed:@"citrus_limon.jpg"],
                            [UIImage imageNamed:@"citrus_grapefruit.jpg"],
                            [UIImage imageNamed:@"citrus_lime.jpg"],
                            [UIImage imageNamed:@"citrus_mandarin.jpg"],
                            [UIImage imageNamed:@"grapes_black.png"],
                            [UIImage imageNamed:@"grapes_arkadiya.jpg"],
                            [UIImage imageNamed:@"grapes_sultana.jpg"],
                            [UIImage imageNamed:@"grapes_pink.png"],
                            [UIImage imageNamed:@"exotic_pepino.jpg"],
                            [UIImage imageNamed:@"exotic_feijoa.jpg"],
                            [UIImage imageNamed:@"exotic_figs.jpg"],
                            [UIImage imageNamed:@"exotic_pitahaya.jpg"] ];
    
    for (int i = 0; i < nameArray.count; i++) {
        VTFruitObject* obj = [[VTFruitObject alloc] initWithName:[nameArray objectAtIndex:i]
                                                           price:[priceArray objectAtIndex:i]
                                                            kCal:[kCalArray objectAtIndex:i]
                                                            fats:[fatsArray objectAtIndex:i]
                                                        proteins:[proteinsArray objectAtIndex:i]
                                                   carbohydrates:[carbohydratesArray objectAtIndex:i]
                                                     description:@""
                                                       fruitType:[typesArray objectAtIndex:i]
                                                        andImage:[imageArray objectAtIndex:i]];
        [resultArray addObject:obj];
    }

    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [resultArray sortedArrayUsingDescriptors:sortDescriptors];
    resultArray = [NSMutableArray arrayWithArray:sortedArray];
    
    return resultArray;
}

@end
