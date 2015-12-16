//
//  ListViewController.m
//  FlickrApp
//
//  Created by Alexander Vishnivetskiy on 12/15/15.
//  Copyright © 2015 Alexander Vishnivetskiy. All rights reserved.
//

#import "ListViewController.h"
#import "FlickrAPI.h"
#import "User+CoreDataProperties.h"
#import "PicturesViewController.h"
#import "NSManagedObjectContext+MainContext.h"
#import "NSManagedObject+CoreData.h"

@interface ListViewController ()
@property (nonatomic, strong, readwrite) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ListViewController

@synthesize fetchedResultsController = _fetchedResultsController;

- (NSFetchedResultsController *)fetchedResultsController {
    if (!_fetchedResultsController) {
        _fetchedResultsController = [User fetchedResultsSortedBy:@"name"
                                                          ascending:YES
                                                          predicate:nil
                                                          groupedBy:nil
                                                          inContext:[NSManagedObjectContext mainContext]];
        _fetchedResultsController.delegate = self;
    }
    return _fetchedResultsController;
}

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
