//
//  MasterViewController.m
//  LuxembourgOnlineProject
//
//  Created by 1 on 08.09.16.
//  Copyright © 2016 VladislavT. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

#import "VTFruitObject.h"
#import "VTFruitType.h"
#import "VTFruitTableViewCell.h"
#import "VTAppManager.h"
#import "VTFruitSection.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@property (strong, nonatomic) NSArray* fruitObjects;
@property (strong, nonatomic) NSArray* fruitTypes;
@property (strong, nonatomic) NSArray* fruitSections;

@property (weak, nonatomic) VTAppManager* manager;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:20/255.0 green:175/255.0 blue:52/255.0 alpha:0.33f]];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.fruitSections = [NSMutableArray array];
    self.manager = [VTAppManager sharedManager];
    self.fruitObjects = [self.manager fruitObjects];
    self.fruitTypes = [[self.manager fruitTypes] allValues];
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [self.fruitTypes sortedArrayUsingDescriptors:sortDescriptors];
    self.fruitTypes = sortedArray;
    


    self.fruitSections = [self generateSectionsFromArray:self.fruitObjects withFilter:self.searchBar.text];
    

    
    [self.tableView reloadData];
}
- (NSArray*) generateSectionsFromArray:(NSArray*) array withFilter:(NSString*)filterString{
    NSMutableArray* sections = [NSMutableArray array];
    
    for (VTFruitType* type in self.fruitTypes) {
        VTFruitSection* section = [[VTFruitSection alloc]init];
        section.nameSection = type.name;
        section.image = type.image;
        section.itemsArray = [NSMutableArray array];
        for (VTFruitObject* object in array) {
            if (filterString != nil && ![filterString isEqualToString:@""]) {
                if ([object.name rangeOfString:filterString].location == NSNotFound) {
                    continue;
                }
            }
            
            if ([object.type.name isEqual:type.name]) {
                [section.itemsArray addObject:object];
            }
        }
        [sections addObject:section];
    }
    return sections;

}
- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSMutableArray* fruitArray = [NSMutableArray array];
        VTFruitType* fruitType = [self.fruitTypes objectAtIndex:indexPath.section];
        
        for (VTFruitObject* object in self.fruitObjects) {
            if ([object.type isEqual:fruitType]) {
                [fruitArray addObject:object];
            }
        }
        VTFruitObject* currentFruit = [fruitArray objectAtIndex:indexPath.row];
        
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:currentFruit];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.fruitSections count];
}
//- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    NSMutableArray* array = [NSMutableArray array];
//    for (VTFruitSection* section in self.fruitSections) {
//        [array addObject:section.nameSection];
//    }
//    return array;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    VTFruitSection* fruitSection = [self.fruitSections objectAtIndex:section];
    
    return [fruitSection.itemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* myCellIdentifier = @"fruitCell";
    VTFruitTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:myCellIdentifier forIndexPath:indexPath];

    if (!cell) {
        cell = [[VTFruitTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:myCellIdentifier];
        
    }


    VTFruitSection* fruitSection = [self.fruitSections objectAtIndex:indexPath.section];

    
    VTFruitObject* currentFruit = [fruitSection.itemsArray objectAtIndex:indexPath.row];
    [cell.titleLabel setText:currentFruit.name];
    [cell.subtitleLabel setText:[NSString stringWithFormat:@"%.2f UAH",[currentFruit.price floatValue]]];
    [cell.imageView setImage:currentFruit.image];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView* aView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];

    [aView setBackgroundColor:[UIColor colorWithRed:255/255.0 green:179/255.0 blue:0/255.0 alpha:0.33f]];
    
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, tableView.frame.size.width-100, 30)];
    
    VTFruitSection* fruitSection = [self.fruitSections objectAtIndex:section];
    [imageView setImage:fruitSection.image];
    [label setText:fruitSection.nameSection];
    
    [aView addSubview:imageView];
    [aView addSubview:label];
    return aView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
 return 50;
}
#pragma mark - UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    self.fruitSections = [self generateSectionsFromArray:self.fruitObjects withFilter:searchText];
    [self.tableView reloadData];
}
#pragma mark - Action
- (IBAction)showBasketAction:(UIBarButtonItem *)sender {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Sorry:( \n This part of the application functionality is not yet implemented."
                                 message:@"You can continue to browse other content."
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                
                               }];

    
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
