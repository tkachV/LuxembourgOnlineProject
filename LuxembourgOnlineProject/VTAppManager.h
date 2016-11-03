//
//  VTAppManager.h
//  LuxembourgOnlineProject
//
//  Created by 1 on 08.09.16.
//  Copyright © 2016 VladislavT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VTAppManager : NSObject

@property (strong, nonatomic) NSArray* fruitObjects;
@property (strong, nonatomic) NSDictionary* fruitTypes;


+ (VTAppManager*) sharedManager;
- (NSArray*) prepareFruitObjectsArray;

@end
