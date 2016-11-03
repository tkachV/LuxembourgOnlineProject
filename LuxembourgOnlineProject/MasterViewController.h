//
//  MasterViewController.h
//  LuxembourgOnlineProject
//
//  Created by 1 on 08.09.16.
//  Copyright © 2016 VladislavT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <UISearchBarDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
- (IBAction)showBasketAction:(UIBarButtonItem *)sender;

@end

